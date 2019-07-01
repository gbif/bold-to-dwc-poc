const fs = require("fs");
const parse = require("csv-parse");
const transform = require("stream-transform");
const _ = require('lodash')
const animalPhyla = require('./config').animalPhyla;
const plantPhyla = require('./config').plantPhyla;
const fungiPhyla = require('./config').fungiPhyla;
const protistPhyla = require('./config').protistPhyla;
const getHigherTaxonAttribution = (record) => {

    const taxon = _.get(record, 'genus_name') || _.get(record, 'family_name')|| _.get(record, 'order_name') || _.get(record, 'class_name') || _.get(record, 'phylum_name') || 'Animalia';
    return `${taxon} sp.`;
  }
  
  const getClassification = (record) => {
    return `k__${_.get(record, 'kingdom_name') || 'Animalia'};p__${_.get(record, 'phylum_name') || 'unidentified'};c__${_.get(record, 'class_name') || 'unidentified'};o__${_.get(record, 'order_name') || 'unidentified'};f__${_.get(record, 'family_name') || 'unidentified'};g__${_.get(record, 'genus_name') || 'unidentified'};s__${_.get(record, 'species_name') || getHigherTaxonAttribution(record)}`
  
  }
const getSql = record => {
    const genbank_accession = record.genbank_accession ? `https://www.ncbi.nlm.nih.gov/nuccore/${record.genbank_accession}` : '';
    const scientificName = record.species_name || getHigherTaxonAttribution(record);
    const classification = getClassification(record)
  return `INSERT INTO boldtsv (\`processid\`, \`bin_uri\`, \`speciesName\`, \`scientificName\`, \`notes\`, \`sequenceID\`, \`markercode\`, \`genbank_accession\`, \`nucleotides\`, \`classification\`) 
    values ("${record.processid}" , "${record.bin_uri}" , "${record.species_name}" , "${
        scientificName
  }" , "${record.notes.replace(/\\/g, '\\\\').replace(/"/g, '\\"')}" , "${record.sequenceID}" , "${
    record.markercode
  }" , "${genbank_accession}" , "${record.nucleotides.replace(/\n/g, '')}", "${classification}" );`;
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
      callback(null, record.phylum_name === phylum ? `${getSql(record)}\n` : '')
  }, {
    parallel: 5
  })
  var readStream = fs.createReadStream(__dirname+`/tsvdata/${phylum}.bold.txt`);
  
  readStream.pipe(parser).pipe(transformer).pipe(fs.createWriteStream(__dirname+`/tsvsql/${phylum}.bold.sql`))
};

// animalPhyla.forEach(boldToDWC)
//boldToDWC("Arthropoda");
animalPhyla.forEach(boldToDWC)
plantPhyla.forEach(boldToDWC)
fungiPhyla.forEach(boldToDWC)
protistPhyla.forEach(boldToDWC)