const {execSync} = require('child_process')

// Change the path to your location of /bold-to-dwc-poc

const insert = (taxon) => {
    const phyla = require('./config')[taxon];

    phyla.forEach(phylum => {
        execSync(`mysql -u root bold < /Path/to/bold-to-dwc-poc/taxonsqlfromtsv/${phylum}.bold.sql`, (err, stdout, stderr) => {
            if (err) {
              console.log(err)
              return;
            }
          
            // the *entire* stdout and stderr (buffered)
            console.log(`stdout: ${stdout}`);
            console.log(`stderr: ${stderr}`);
          });
    })
}

insert('animalPhyla')
insert('plantPhyla')
insert('fungiPhyla')
insert('prostitPhyla')


