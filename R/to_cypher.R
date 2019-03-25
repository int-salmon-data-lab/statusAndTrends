library(purrr)
library(dplyr)
library(uuid)

#' @export
build_datum_create_strings <- function(
  year, 
  value, 
  unit = 'count', 
  dataset_label,
  place_label
) {
  datum_uid <- purrr::map(1:length(year), function(index) {uuid::UUIDgenerate()})
  create_datum_statement <- sprintf(
    "CREATE (n:Datum {value: '%s', unit: '%s', startInterval: '%s-01-01T00:00-UTC', endInterval: '%s-12-31T23:59-UTC', uid: '%s'});", 
    value, 
    unit, 
    year, 
    year, 
    datum_uid
  )
  contains_statement <- sprintf(
    "MATCH (x:Dataset {label: '%s'}), (y:Datum {uid: '%s'}) CREATE (x)-[:contains]->(y);", 
    dataset_label,
    datum_uid
  )
  place_statement <- sprintf(
    "MATCH (x:Datum {uid: '%s'}), (y:Place {label: '%s'}) CREATE (x)-[:hasPlace]->(y);", 
    datum_uid, 
    place_label
  )
  return(c(create_datum_statement, contains_statement, place_statement))
}

#' @export
scale_values <- function(summary_table, scale = 1000000L) {
  scaled_value_cols <- summary_table %>% 
    dplyr::select(-Year) %>% 
    magrittr::multiply_by(scale) %>% 
    round()
  return(dplyr::bind_cols(dplyr::select(summary_table, Year), scaled_value_cols))
}

#' @export
abundance_to_cypher_datum <- function(dataset_label = "Supplementary Table 1") {
  st1 <- read_biomass_st1() %>% 
    scale_values(scale = 1000000L)
  place_labels <- names(st1)[-c(1, length(st1))]
  statements <- purrr::map(place_labels, function(label) {
    purrr::map2(
      select(st1, Year), 
      select(st1, label), 
      function(year, value) {
        build_datum_create_strings(
          year, 
          value, 
          unit = 'count', 
          dataset_label = dataset_label,
          place_label = label
        )
      }
    )
  })
}
