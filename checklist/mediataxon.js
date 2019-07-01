


const fs = require("fs");
const parse = require("csv-parse");
const transform = require("stream-transform");
const _ = require('lodash')
const animalPhyla = require('./config').animalPhyla;
const plantPhyla = require('./config').plantPhyla;
const fungiPhyla = require('./config').fungiPhyla;
const protistPhyla = require('./config').protistPhyla;



const extractMedia = async phylum => {
    const parser = parse({
      delimiter: "\t",
      columns: true,
      ltrim: true,
      rtrim: true,
      quote: null
    });
  
  
    const transformer = transform(function(record, callback){
        let images = ""
        if(record.bin_uri && record.image_urls){
            const identifiers = record.image_urls.split('|');
            const licenses = record.copyright_licenses ? record.copyright_licenses.split('|') : [];
            const titles = record.media_descriptors ? record.media_descriptors.split('|') : []
            for(let i =0; i < identifiers.length; i++){

                images += `http://bins.boldsystems.org/index.php/Public_BarcodeCluster?clusteruri=${record.bin_uri}\t${record.processid} ${titles[i] ? titles[i] : ''}\t${identifiers[i]}\thttp://bins.boldsystems.org/index.php/Public_RecordView?processid=${record.processid}\timage/jpeg\t${licenses[i] || ''}\n`
               
            }
            
        }
        callback(null, images)
    }, {
      parallel: 5
    })
    var readStream = fs.createReadStream(__dirname+`../tsvdata/${phylum}.bold.txt`);
    
    readStream.pipe(parser).pipe(transformer).pipe(fs.createWriteStream(__dirname+`/media/${phylum}.txt`))
  };
  
//extractMedia('Arthropoda');
animalPhyla.forEach(extractMedia)
plantPhyla.forEach(extractMedia)
fungiPhyla.forEach(extractMedia)
protistPhyla.forEach(extractMedia)