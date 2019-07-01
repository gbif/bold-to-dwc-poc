-- Replace the path /Path/to/bold-to-dwc-poc/checklist/taxa/ according to fit your location of bold-to-dwc-poc 

SELECT "Animalia", "Animalia",  "Animalia", "", "", "Animalia", "", "kingdom", ""
UNION ALL
SELECT
CONCAT("http://bins.boldsystems.org/index.php/Taxbrowser_Taxonpage?taxid=", phylum_taxID),
CONCAT("http://bins.boldsystems.org/index.php/Taxbrowser_Taxonpage?taxid=", phylum_taxID),
CONCAT("http://bins.boldsystems.org/index.php/Taxbrowser_Taxonpage?taxid=", phylum_taxID),
"Animalia",
"",
phylum_name,
CONCAT("http://bins.boldsystems.org/index.php/Taxbrowser_Taxonpage?taxid=", phylum_taxID),
"phylum",
""
INTO OUTFILE '/Path/to/bold-to-dwc-poc/checklist/taxa/animaliaphylum.txt'
  FIELDS TERMINATED BY '\t' 
  LINES TERMINATED BY '\n'
  from boldtaxonomy bt where phylum_name IN ("Acanthocephala",
    "Acoelomorpha",
    "Annelida",
    "Brachiopoda",
    "Bryozoa",
    "Chaetognatha",
    "Cnidaria",
    "Chordata",
    "Ctenophora",
    "Cycliophora",
    "Echinodermata",
    "Entoprocta",
    "Gastrotricha",
    "Gnathostomulida",
    "Hemichordata",
    "Kinorhyncha",
    "Mollusca",
    "Nematoda",
    "Nematomorpha",
    "Nemertea",
    "Onychophora",
    "Phoronida",
    "Placozoa",
    "Platyhelminthes",
    "Porifera",
    "Priapulida",
    "Rhombozoa",
    "Rotifera",
    "Sipuncula",
    "Tardigrada",
    "Xenacoelomorpha",
    "Arthropoda") group by bt.phylum_taxID;

SELECT "Plantae", "Plantae",  "Plantae", "", "", "Plantae", "", "kingdom", ""
UNION ALL
SELECT 
CONCAT("http://bins.boldsystems.org/index.php/Taxbrowser_Taxonpage?taxid=", phylum_taxID),
CONCAT("http://bins.boldsystems.org/index.php/Taxbrowser_Taxonpage?taxid=", phylum_taxID),
CONCAT("http://bins.boldsystems.org/index.php/Taxbrowser_Taxonpage?taxid=", phylum_taxID),
"Plantae",
"",
phylum_name,
CONCAT("http://bins.boldsystems.org/index.php/Taxbrowser_Taxonpage?taxid=", phylum_taxID),
"phylum",
""
INTO OUTFILE '/Path/to/bold-to-dwc-poc/checklist/taxa/plantphylum.txt'
  FIELDS TERMINATED BY '\t' 
  LINES TERMINATED BY '\n'
  from boldtaxonomy bt where phylum_name IN ("Bryophyta" ,
    "Chlorophyta",
    "Lycopodiophyta",
    "Magnoliophyta",
    "Pinophyta",
    "Pteridophyta",
    "Rhodophyta") group by bt.phylum_taxID;

    SELECT "Fungi", "Fungi",  "Fungi", "", "", "Fungi", "", "kingdom", ""
