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
  print(actual_create_string)
  expect_match(actual_create_string, "startInterval: '1952-01-01T00:00-UTC', endInterval: '1952-12-31T23:59-UTC'")
  expect_match(actual_create_string, "value: '6572562'")
  expect_match(actual_create_string, "uid: '.+{36}'")  # uid has 36 chars
  
  # Verify the MATCH statement
  actual_match_string <- cypher_strings[[2]]
  print(actual_match_string)
  expect_match(actual_match_string, "CREATE \\(x)-\\[r:hasPlace\\]->\\(y\\);")
  expect_match(actual_match_string, "x:Datum \\{uid: '.+{36}'\\}")  # uid has 36 chars
  expect_match(actual_match_string, sprintf("y:Place \\{label: '%s'\\}", expected_place_label))
})

