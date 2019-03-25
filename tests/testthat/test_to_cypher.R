library(testthat)
library(magrittr)
library(dplyr)

context("Transforming table of data to Cypher strings")

test_that("Parameters are injected into a CREATE statement", {
  # Set up the Subject Under Test (SUT).
  expected_year <- 1952
  expected_value <- 6572562
  expected_unit <- "count"
  expected_place_label <- "Kod"
  cypher_strings <- build_datum_create_strings(
    year = expected_year, 
    value = expected_value, 
    place_label = expected_place_label
  )

  # Verify the CREATE statement.
  actual_create_string <- cypher_strings[[1]]
  expect_match(actual_create_string, "startInterval: '1952-01-01T00:00-UTC', endInterval: '1952-12-31T23:59-UTC'")
  expect_match(actual_create_string, "value: '6572562'")
  expect_match(actual_create_string, "uid: '.+{36}'")  # uid has 36 chars
  
  # Verify the MATCH statement
  actual_match_string <- cypher_strings[[2]]
  expect_match(actual_match_string, "CREATE \\(x)-\\[:hasPlace\\]->\\(y\\);")
  expect_match(actual_match_string, "x:Datum \\{uid: '.+{36}'\\}")  # uid has 36 chars
  expect_match(actual_match_string, sprintf("y:Place \\{label: '%s'\\}", expected_place_label))
})

test_that("All values in a data.frame are scaled", {
  expected_scale <- 2L
  unscaled <- tibble(
    Year = c(2012, 2013, 2014),
    A = c(97.9, 209.0, 59.5),
    B = c(16.2, 26.6, 13.4)
  )
  scaled <- scale_values(unscaled, scale = expected_scale)
  # Verify 'Year' column remains unchanged.
  expect_equivalent(scaled$Year, unscaled$Year)
  # Verify all other columns are scaled.
  expect_equal(scaled$A[[1]], round(97.9 * expected_scale))
  expect_equal(scaled$B[[3]], round(13.4 * expected_scale))
})

test_that("Abundance relationships are constructed", {
  actual_data <- abundance_to_cypher_datum()
  expect_true(length(actual_data) > 0)
})
