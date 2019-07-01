const {execSync} = require('child_process')



const insert = (taxon) => {
    const phyla = require('./config')[taxon];

    phyla.forEach(phylum => {
        execSync(`mysql -u root bold < /Users/thomas/bold-to-dwc-poc/tsvsql/${phylum}.bold.sql`, (err, stdout, stderr) => {
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
insert('protistPhyla')