UNION ALL
SELECT 
CONCAT("http://bins.boldsystems.org/index.php/Taxbrowser_Taxonpage?taxid=", phylum_taxID),
CONCAT("http://bins.boldsystems.org/index.php/Taxbrowser_Taxonpage?taxid=", phylum_taxID),
CONCAT("http://bins.boldsystems.org/index.php/Taxbrowser_Taxonpage?taxid=", phylum_taxID),
"Fungi",
"",
phylum_name,
CONCAT("http://bins.boldsystems.org/index.php/Taxbrowser_Taxonpage?taxid=", phylum_taxID),
"phylum",
""
INTO OUTFILE '/Path/to/bold-to-dwc-poc/checklist/taxa/fungiphylum.txt'
  FIELDS TERMINATED BY '\t' 
  LINES TERMINATED BY '\n'
  from boldtaxonomy bt where phylum_name IN ("Ascomycota",
    "Basidiomycota",
    "Chytridiomycota",
    "Glomeromycota",
    "Myxomycota",
    "Zygomycota") group by bt.phylum_taxID;

    SELECT "Protista", "Protista",  "Protista", "", "", "Protista", "", "kingdom", ""
UNION ALL
SELECT
CONCAT("http://bins.boldsystems.org/index.php/Taxbrowser_Taxonpage?taxid=", phylum_taxID),
CONCAT("http://bins.boldsystems.org/index.php/Taxbrowser_Taxonpage?taxid=", phylum_taxID),
CONCAT("http://bins.boldsystems.org/index.php/Taxbrowser_Taxonpage?taxid=", phylum_taxID),
"Protista",
"",
phylum_name,
CONCAT("http://bins.boldsystems.org/index.php/Taxbrowser_Taxonpage?taxid=", phylum_taxID),
"phylum",
""
INTO OUTFILE '/Path/to/bold-to-dwc-poc/checklist/taxa/protistphylum.txt'
  FIELDS TERMINATED BY '\t' 
  LINES TERMINATED BY '\n'
  from boldtaxonomy bt where phylum_name IN (    "Chlorarachniophyta",
    "Ciliophora",
    "Heterokontophyta",
    "Pyrrophycophyta" ) group by bt.phylum_taxID;


SELECT 
CONCAT("http://bins.boldsystems.org/index.php/Taxbrowser_Taxonpage?taxid=", class_taxID),
CONCAT("http://bins.boldsystems.org/index.php/Taxbrowser_Taxonpage?taxid=", class_taxID),
CONCAT("http://bins.boldsystems.org/index.php/Taxbrowser_Taxonpage?taxid=", class_taxID),
CONCAT("http://bins.boldsystems.org/index.php/Taxbrowser_Taxonpage?taxid=", phylum_taxID),
"",
class_name,
CONCAT("http://bins.boldsystems.org/index.php/Taxbrowser_Taxonpage?taxid=", class_taxID),
"class",
""
INTO OUTFILE '/Path/to/bold-to-dwc-poc/checklist/taxa/classes.txt'
  FIELDS TERMINATED BY '\t' 
  LINES TERMINATED BY '\n'
  from boldtaxonomy bt where class_taxID > 0 group by bt.class_taxID;


SELECT 
CONCAT("http://bins.boldsystems.org/index.php/Taxbrowser_Taxonpage?taxid=", order_taxID),
CONCAT("http://bins.boldsystems.org/index.php/Taxbrowser_Taxonpage?taxid=", order_taxID),
CONCAT("http://bins.boldsystems.org/index.php/Taxbrowser_Taxonpage?taxid=", order_taxID),
CONCAT("http://bins.boldsystems.org/index.php/Taxbrowser_Taxonpage?taxid=", IF(class_taxID > 0,class_taxID, phylum_taxID)),
"",
order_name,
CONCAT("http://bins.boldsystems.org/index.php/Taxbrowser_Taxonpage?taxid=", order_taxID),
"order",
""
INTO OUTFILE '/Path/to/bold-to-dwc-poc/checklist/taxa/orders.txt'
  FIELDS TERMINATED BY '\t' 
  LINES TERMINATED BY '\n'
  from boldtaxonomy bt where order_taxID > 0 group by bt.order_taxID;

