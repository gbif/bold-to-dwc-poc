const fs = require("fs");
const parse = require("csv-parse");
const transform = require("stream-transform");
const _ = require('lodash')
const animalPhyla = require('./config').animalPhyla;
const plantPhyla = require('./config').plantPhyla;
const fungiPhyla = require('./config').fungiPhyla;
const protistPhyla = require('./config').protistPhyla;


const getSql = record => {
  return `INSERT INTO bolddwc (\`id\`, \`occurrenceID\`, \`catalogNumber\`, \`fieldNumber\`, \`identificationRemarks\`, \`basisOfRecord\`, \`institutionCode\`, \`phylum\`, \`class\`, \`order\`, \`family\`, \`genus\`, \`scientificName\`, \`identifiedBy\`, \`associatedOccurrences\`, \`associatedTaxa\`, \`collectionCode\`, \`eventID\`, \`locationRemarks\`, \`eventTime\`, \`habitat\`, \`samplingProtocol\`, \`locationID\`, \`eventDate\`, \`recordedBy\`, \`country\`, \`stateProvince\`, \`locality\`, \`decimalLatitude\`, \`decimalLongitude\`, \`coordinatePrecision\`, \`georeferenceSources\`, \`maximumDepthInMeters\`, \`minimumDepthInMeters\`, \`maximumElevationInMeters\`, \`minimumElevationInMeters\`, \`eventRemarks\`, \`lifestage\`, \`sex\`, \`preparations\`, \`rightsHolder\`, \`rights\`, \`language\`) 
    values ("${record.id.replace(/\\/g, '\\\\').replace(/"/g, '\\"')}" , "${record.occurrenceID.replace(/\\/g, '\\\\').replace(/"/g, '\\"')}" , "${
    record.catalogNumber.replace(/\\/g, '\\\\').replace(/"/g, '\\"')
  }" , "${record.fieldNumber.replace(/\\/g, '\\\\').replace(/"/g, '\\"')}" , "${record.identificationRemarks.replace(/\\/g, '\\\\').replace(/"/g, '\\"')}" , "${
    record.basisOfRecord.replace(/\\/g, '\\\\').replace(/"/g, '\\"')
  }" , "${record.institutionCode.replace(/\\/g, '\\\\').replace(/"/g, '\\"')}" , "${record.phylum.replace(/\\/g, '\\\\').replace(/"/g, '\\"')}" , "${
    record.class.replace(/\\/g, '\\\\').replace(/"/g, '\\"')
  }" , "${record.order.replace(/\\/g, '\\\\').replace(/"/g, '\\"')}" , "${record.family.replace(/\\/g, '\\\\').replace(/"/g, '\\"')}" , "${record.genus.replace(/\\/g, '\\\\').replace(/"/g, '\\"')}" , "${
    record.scientificName.replace(/\\/g, '\\\\').replace(/"/g, '\\"')
  }" , "${record.identifiedBy.replace(/\\/g, '\\\\').replace(/"/g, '\\"')}" , "${record.associatedOccurrences.replace(/\\/g, '\\\\').replace(/"/g, '\\"')}" , "${
    record.associatedTaxa.replace(/\\/g, '\\\\').replace(/"/g, '\\"')
  }" , "${record.collectionCode.replace(/\\/g, '\\\\').replace(/"/g, '\\"')}" , "${record.eventID.replace(/\\/g, '\\\\').replace(/"/g, '\\"')}" , "${
    record.locationRemarks.replace(/\\/g, '\\\\').replace(/"/g, '\\"')
  }" , "${record.eventTime.replace(/\\/g, '\\\\').replace(/"/g, '\\"')}" , "${record.habitat.replace(/\\/g, '\\\\').replace(/"/g, '\\"')}" , "${
    record.samplingProtocol.replace(/\\/g, '\\\\').replace(/"/g, '\\"')
  }" , "${record.locationID.replace(/\\/g, '\\\\').replace(/"/g, '\\"')}" , "${record.eventDate.replace(/\\/g, '\\\\').replace(/"/g, '\\"')}" , "${
    record.recordedBy.replace(/\\/g, '\\\\').replace(/"/g, '\\"')
  }" , "${record.country.replace(/\\/g, '\\\\').replace(/"/g, '\\"')}" , "${record.stateProvince.replace(/\\/g, '\\\\').replace(/"/g, '\\"')}" , "${
    record.locality.replace(/\\/g, '\\\\').replace(/"/g, '\\"')
  }" , "${record.decimalLatitude.replace(/\\/g, '\\\\').replace(/"/g, '\\"')}" , "${record.decimalLongitude.replace(/\\/g, '\\\\').replace(/"/g, '\\"')}" , "${
    record.coordinatePrecision.replace(/\\/g, '\\\\').replace(/"/g, '\\"')
  }" , "${record.georeferenceSources.replace(/\\/g, '\\\\').replace(/"/g, '\\"')}" , "${record.maximumDepthInMeters.replace(/\\/g, '\\\\').replace(/"/g, '\\"')}" , "${
    record.minimumDepthInMeters.replace(/\\/g, '\\\\').replace(/"/g, '\\"')
  }" , "${record.maximumElevationInMeters.replace(/\\/g, '\\\\').replace(/"/g, '\\"')}" , "${
    record.minimumElevationInMeters.replace(/\\/g, '\\\\').replace(/"/g, '\\"')
  }" , "${record.eventRemarks.replace(/\\/g, '\\\\').replace(/"/g, '\\"')}" , "${record.lifestage.replace(/\\/g, '\\\\').replace(/"/g, '\\"')}" , "${record.sex.replace(/\\/g, '\\\\').replace(/"/g, '\\"')}" , "${
    record.preparations.replace(/\\/g, '\\\\').replace(/"/g, '\\"')
  }" , "${record.rightsHolder.replace(/\\/g, '\\\\').replace(/"/g, '\\"')}" , "${record.rights.replace(/\\/g, '\\\\').replace(/"/g, '\\"')}" , "${record.language.replace(/\\/g, '\\\\').replace(/"/g, '\\"')}");`;
};

const boldToDWC = async phylum => {
  const parser = parse({
    delimiter: "\t",
    columns: true,
    ltrim: true,
    rtrim: true,
    quote: null
  });


  const transformer = transform(function(record, callback){
      callback(null, record.phylum === phylum ? `${getSql(record)}\n` : '')
  }, {
    parallel: 5
  })
  var readStream = fs.createReadStream(__dirname+`/dwcdata/${phylum}.bold.dwc.txt`);
  
  readStream.pipe(parser).pipe(transformer).pipe(fs.createWriteStream(__dirname+`/dwcsql/${phylum}.bold.sql`))
};

//
//boldToDWC("Arthropoda");

animalPhyla.forEach(boldToDWC)
plantPhyla.forEach(boldToDWC)
fungiPhyla.forEach(boldToDWC)
protistPhyla.forEach(boldToDWC)
