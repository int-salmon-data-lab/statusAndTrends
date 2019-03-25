CREATE (n:Idea {type: 'taxonomy', label: 'Pink Salmon', description: 'Oncorhynchus gorbuscha', url: 'http://www.fishbase.us/summary/SpeciesSummary.php?ID=240'});
CREATE (n:Dataset {type: 'estimate', label: 'Supplementary Table 1', description: 'Time series annual numerical estimates of the abundance (catch and escapement in millions of fish) of natural-origin Pink Salmon returning to regions of Asia and North America, 1952-2015.', url: 'https://afspubs.onlinelibrary.wiley.com/action/downloadSupplement?doi=10.1002%2Fmcf2.10023&file=mcf210023-sup-0001-TableS1-S24.xlsx'});
MATCH (x:Dataset {label: 'Supplementary Table 1'}),(y:Idea {label: 'Pink Salmon'}) CREATE (x)-[:describes]->(y);

CREATE (n:Document {type: 'publication', label: 'Ruggerone & Irvine (2018)', title: 'Numbers and Biomass of Natural‐ and Hatchery‐Origin Pink Salmon, Chum Salmon, and Sockeye Salmon in the North Pacific Ocean, 1925–2015', description: 'Numerical abundance and biomass values presented here for Pink Salmon Oncorhynchus gorbuscha, Chum Salmon O. keta, and Sockeye Salmon O. nerka in the North Pacific Ocean span 90 years (1925–2015), representing the most comprehensive compilation of these data to date.'});
MATCH (x:Document {label: 'Ruggerone & Irvine (2018)'}),(y:Dataset {label: 'Supplementary Table 1'}) CREATE (x)-[:describes]->(y);

CREATE (n:Activity {type: 'stockAssessment', label: 'Pink Salmon numerical abundance', description: 'Comprehensive compilation of numerical abundance and biomass values of salmon in the North Pacific Ocean.', method: 'Compiled all available annual data for the period 1952–2005 on catches, spawner abundances, harvest rates, and abundances of wild and hatchery‐released adults of these species from South Korea, Japan, Russia, Alaska, British Columbia, and Washington (including the Columbia River). The resulting data series were aggregated into 135 major pink salmon, chum salmon, and sockeye salmon population groups (Mantua et al. 2009) within 19 regions (Figure 1).'});
MATCH (x:Document {label: 'Ruggerone & Irvine (2018)'}),(y:Activity {label: 'Pink Salmon numerical abundance'}) CREATE (x)-[:describes]->(y);
MATCH (x:Activity {label: 'Pink Salmon numerical abundance'}),(y:Dataset {label: 'Supplementary Table 1'}) CREATE (x)-[:produces]->(y);

CREATE (n:Citation {type: 'journalArticle', label: 'Ruggerone & Irvine (2018)', author: 'Gregory T. Ruggerone; James R. Irvine', date: '2018-04-04', title: 'Numbers and Biomass of Natural‐ and Hatchery‐Origin Pink Salmon, Chum Salmon, and Sockeye Salmon in the North Pacific Ocean, 1925–2015', journal: 'Marine and Coastal Fisheries: Dynamics, Management, and Ecosystem Science', volume: '10', issue: '2', issue_date: 'April 2018', pages: '152-168', url: 'https://afspubs.onlinelibrary.wiley.com/doi/full/10.1002/mcf2.10023', note: 'Accessed on 2019-03-15'});
MATCH (x:Citation {label: 'Ruggerone & Irvine (2018)'}),(y:Document {label: 'Ruggerone & Irvine (2018)'}) CREATE (x)-[:identifies]->(y);

CREATE (n:Person {label: 'Gregory T. Ruggerone', name: 'Gregory T. Ruggerone'});
MATCH (x:Citation {label: 'Ruggerone & Irvine (2018)'}),(y:Person {name: 'Gregory T. Ruggerone'}) CREATE (x)-[:hasAuthor]->(y);

CREATE (n:Person {label: 'James R. Irvine', name: 'James R. Irvine'});
MATCH (x:Citation {label: 'Ruggerone & Irvine (2018)'}),(y:Person {name: 'James R. Irvine'}) CREATE (x)-[:hasAuthor]->(y);

CREATE (n:Place {type: 'marine', label: 'Korea', name: 'Korea', description: 'Survey area surrounding South Korea as specified in Ruggerone and Irvine (2018).'});
CREATE (n:Place {type: 'marine', label: 'Japan', name: 'Japan', description: 'Survey area surrounding South Korea as specified in Ruggerone and Irvine (2018).'});
CREATE (n:Place {type: 'marine', label: 'M&I', name: 'Mainland and islands of Russia', description: 'Survey area of mainland and islands of Russia as specified in Ruggerone and Irvine (2018).'});
CREATE (n:Place {type: 'marine', label: 'WKam', name: 'western Kamchatka', description: 'Survey area of western Kamchatka as specified in Ruggerone and Irvine (2018).'});
CREATE (n:Place {type: 'marine', label: 'EKam', name: 'eastern Kamchatka', description: 'Survey area of eastern Kamchatka as specified in Ruggerone and Irvine (2018).'});
CREATE (n:Place {type: 'marine', label: 'WAK', name: 'western Alaska', description: 'Survey area of western Alaska as specified in Ruggerone and Irvine (2018).'});
CREATE (n:Place {type: 'marine', label: 'SPen', name: 'southern Alaska Peninsula', description: 'Survey area of southern Alaska Peninsula as specified in Ruggerone and Irvine (2018).'});
CREATE (n:Place {type: 'marine', label: 'Kod', name: 'Kodiak', description: 'Survey area surrounding Kodiak Island, Alaska, United States as specified in Ruggerone and Irvine (2018).'});
CREATE (n:Place {type: 'marine', label: 'CI', name: 'Cook Inlet', description: 'Survey area of Cook Inlet as specified in Ruggerone and Irvine (2018).'});
CREATE (n:Place {type: 'marine', label: 'PWS', name: 'Prince William Sound', description: 'Survey area of Prince William Sound as specified in Ruggerone and Irvine (2018).'});
CREATE (n:Place {type: 'marine', label: 'SEAK', name: 'Southeast Alaska and Yakutat', description: 'Survey area of Southeast Alaska and Yakutat as specified in Ruggerone and Irvine (2018).'});
CREATE (n:Place {type: 'marine', label: 'NBC', name: 'northern British Columbia', description: 'Survey area of northern British Columbia as specified in Ruggerone and Irvine (2018).'});
CREATE (n:Place {type: 'marine', label: 'SBC', name: 'southern British Columbia', description: 'Survey area of southern British Columbia as specified in Ruggerone and Irvine (2018).'});
CREATE (n:Place {type: 'marine', label: 'WC', name: 'West Coast', description: 'Survey area of the West Coast of the United States as specified in Ruggerone and Irvine (2018).'});
MATCH (x:Document {label: 'Ruggerone & Irvine (2018)'}),(y:Place {type: 'marine'}) CREATE (x)-[:describes]->(y);
