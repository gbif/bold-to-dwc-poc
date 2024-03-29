CREATE TABLE `bolddwc` (
  `id` varchar(255) DEFAULT NULL,
  `occurrenceID` varchar(255) DEFAULT NULL,
  `catalogNumber` varchar(255) DEFAULT NULL,
  `fieldNumber` varchar(255) DEFAULT NULL,
  `identificationRemarks` varchar(255) DEFAULT NULL,
  `basisOfRecord` varchar(255) DEFAULT NULL,
  `institutionCode` varchar(255) DEFAULT NULL,
  `phylum` varchar(255) DEFAULT NULL,
  `class` varchar(255) DEFAULT NULL,
  `order` varchar(255) DEFAULT NULL,
  `family` varchar(255) DEFAULT NULL,
  `genus` varchar(255) DEFAULT NULL,
  `scientificName` varchar(255) DEFAULT NULL,
  `identifiedBy` varchar(255) DEFAULT NULL,
  `associatedOccurrences` varchar(255) DEFAULT NULL,
  `associatedTaxa` varchar(255) DEFAULT NULL,
  `collectionCode` varchar(255) DEFAULT NULL,
  `eventID` varchar(255) DEFAULT NULL,
  `locationRemarks` varchar(255) DEFAULT NULL,
  `eventTime` varchar(255) DEFAULT NULL,
  `habitat` varchar(255) DEFAULT NULL,
  `samplingProtocol` varchar(255) DEFAULT NULL,
  `locationID` varchar(255) DEFAULT NULL,
  `eventDate` varchar(255) DEFAULT NULL,
  `recordedBy` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `stateProvince` varchar(255) DEFAULT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `decimalLatitude` varchar(255) DEFAULT NULL,
  `decimalLongitude` varchar(255) DEFAULT NULL,
  `coordinatePrecision` varchar(255) DEFAULT NULL,
  `georeferenceSources` varchar(255) DEFAULT NULL,
  `maximumDepthInMeters` varchar(255) DEFAULT NULL,
  `minimumDepthInMeters` varchar(255) DEFAULT NULL,
  `maximumElevationInMeters` varchar(255) DEFAULT NULL,
  `minimumElevationInMeters` varchar(255) DEFAULT NULL,
  `eventRemarks` varchar(255) DEFAULT NULL,
  `lifestage` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `preparations` varchar(255) DEFAULT NULL,
  `rightsHolder` varchar(255) DEFAULT NULL,
  `rights` varchar(255) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET= UTF8;
ALTER TABLE bolddwc ADD PRIMARY KEY(id);