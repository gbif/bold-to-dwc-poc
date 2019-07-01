CREATE TABLE `boldtsv` (
  `processid` varchar(255) DEFAULT NULL,
  `bin_uri` varchar(255) DEFAULT NULL,
  `speciesName` varchar(255) DEFAULT NULL,
  `scientificName` varchar(255) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `sequenceID` varchar(255) DEFAULT NULL,
  `markercode` varchar(255) DEFAULT NULL,
  `genbank_accession` varchar(255) DEFAULT NULL,
  `nucleotides` text DEFAULT NULL,
 `classification` varchar(255) DEFAULT NULL
  ) ENGINE=InnoDB DEFAULT CHARSET= UTF8;

CREATE INDEX processid ON boldtsv (processid);
CREATE INDEX genbank ON boldtsv (genbank_accession);

