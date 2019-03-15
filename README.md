# Salmon Status and Trends

Datasets and related knowledge from [International Year of the Salmon](https://yearofthesalmon.org/) (IYS) [Workshop on Salmon Status and Trends](https://yearofthesalmon.org/salmon_event/international-year-of-salmon-iys-workshop-on-salmon-status-and-trends/). The workshop was held 23-24 January 2019 in Vancouver, BC, Canada.

[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)

> Disclaimer: this package is experimental and just getting started in development. Read the [NEWS.md](NEWS.md) for recent updates and current plans.

---

**Table of Contents**

1. [Description](#description)
1. [Data Sources](#data-sources)
    1. [Numbers and Biomass of Salmonids in the North Pacific Ocean](#numbers-and-biomass-of-salmonids-in-the-north-pacific-ocean)
1. [Installation](#installation)
1. [License](#license)

---

## Description
This is a prototype for loading and analyzing data about salmon, across species and across geographical areas. We use a graph database to represent data _and_ metadata joined together in the same database.

## Data Sources

### Numbers and Biomass of Salmonids in the North Pacific Ocean
Gregory T. Ruggerone, James R. Irvine. 2018. "[Numbers and Biomass of Natural‐ and Hatchery‐Origin Pink Salmon, Chum Salmon, and Sockeye Salmon in the North Pacific Ocean, 1925–2015"](https://afspubs.onlinelibrary.wiley.com/doi/full/10.1002/mcf2.10023), in [Marine and Coastal Fisheries: Dynamics, Management, and Ecosystem Science](https://afspubs.onlinelibrary.wiley.com/journal/19425120), [Volume 10, Issue 2, April 2018](https://afspubs.onlinelibrary.wiley.com/toc/19425120/2018/10/2), pages [152-168](https://afspubs.onlinelibrary.wiley.com/doi/full/10.1002/mcf2.10023). Available to read online at https://afspubs.onlinelibrary.wiley.com/doi/full/10.1002/mcf2.10023 or to download as a [PDF document](https://afspubs.onlinelibrary.wiley.com/doi/epdf/10.1002/mcf2.10023).

Data: A spreadsheet, [mcf210023-sup-0001-TableS1-S24.xlsx](https://afspubs.onlinelibrary.wiley.com/action/downloadSupplement?doi=10.1002%2Fmcf2.10023&file=mcf210023-sup-0001-TableS1-S24.xlsx), contains metadata and 24 tables of data referenced by the paper. There is some additional metadata in the paper itself, e.g. the `METHODS` section and the `Cautions Regarding Data Quality` section of the paper.

## Installation
This is an [R](https://www.r-project.org/) language project. You can install the latest (development) version of this `statusAndTrends` package from [GitHub](./) using the `install_github` command in R:

``` r
remotes::install_github("int-salmon-data-lab/statusAndTrends", build = TRUE, build_opts = "")
```

## License
Software in this project is licensed under the [MIT License](./LICENSE.md).