SELECT 
CONCAT("http://bins.boldsystems.org/index.php/Taxbrowser_Taxonpage?taxid=", family_taxID),
CONCAT("http://bins.boldsystems.org/index.php/Taxbrowser_Taxonpage?taxid=", family_taxID),
CONCAT("http://bins.boldsystems.org/index.php/Taxbrowser_Taxonpage?taxid=", family_taxID),
CONCAT("http://bins.boldsystems.org/index.php/Taxbrowser_Taxonpage?taxid=", IF(order_taxID > 0, order_taxID, IF(class_taxID > 0,class_taxID, phylum_taxID))),
"",
family_name,
CONCAT("http://bins.boldsystems.org/index.php/Taxbrowser_Taxonpage?taxid=", family_taxID),
"family",
""
INTO OUTFILE '/Path/to/bold-to-dwc-poc/checklist/taxa/families.txt'
  FIELDS TERMINATED BY '\t' 
  LINES TERMINATED BY '\n'
  from boldtaxonomy bt where family_taxID > 0 group by bt.family_taxID;


SELECT 
CONCAT("http://bins.boldsystems.org/index.php/Taxbrowser_Taxonpage?taxid=", genus_taxID),
CONCAT("http://bins.boldsystems.org/index.php/Taxbrowser_Taxonpage?taxid=", genus_taxID),
CONCAT("http://bins.boldsystems.org/index.php/Taxbrowser_Taxonpage?taxid=", genus_taxID),
CONCAT("http://bins.boldsystems.org/index.php/Taxbrowser_Taxonpage?taxid=", IF(family_taxID > 0, family_taxID, IF(order_taxID > 0, order_taxID, IF(class_taxID > 0,class_taxID, phylum_taxID)) )),
"",
genus_name,
CONCAT("http://bins.boldsystems.org/index.php/Taxbrowser_Taxonpage?taxid=", genus_taxID),
"genus",
""
INTO OUTFILE '/Path/to/bold-to-dwc-poc/checklist/taxa/genera.txt'
  FIELDS TERMINATED BY '\t' 
  LINES TERMINATED BY '\n'
  from boldtaxonomy bt where genus_taxID > 0 group by bt.genus_taxID;


SELECT 
CONCAT("http://bins.boldsystems.org/index.php/Taxbrowser_Taxonpage?taxid=", species_taxID),
CONCAT("http://bins.boldsystems.org/index.php/Taxbrowser_Taxonpage?taxid=", species_taxID),
CONCAT("http://bins.boldsystems.org/index.php/Taxbrowser_Taxonpage?taxid=", species_taxID),
CONCAT("http://bins.boldsystems.org/index.php/Taxbrowser_Taxonpage?taxid=", IF(genus_taxID > 0, genus_taxID, IF(family_taxID > 0, family_taxID, IF(order_taxID > 0, order_taxID, IF(class_taxID > 0,class_taxID, phylum_taxID)) ) )),
identification_reference,
species_name,
CONCAT("http://bins.boldsystems.org/index.php/Taxbrowser_Taxonpage?taxid=", species_taxID),
"species",
""
INTO OUTFILE '/Path/to/bold-to-dwc-poc/checklist/taxa/species.txt'
  FIELDS TERMINATED BY '\t' 
  LINES TERMINATED BY '\n'
  from boldtaxonomy bt where species_taxID > 0 group by bt.species_taxID;


SELECT 
CONCAT("http://bins.boldsystems.org/index.php/Public_BarcodeCluster?clusteruri=", bin_uri),
CONCAT("http://bins.boldsystems.org/index.php/Public_BarcodeCluster?clusteruri=", bin_uri),
CONCAT("http://bins.boldsystems.org/index.php/Public_BarcodeCluster?clusteruri=", bin_uri),
CONCAT("http://bins.boldsystems.org/index.php/Taxbrowser_Taxonpage?taxid=", species_taxID),
"",
bin_uri,
CONCAT("http://bins.boldsystems.org/index.php/Public_BarcodeCluster?clusteruri=", bin_uri),
"unranked",
CONCAT("Species names applied to this BIN: ", species_remarks)
INTO OUTFILE '/Path/to/bold-to-dwc-poc/checklist/taxa/species_bin.txt'
  FIELDS TERMINATED BY '\t' 
  LINES TERMINATED BY '\n'
  from boldconsensus bt where species_taxID > 0 AND (species_sup_usages / species_num_usages) >= 0.8 ;


