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
This is done per Phylum, and both the combined specimen/sequence data in tsv format and the specimen-only data in dwc format are used. The big Phyla [Arthropoda](http://boldsystems.org/index.php/Public_SearchTerms?query=Arthropoda[tax]) and [Chordata](http://boldsystems.org/index.php/Public_SearchTerms?query=Chordata[tax]), may not download successfully but can be downloaded manually. You will then need to place these files in the folders `dwcdata` and `tsvdata` respectively.

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
Load data from the sql files:
````
node dwcinsert.js
node tsvinsert.js
`````

### Get the data out from MySQL
Run the sql in `occurrenceout.sql`. This will create an `occurrence.txt` in the `/data` dir.

### Get data for the DwC Media extension
Extract the media for earch Phylum:

````
node media.js
````

Concatenate all media files:

```
cd media
cat * > media.txt
````

Move `media/media.txt` to `data/media.txt`.

### Get data for the GGBN Amplification extension
Extract the sequences for earch Phylum:

````
node sequences.js
````

Concatenate all sequence files:

```
cd sequence
cat * > sequence.txt
````

Move `sequence/sequence.txt` to `data/sequence.txt`.

### Create the DwC archive

ZIP the contents of the `/data` directory.







