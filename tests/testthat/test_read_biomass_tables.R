library(testthat)
library(magrittr)
library(dplyr)

TOLERANCE = 0.01

context("Reading biomass tables")

test_that("Summary Table 1 has 64 rows", {
  st1 <- read_biomass_st1()
  expect_equal(nrow(st1), 64)
})

test_that("Summary Table 1 covers Year 1952 - 2015", {
  st1 <- read_biomass_st1()
  expect_equal(min(st1$Year), 1952)
  expect_equal(max(st1$Year), 2015)
})

test_that("Summary Table 1 Total in 2015 is 442.8", {
  actual_total <- read_biomass_st1() %>% 
    dplyr::filter(Year == 2015) %>% 
    magrittr::extract2("Total")
  expect_equal(actual_total, 442.8, tolerance = TOLERANCE)
})

test_that("Summary Table 2 Total in 2015 is 86.9", {
  actual_total <- read_biomass_st2() %>% 
    dplyr::filter(Year == 2015) %>% 
    magrittr::extract2("Total")
  expect_equal(actual_total, 86.9, tolerance = TOLERANCE)
})

test_that("Summary Table 2 'Japan' column has no data", {
  st2 <- read_biomass_st2()
  expected_n_rows <- nrow(st2)
  actual_n_na <- st2 %>% 
    select(Japan) %>% 
    is.na() %>% 
    sum()
  expect_equal(actual_n_na, expected_n_rows, tolerance = TOLERANCE)
})

test_that("Summary Table 3 Total in 2015 is 106.2", {
  actual_total <- read_biomass_st3() %>% 
    dplyr::filter(Year == 2015) %>% 
    magrittr::extract2("Total")
  expect_equal(actual_total, 106.2, tolerance = TOLERANCE)
})

test_that("Summary Table 4 Total in 2015 is 636.0", {
  actual_total <- read_biomass_st4() %>% 
    dplyr::filter(Year == 2015) %>% 
    magrittr::extract2("Total")
  expect_equal(actual_total, 636.0, tolerance = TOLERANCE)
})

test_that("Summary Table 4 has same years as ST 3", {
  expect_equal(read_biomass_st3()$Year, read_biomass_st4()$Year)
})
