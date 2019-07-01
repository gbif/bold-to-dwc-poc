# bold-to-dwc-poc
Proof of concept for BOLD-GBIF data integration

## prerequisites

````
node >= v8.9.4
mysql >= 5.7.19
````

## Create the BOLD occurrence dwc archive

### Install dependencies:

````
cd bold-to-dwc-poc
npm install
````

### Download data from BOLD:
This is done per Phylum, and both the combined specimen/sequence data in tsv format and the specimen-only data in dwc format are used. The big Phyla Arthropoda and Chordata, may not download successfully but can be downloaded manually. You will then need to place these files in the folders `dwcdata` and `tsvdata` respectively.

To download:
````
node boldapi.js

````

### Get the data into MySQL
Create two tables from the files `dwccreatetable.sql` and `tsvcreatetable.sql`.

Then, sql files are created from the tabular data:
````
node dwctomysql.js
node tsvtomysql.js
`````