SELECT 
CONCAT("http://bins.boldsystems.org/index.php/Public_BarcodeCluster?clusteruri=", bin_uri),
CONCAT("http://bins.boldsystems.org/index.php/Public_BarcodeCluster?clusteruri=", bin_uri),
CONCAT("http://bins.boldsystems.org/index.php/Public_BarcodeCluster?clusteruri=", bin_uri),
CONCAT("http://bins.boldsystems.org/index.php/Taxbrowser_Taxonpage?taxid=", genus_taxID),
"",
bin_uri,
CONCAT("http://bins.boldsystems.org/index.php/Public_BarcodeCluster?clusteruri=", bin_uri),
"unranked",
CONCAT(
   CONCAT("Genus names applied to this BIN: ", genus_remarks, " "),
  IF(species_remarks IS NOT NULL,   CONCAT("Species names applied to this BIN: ", species_remarks), "")
)
INTO OUTFILE '/Path/to/bold-to-dwc-poc/checklist/taxa/genus_bin.txt'
  FIELDS TERMINATED BY '\t' 
  LINES TERMINATED BY '\n'
  from boldconsensus bt where  genus_taxID > 0 AND (genus_sup_usages / genus_num_usages) >= 0.8 
  AND (species_taxID = 0 OR (species_sup_usages / species_num_usages) < 0.8 ) ;


SELECT 
CONCAT("http://bins.boldsystems.org/index.php/Public_BarcodeCluster?clusteruri=", bin_uri),
CONCAT("http://bins.boldsystems.org/index.php/Public_BarcodeCluster?clusteruri=", bin_uri),
CONCAT("http://bins.boldsystems.org/index.php/Public_BarcodeCluster?clusteruri=", bin_uri),
CONCAT("http://bins.boldsystems.org/index.php/Taxbrowser_Taxonpage?taxid=", family_taxID),
"",
bin_uri,
CONCAT("http://bins.boldsystems.org/index.php/Public_BarcodeCluster?clusteruri=", bin_uri),
"unranked",
CONCAT(
   CONCAT("Family names applied to this BIN: ", family_remarks, " "),
  IF(genus_remarks IS NOT NULL,  CONCAT("Genus names applied to this BIN: ", genus_remarks), "")
)
INTO OUTFILE '/Path/to/bold-to-dwc-poc/checklist/taxa/family_bin.txt'
  FIELDS TERMINATED BY '\t' 
  LINES TERMINATED BY '\n'
  from boldconsensus bt where family_taxID > 0 AND (family_sup_usages / family_num_usages) >= 0.8 
  AND ((species_taxID = 0 OR (species_sup_usages / species_num_usages) < 0.8 ) AND (genus_taxID = 0 OR (genus_sup_usages / genus_num_usages) < 0.8 ));


SELECT 
CONCAT("http://bins.boldsystems.org/index.php/Public_BarcodeCluster?clusteruri=", bin_uri),
CONCAT("http://bins.boldsystems.org/index.php/Public_BarcodeCluster?clusteruri=", bin_uri),
CONCAT("http://bins.boldsystems.org/index.php/Public_BarcodeCluster?clusteruri=", bin_uri),
CONCAT("http://bins.boldsystems.org/index.php/Taxbrowser_Taxonpage?taxid=", order_taxID),
"",
bin_uri,
CONCAT("http://bins.boldsystems.org/index.php/Public_BarcodeCluster?clusteruri=", bin_uri),
"unranked",
CONCAT(
   CONCAT("Order names applied to this BIN: ", order_remarks, " "),
  IF(family_remarks IS NOT NULL, CONCAT("Family names applied to this BIN: ", family_remarks), "")
)
INTO OUTFILE '/Path/to/bold-to-dwc-poc/checklist/taxa/order_bin.txt'
  FIELDS TERMINATED BY '\t' 
  LINES TERMINATED BY '\n'
  from boldconsensus bt where order_taxID > 0 AND (order_sup_usages / order_num_usages) >= 0.8
  AND ((species_taxID = 0 OR (species_sup_usages / species_num_usages) < 0.8 ) AND (genus_taxID = 0 OR (genus_sup_usages / genus_num_usages) < 0.8 ) AND (family_taxID = 0 OR (family_sup_usages / family_num_usages) < 0.8 ));

