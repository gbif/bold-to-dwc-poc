const request = require('requestretry')
const baseUrl = "http://bins.boldsystems.org/index.php/API_Public/";
const _ = require('lodash')
const fs = require('fs')
const getHigherTaxonAttribution = (record) => {

    const taxon = _.get(record, 'taxonomy.genus.taxon.name') || _.get(record, 'taxonomy.family.taxon.name')|| _.get(record, 'taxonomy.order.taxon.name') || _.get(record, 'taxonomy.class.taxon.name') || _.get(record, 'taxonomy.phylum.taxon.name') || _.get(record, 'taxonomy.kingdom.taxon.name') || 'Animalia';
    return `${taxon} sp.`;
}

const getBinTaxonomy = async (BINID) => {

    await  request({method: 'GET', url: `${baseUrl}specimen?bin=${BINID}&format=json`,json: true})
    .then(function(response) {
        const data = _.get(response, 'body.bold_records.records');

        const mappedData = Object.keys(data).map( k => ({
            processid: k,
            kingdom: _.get(data[k], 'taxonomy.kingdom.taxon.name') || 'Animalia',
            phylum: _.get(data[k], 'taxonomy.phylum.taxon.name') || '',
            class: _.get(data[k], 'taxonomy.class.taxon.name') || '',
            order: _.get(data[k], 'taxonomy.order.taxon.name') || '',
            family: _.get(data[k], 'taxonomy.family.taxon.name') || '',
            genus: _.get(data[k], 'taxonomy.genus.taxon.name') || '',
            species: _.get(data[k], 'taxonomy.species.taxon.name') || '',
            taxonomy: `k__${_.get(data[k], 'taxonomy.kingdom.taxon.name') || 'Animalia'};p__${_.get(data[k], 'taxonomy.phylum.taxon.name') || 'unidentified'};c__${_.get(data[k], 'taxonomy.class.taxon.name') || 'unidentified'};o__${_.get(data[k], 'taxonomy.order.taxon.name') || 'unidentified'};f__${_.get(data[k], 'taxonomy.family.taxon.name') || 'unidentified'};g__${_.get(data[k], 'taxonomy.genus.taxon.name') || 'unidentified'};s__${_.get(data[k], 'taxonomy.species.taxon.name') || getHigherTaxonAttribution(data[k])}`


        }))
        console.log(mappedData)

    })
    .catch(function(err) {
        console.log(err);
    });
}
async function asyncForEach(array, callback) {
    for (let index = 0; index < array.length; index++) {
      await callback(array[index], index, array);
    }
  }
const getDataForTaxon = async (taxon) => {
   return request({method: 'GET', url: `${baseUrl}combined?taxon=${taxon}&format=tsv`,json: false}).pipe(fs.createWriteStream(`./tsvdata/${taxon}.bold.txt`))
}

const getDwcDataForTaxon = async (taxon) => {
    return request({method: 'GET', url: `${baseUrl}specimen?taxon=${taxon}&format=dwc`,json: false}).pipe(fs.createWriteStream(`./dwcdata/${taxon}.bold.dwc.txt`))
 }

const getData = async (taxon) => {
const phyla = require('./config')[taxon];
asyncForEach(phyla, getDataForTaxon)
asyncForEach(phyla, getDwcDataForTaxon)

}

getData("animalPhyla")
getData("plantPhyla")
getData("fungiPhyla")
getData("protistPhyla")
//getDataForTaxon('Arthropoda')
  //getBinTaxonomy('BOLD:ABV3843')