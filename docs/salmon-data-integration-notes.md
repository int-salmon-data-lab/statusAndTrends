# Salmon data integration
[Jim Tyhurst, Ph.D.](https://www.jimtyhurst.com/)  
2019-05-20

I captured a few thoughts in outline form after attending [The Second NPAFC-IYS Workshop on Salmon Ocean Ecology in a Changing Climate](https://npafc.org/workshop-2019-schedule/).

**Table of Contents**

1. [Independent aspects of a complete solution](#independent-aspects-of-a-complete-solution)
1. [Possible solution 1: All data centralized in one database](#possible-solution-1-all-data-centralized-in-one-database)
1. [Possible solution 2: Distributed datasets with centralized metadata](#possible-solution-2-distributed-datasets-with-centralized-metadata)
1. [Competitive analysis](#competitive-analysis)
1. [Types of data](#types-of-data)
1. [Project tips](#project-tips)
1. [Open Issues](#open-issues)


## Independent aspects of a complete solution

List of desired features for the overall system, although they should probably not be implemented in one monolithic piece of software:

* Catalog of datasets
* Integration of datasets
* Rich metadata linking:
    * versions of a dataset
    * provenance
    * data collection procedures
    * analyis procedures
    * related datasets
* Multiple views of data.
* Repeatable, automated, traceable process for importing data collected periodically.
* Repeatable, automated, traceable process for generating periodic reports, including repetitive analysis procedures.

## Possible solution 1: All data centralized in one database

This solution is what has been prototyped so far.

* Import all data into a central repository (Neo4j database).
* Integrate the data into previous datasets as the new data is ingested.
* Record all import steps as part of the metadata for traceability.
* Import metadata as well as data, so both are available in the repository.
* Write a "Salmon Data Service" layer as an API to make it easier to access data without needing to know Neo4j query language.
    * service layer returns JSON, so client can be any language (R, Python, JavaScript, ...)
    * service layer can be customized for different usage scenarios (browse datasets, publish periodic reports, extract a "view" from across multiple datasets, ...), specialized for salmon researchers and managers.

### Advantages of a centralized solution

* Easy to analyze multiple datasets, because all data has already been standardized.

### Disadvantages of a centralized solution

* Someone must define a standard that can represent all datasets.
  * Who defines the standards needed for a universal representation of salmon data?
  * How long does that take?
  * Who keeps it up to date?

## Possible solution 2: Distributed datasets with centralized metadata

* Implement each feature with the best software for that feature.
    * Neo4j is good for arbitrary, flexible relationships between data objects, such as metadata.
    * Relational database is good for table-based scientific sampling.
* Integrate the pieces into a distributed, integrated solution.
* Leave published datasets in their current location.
* Provide a searchable catalog of published data that contains:
    * metadata for each dataset
    * relationships between datasets
    * links to published data, rather than holding the data itself

### Advantages of a distributed solution

* Data producers, who know their own data best, are responsible for maintaining the data and any associated metdata. ISDL can provide guidance or even a hosting solution, if necessary, but we expect that researchers will host the data themselves or use an existing hosting solution for scientific data (see [Competitive analysis](#competitive-analysis) below).
* The metadata resides in a (Neo4j graph) database that is separate from the dataset it describes, so one can be changed without affecting the other.
* Much less work is required to import metadata compared to trying to standardizing and importing a full dataset.

### Disadvantages of a distributed solution
* Each data consumer is responsible for reformatting data if necessary, because the data is always in the original data producer's format.
* It is more difficult to assemble data from multiple source datasets, because the data consumer is responsible for standardizing the datasets, so that they can be compared.
* The metadata resides in a repository that is separate from the dataset, so the two can become out of synch, unless there is an external process in place to make sure that they are versioned together.

## Competitive analysis

To do ...

### How is this collection of datasets different than other systems that are already in use?

* It offers more flexible, more comprehensive metadata.
* It represents relationships between datasets.

#### Organizations that already host open data

* There are already a number of organizations that host scientific data, including:
    * The Knowledge Network for Biocomplexity (KNB) : https://knb.ecoinformatics.org/profile/CN=SASAP,DC=dataone,DC=org
    * United States Integrated Ocean Observing System (IOOS) : https://ioos.noaa.gov/community/global/
    * Canadian Integrated Ocean Observing System (CIOOS) : https://cioos.ca/
    * National Center for Ecological Analysis and Synthesis (NCEAS) : https://www.nceas.ucsb.edu/
    * Global Biodiversity Information Facility (GBIF) : https://www.gbif.org/
    * Open Science Framework (OSF) : https://osf.io/
    * Sitka Technology Group's GeoOptix : https://geooptix.com/
    * data.world : https://data.world/

Disclaimer: I have not analyzed these sites in depth. However for most of them, I entered "salmon" in the search bar to confirm that at least some salmon researchers or government agencies are storing some data there.

#### Software that already exists for hosting a data portal
There are other tools for implementing a data portal, rather than building your own using Neo4j. Therefore, it is worth spending a short time to evaluate alternatives, even if it is necessary to build a new solution to meet the specific needs of the salmon community.

* Comprehensive Knowledge Archive Network (CKAN) : https://ckan.org/
* Socrata : http://open-source.socrata.com/
* The Dataverse Project : https://dataverse.org/

Disclaimer: I came across these previously when working on a project for public government (civic) data. I have not investigated these for relevance to scientific data, although I know that some scientific organizations have used CKAN as a portal to their public data.

## Types of data

I heard many features mentioned during the workshop:

* salmon measures
    * individual characteristics
        * individual size
        * individual weight
        * energy density
        * fatty acid
        * sex
        * smolt size
        * diet samples
        * stomach fullness index
        * capture location
        * capture depth
    * group characteristics / aggregate measures
        * productivity
        * synchrony across stocks
        * variability with individual stocks
        * abundance
        * recruitment
        * catch
        * escapement
        * exploitation rates
        * maturation age
        * estuary residence time
        * growth rate
        * IGF-1
        * smolt to adult return (SAR)
        * migratory routes
    * tagging/telemetry
        * coded wire tag (CWT)
        * PIT
        * RFID
* environmental factors
    * ocean
        * sea surface temperature (SST)
        * chlorophyll A
        * atmospheric circulation index
        * strong winds, heavy rains, storms
        * NOAA ocean ecosystem indicator chart
        * Sea Level Pressure (SLP)
        * upwelling
        * downwelling
        * salinity
    * stream
        * turbidity
        * speed of waterflow
        * stream temperature
        * stream hydrology
            * water level
    * other animals
        * predators
        * competition
        * prey
            * ichthyoplankton biomass
            * herring size frequency
            * Northern Anchovy frequency of occurrence
            * ...

## Project tips

* Data _producers_ must receive some benefit from the system. Otherwise, they will not be motivated to share their data. Some possible benefits to a data producer:
    * Automated reporting of usage: The system can track how frequently a dataset is used. This may lead to some measure of prestige.
    * Citation of their work. The metadata makes it easy for data consumers to cite sources correctly.
    * Their work might be found more easily and more frequently.
* Data _consumers_ obviously benefit from the system, because they can find data more easily.
* Start small and build incrementally.
* Specify criteria for prioritizing datasets to be included, so that:
    * Datasets with the greatest benefit can be catalogued first.
    * Datasets demonstrate the end-to-end benefits of combining previously separate data to analyze new correlations and insights.
    * Pick groups of datasets that can be analyzed together. For example,
        * Different datasets from a single region (e.g. habitat features and stock counts for Fraser River); or
        * Similar datasets from multiple regions (e.g. abundance estimates for each NPAFC member country)

## Open Issues

* We heard from several people of their concern that making their data available publicly would expose it to misuse and misinterpretation. They worry that someone who does not understand the underlying assumptions will try to use the data for some purpose for which that data is not appropriate.
* What are the security requirements?
    * Is _all_ the data "open" (http://opendatahandbook.org/) and readable publicly by anyone?
    * Who is allowed to add data?
    * What is the process for reviewing data submissions?
* How are datasets maintained or versioned over time?
* Which type of license(s) will be used for the system? Which type of licenses will be accepted from data producers?