SELECT 
CONCAT("http://bins.boldsystems.org/index.php/Public_BarcodeCluster?clusteruri=", bin_uri),
CONCAT("http://bins.boldsystems.org/index.php/Public_BarcodeCluster?clusteruri=", bin_uri),
CONCAT("http://bins.boldsystems.org/index.php/Public_BarcodeCluster?clusteruri=", bin_uri),
CONCAT("http://bins.boldsystems.org/index.php/Taxbrowser_Taxonpage?taxid=", class_taxID),
"",
bin_uri,
CONCAT("http://bins.boldsystems.org/index.php/Public_BarcodeCluster?clusteruri=", bin_uri),
"unranked",
CONCAT(
   CONCAT("Class names applied to this BIN: ", class_remarks, " "),
   IF(order_remarks IS NOT NULL, CONCAT("Order names applied to this BIN: ", order_remarks), "")
)
INTO OUTFILE '/Path/to/bold-to-dwc-poc/checklist/taxa/class_bin.txt'
  FIELDS TERMINATED BY '\t' 
  LINES TERMINATED BY '\n'
  from boldconsensus bt where class_taxID > 0 AND (class_sup_usages / class_num_usages) >= 0.8
  AND ((species_taxID = 0 OR (species_sup_usages / species_num_usages) < 0.8 ) AND (genus_taxID = 0 OR (genus_sup_usages / genus_num_usages) < 0.8 ) AND (family_taxID = 0 OR (family_sup_usages / family_num_usages) < 0.8 ) AND (order_taxID = 0 OR (order_sup_usages / order_num_usages) < 0.8 ));

SELECT 
CONCAT("http://bins.boldsystems.org/index.php/Public_BarcodeCluster?clusteruri=", bin_uri),
CONCAT("http://bins.boldsystems.org/index.php/Public_BarcodeCluster?clusteruri=", bin_uri),
CONCAT("http://bins.boldsystems.org/index.php/Public_BarcodeCluster?clusteruri=", bin_uri),
CONCAT("http://bins.boldsystems.org/index.php/Taxbrowser_Taxonpage?taxid=", phylum_taxID),
"",
bin_uri,
CONCAT("http://bins.boldsystems.org/index.php/Public_BarcodeCluster?clusteruri=", bin_uri),
"unranked",
CONCAT(
   CONCAT("Phylum names applied to this BIN: ", phylum_remarks, " "),
   IF(class_remarks IS NOT NULL, CONCAT("Class names applied to this BIN: ", class_remarks), "")
)
INTO OUTFILE '/Path/to/bold-to-dwc-poc/checklist/taxa/phylum_bin.txt'
  FIELDS TERMINATED BY '\t' 
  LINES TERMINATED BY '\n'
  from boldconsensus bt where phylum_taxID > 0 
  AND ((species_taxID = 0 OR (species_sup_usages / species_num_usages) < 0.8 ) AND (genus_taxID = 0 OR (genus_sup_usages / genus_num_usages) < 0.8 ) AND (family_taxID = 0 OR (family_sup_usages / family_num_usages) < 0.8 ) AND (order_taxID = 0 OR (order_sup_usages / order_num_usages) < 0.8 ) AND (class_taxID = 0 OR (class_sup_usages / class_num_usages) < 0.8 ));
