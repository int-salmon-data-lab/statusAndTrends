# statusAndTrends

# Version 0.0.0.9000 in development

* Just getting started on project.
* Focus on transforming incoming spreadsheet data to a graph representation in Neo4j.
* Continue working with data from Ruggerone and Irvine (2018) Summary Tables 1-4.
* Need to think about any transformations that are needed, e.g. might want to convert their data to tidy data and then let one row be represented by one node (properties: year, measurement, location) with that node having relationship links to the metadata. 'location' should not be a property, but a relationship to a 'location' node, because there should be a 'location' node with its own properties. 'year' is okay as property, because it does not have any properties of its own.
* Need to add metadata into the process too.
* If it is not too difficult at this time, try to use Scott Akenhead's [taxonomy of node types, subtypes, and node properties](https://github.com/int-salmon-data-lab/salmosphere).
* Also, see a proposed [schema](https://www.lucidchart.com/documents/view/a9313e34-f6ca-4730-a17b-b591e0d7a725/0) that was developed for another graph database experiment at [ISDL](https://yearofthesalmon.org/project/international-salmon-data-laboratory/).
