-- Modify this line to fit your location of bold-to-dwc: INTO OUTFILE '/path/to/bold-to-dwc-poc/data/occurrences.txt'

select     
a.id,	
CONCAT('http://bins.boldsystems.org/index.php/Public_RecordView?processid=', a.occurrenceID) as occurrenceID,
a.catalogNumber,
a.fieldNumber,
a.identificationRemarks,
"Occurrence", -- Overwrite BASIS OF RECORD
a.institutionCode, -- Contains 'mined from genbank' and full institution names, set to "" to ignore data
a.phylum,
a.class,
a.`order`,
a.family,
a.genus,
CONCAT(
IF(b.scientificName IS NOT NULL, b.scientificName, a.scientificName),
IF(a.identificationRemarks <> "", CONCAT(" (",a.identificationRemarks, ")"), "")
),
a.identifiedBy,
a.associatedOccurrences,
a.associatedTaxa,
a.collectionCode,
a.eventID,
a.locationRemarks,
a.eventTime,
a.habitat,
a.samplingProtocol,
a.locationID,
a.eventDate,
a.recordedBy,
a.country,
a.stateProvince,
a.locality,
a.decimalLatitude,
a.decimalLongitude,
a.coordinatePrecision,
a.georeferenceSources,
a.maximumDepthInMeters,
a.minimumDepthInMeters,
a.maximumElevationInMeters,
a.minimumElevationInMeters,
a.eventRemarks,
a.lifestage,
a.sex,
a.preparations,
a.rightsHolder,
a.rights,
a.language,
IF(a.identificationRemarks <> "", CONCAT('http://www.boldsystems.org/index.php/Public_BarcodeCluster?clusteruri=', identificationRemarks), "") as taxonConceptdID,
IF(a.identificationRemarks <> "", CONCAT('http://www.boldsystems.org/index.php/Public_BarcodeCluster?clusteruri=', identificationRemarks), "") as taxonID,
GROUP_CONCAT(b.genbank_accession SEPARATOR ' | ')
INTO OUTFILE '/path/to/bold-to-dwc-poc/data/occurrences.txt'
  FIELDS TERMINATED BY '\t' 
  LINES TERMINATED BY '\n'
  from bolddwc a LEFT JOIN boldtsv b on a.id = b.processid group by a.id;

