library(purrr)
library(dplyr)
library(uuid)

#' @export
build_datum_create_strings <- function(year, value, unit = 'count', place_label) {
  datum_uid <- uuid::UUIDgenerate()
  create_statement <- sprintf("CREATE (n:Datum {value: '%s', unit: '%s', startInterval: '%s-01-01T00:00-UTC', endInterval: '%s-12-31T23:59-UTC', uid: '%s'});", value, unit, year, year, datum_uid)
  match_statement <- sprintf("MATCH (x:Datum {uid: '%s'}), (y:Place {label: '%s'}) CREATE (x)-[r:hasPlace]->(y);", datum_uid, place_label)
  return(c(create_statement, match_statement))
}

#' @export
abundance_to_cypher_datum <- function(
  dataset_label = "Supplementary Table 1"
) {
  st1 <- read_biomass_st1()
  st1_data_cols <- st1 %>% 
    dplyr::select(-Year)
  st1_scaled_cols <- round(st1_data_cols * 1000000L)
  st1_scaled <- dplyr::bind_cols(st1$Year, st1_scaled_cols)
  
}
