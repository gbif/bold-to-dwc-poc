


const fs = require("fs");
const parse = require("csv-parse");
const transform = require("stream-transform");
const _ = require('lodash')
const animalPhyla = require('./config').animalPhyla;
const plantPhyla = require('./config').plantPhyla;
const fungiPhyla = require('./config').fungiPhyla;
const protistPhyla = require('./config').protistPhyla;



const extractSeq = async phylum => {
    const parser = parse({
      delimiter: "\t",
      columns: true,
      ltrim: true,
      rtrim: true,
      quote: null
    });
  
  
    const transformer = transform(function(record, callback){
        let sequence = ""
        if(record.phylum_name === phylum && record.nucleotides && record.markercode){
            sequence += `${record.processid}\t${record.markercode}\t${record.nucleotides.replace(/\n/g, '')}\n`

            
        }
        callback(null, sequence)
    }, {
      parallel: 5
    })
    var readStream = fs.createReadStream(__dirname+`/tsvdata/${phylum}.bold.txt`);
    
    readStream.pipe(parser).pipe(transformer).pipe(fs.createWriteStream(__dirname+`/sequence/${phylum}.txt`))
  };
  
//animalPhyla.forEach(extractSeq)
//extractMedia('Arthropoda');
//plantPhyla.forEach(extractSeq)
// extractSeq('Arthropoda')
animalPhyla.forEach(extractSeq)
plantPhyla.forEach(extractSeq)
fungiPhyla.forEach(extractSeq)
protistPhyla.forEach(extractSeq)