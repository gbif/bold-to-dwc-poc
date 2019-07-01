const fs = require("fs");
const parse = require("csv-parse");
const transform = require("stream-transform");
const _ = require('lodash')
const animalPhyla = require('./config').animalPhyla;
const plantPhyla = require('./config').plantPhyla;
const fungiPhyla = require('./config').fungiPhyla;
const protistPhyla = require('./config').protistPhyla;

// const KINGDOM = "Animalia";

const getHigherTaxonAttribution = (record) => {

    const taxon = _.get(record, 'genus_name') || _.get(record, 'family_name')|| _.get(record, 'order_name') || _.get(record, 'class_name') || _.get(record, 'phylum_name') || 'Animalia';
    return `${taxon} sp.`;
  }
  
  const getClassification = (record, KINGDOM) => {
    return `k__${_.get(record, 'kingdom_name') || KINGDOM};p__${_.get(record, 'phylum_name') || 'unidentified'};c__${_.get(record, 'class_name') || 'unidentified'};o__${_.get(record, 'order_name') || 'unidentified'};f__${_.get(record, 'family_name') || 'unidentified'};g__${_.get(record, 'genus_name') || 'unidentified'};s__${_.get(record, 'species_name') || getHigherTaxonAttribution(record)}`
  
  }
const getSql = (record, KINGDOM) => {

    const classification = getClassification(record, KINGDOM)
  return `INSERT INTO boldtsvtaxa (processid, bin_uri, phylum_taxID, phylum_name, class_taxID, class_name, order_taxID, order_name, family_taxID, family_name, subfamily_taxID, subfamily_name, genus_taxID, genus_name, species_taxID, species_name, subspecies_taxID, subspecies_name, identification_provided_by, identification_method, identification_reference, classification) 
    values ("${record.processid}",  "${record.bin_uri}",  "${record.phylum_taxID}",  "${record.phylum_name.replace(/"/g, '\\"')}",  "${record.class_taxID}",  "${record.class_name.replace(/"/g, '\\"')}",  "${record.order_taxID}",  "${record.order_name.replace(/"/g, '\\"')}",  "${record.family_taxID}",  "${record.family_name.replace(/"/g, '\\"')}",  "${record.subfamily_taxID}",  "${record.subfamily_name.replace(/"/g, '\\"')}",  "${record.genus_taxID}",  "${record.genus_name.replace(/"/g, '\\"')}",  "${record.species_taxID}",  "${record.species_name.replace(/"/g, '\\"')}",  "${record.subspecies_taxID}",  "${record.subspecies_name.replace(/"/g, '\\"')}",  "${record.identification_provided_by.replace(/"/g, '\\"')}",  "${record.identification_method.replace(/"/g, '\\"')}",  "${record.identification_reference.replace(/"/g, '\\"')}", "${classification}" );`;
};

const boldToDWC = async (phylum, KINGDOM) => {
  const parser = parse({
    delimiter: "\t",
    columns: true,
    ltrim: true,
    rtrim: true,
    quote: null
  });


  const transformer = transform(function(record, callback){
      callback(null, record.phylum_name === phylum ? `${getSql(record, KINGDOM)}\n` : '')
  }, {
    parallel: 5
  })
  var readStream = fs.createReadStream(__dirname+`/rawdata/${phylum}.bold.txt`);
  
  readStream.pipe(parser).pipe(transformer).pipe(fs.createWriteStream(__dirname+`/taxonsqlfromtsv/${phylum}.bold.sql`))
};



animalPhyla.forEach(p => boldToDWC(p, "Animalia"))
plantPhyla.forEach(p => boldToDWC(p, "Plantae"))
fungiPhyla.forEach(p => boldToDWC(p, "Fungi"))
protistPhyla.forEach(p => boldToDWC(p, "Protista"))

//boldToDWC("Arthropoda");
// protistPhyla.forEach(boldToDWC)