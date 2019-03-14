library(readxl)

ISDL_BIOMASS_DIR <- "North-Pacific-Salmon-Abundance-and-Biomass-Data"
ISDL_BIOMASS_SPREADSHEET <- "mcf210023-sup-0001-tables1-s24.xlsx"

#' Summary Table as a tibble from the biomass spreadsheet.
#' @param sheet integer position of the sheet, where 1 is the first sheet.
#' @param range string cell range. For example, "A6:P70". This range should include
#'     the row of headings, as well as the data.
read_biomass_summary_table <- function(sheet, range) {
  system.file("extdata", ISDL_BIOMASS_DIR, ISDL_BIOMASS_SPREADSHEET, package = "statusAndTrends") %>% 
    read_xlsx(sheet = sheet, range = range, na = "-")
}

#' Summary Table 1 'Natural-origin Pink Salmon' as a tibble.
#' @description Returns a tibble containing data from Summary Table 1 of
#'     the biomass data, which has abundance (catch and escapement in millions of fish) 
#'     of natural-origin Pink Salmon returning to regions of Asia and 
#'     North America, 1952-2015.
#' @return tibble with 16 columns of data:
#'    \enumerate{
#'      \item Year
#'      \item Korea
#'      \item Japan
#'      \item M&I					
#'      \item WKam
#'      \item EKam
#'      \item WAK
#'      \item SPen
#'      \item Kod
#'      \item CI
#'      \item PWS
#'      \item SEAK
#'      \item NBC
#'      \item SBC
#'      \item WA
#'      \item Total
#'    }
#' @export
read_biomass_st1 <- function() {
  read_biomass_summary_table(sheet = 5, range = "A6:P70")
}

#' Summary Table 2 'Natural-origin Chum Salmon' as a tibble.
#' @description Returns a tibble containing data from Summary Table 2 of
#'     the biomass data, which has abundance (catch and escapement in millions of fish) 
#'     of natural-origin Chum Salmon returning to regions of Asia and 
#'     North America, 1952-2015.
#' @return tibble with 16 columns of data:
#'    \enumerate{
#'      \item Year
#'      \item Korea
#'      \item Japan
#'      \item M&I					
#'      \item WKam
#'      \item EKam
#'      \item WAK
#'      \item SPen
#'      \item Kod
#'      \item CI
#'      \item PWS
#'      \item SEAK
#'      \item NBC
#'      \item SBC
#'      \item WA
#'      \item Total
#'    }
#' @export
read_biomass_st2 <- function() {
  read_biomass_summary_table(sheet = 5, range = "R6:AG70")
}

#' Summary Table 3 'Natural-origin Sockeye Salmon' as a tibble.
#' @description Returns a tibble containing data from Summary Table 3 of
#'     the biomass data, which has abundance (catch and escapement in millions of fish) 
#'     of natural-origin Sockeye Salmon returning to regions of Asia and 
#'     North America, 1952-2015.
#'     Canadian spawning channel produced fish are included.
#' @return tibble with 16 columns of data:
#'    \enumerate{
#'      \item Year
#'      \item Korea
#'      \item Japan
#'      \item M&I					
#'      \item WKam
#'      \item EKam
#'      \item WAK
#'      \item SPen
#'      \item Kod
#'      \item CI
#'      \item PWS
#'      \item SEAK
#'      \item NBC
#'      \item SBC
#'      \item WA
#'      \item Total
#'    }
#' @export
read_biomass_st3 <- function() {
  read_biomass_summary_table(sheet = 5, range = "AI6:AX70")
}

#' Summary Table 4 'Total natural-origin salmon' as a tibble.
#' @description Returns a tibble containing data from Summary Table 4 of
#'     the biomass data, which has total natural-origin salmon (millions of fish) 
#'     returning to regions of Asia and North America, 1952-2015.
#' @details The spreadsheet does not have a Year column in Summary Table 4.
#'     It is only implied. Therefore, we inject the year column from ST3, 
#'     because all 4 Summary Tables ST1, ST2, ST3, ST4 should have 
#'     a Year column with the same years across all tables.
#' @return tibble with 5 columns of data:
#'    \enumerate{
#'      \item Pink
#'      \item Chum
#'      \item Sockeye
#'      \item Total
#'      \item Year				
#'    }
#' @export
read_biomass_st4 <- function() {
  # Injects Year column from ST3, because there is no explicit Year column 
  # in ST4 in the spreadsheet.
  read_biomass_summary_table(sheet = 5, range = "AZ6:BC70") %>% 
    mutate(Year = read_biomass_st3()$Year)
}
