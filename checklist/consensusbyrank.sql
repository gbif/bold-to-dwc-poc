CREATE TABLE `boldconsensus_species` (
bin_uri varchar(255) NOT NULL,
taxID INT(11),
sup_usages INT(11),
num_usages INT(11),
`name` varchar(255) DEFAULT NULL,
index(bin_uri),
index(taxID),
index(sup_usages),
index(num_usages)
) ENGINE=InnoDB DEFAULT CHARSET= UTF8;

insert into boldconsensus_species (bin_uri, taxID, sup_usages, `name`) SELECT bin_uri, species_taxID, count(species_taxID), species_name from boldtsvtaxa where species_taxID > 0 group by bin_uri, species_taxID;

CREATE TABLE `boldconsensus_genus` (
bin_uri varchar(255) NOT NULL,
taxID INT(11),
sup_usages INT(11),
num_usages INT(11),
`name` varchar(255) DEFAULT NULL,
index(bin_uri),
index(taxID),
index(sup_usages),
index(num_usages)
) ENGINE=InnoDB DEFAULT CHARSET= UTF8;

insert into boldconsensus_genus (bin_uri, taxID, sup_usages, `name`) SELECT bin_uri, genus_taxID, count(genus_taxID), genus_name from boldtsvtaxa where genus_taxID > 0 group by bin_uri, genus_taxID;

CREATE TABLE `boldconsensus_family` (
bin_uri varchar(255) NOT NULL,
taxID INT(11),
sup_usages INT(11),
num_usages INT(11),
`name` varchar(255) DEFAULT NULL,
index(bin_uri),
index(taxID),
index(sup_usages),
index(num_usages)
) ENGINE=InnoDB DEFAULT CHARSET= UTF8;

insert into boldconsensus_family (bin_uri, taxID, sup_usages, `name`) SELECT bin_uri, family_taxID, count(family_taxID), family_name from boldtsvtaxa where family_taxID > 0 group by bin_uri, family_taxID;

CREATE TABLE `boldconsensus_order` (
bin_uri varchar(255) NOT NULL,
taxID INT(11),
sup_usages INT(11),
num_usages INT(11),
`name` varchar(255) DEFAULT NULL,
index(bin_uri),
index(taxID),
index(sup_usages),
index(num_usages)
) ENGINE=InnoDB DEFAULT CHARSET= UTF8;

insert into boldconsensus_order (bin_uri, taxID, sup_usages, `name`) SELECT bin_uri, order_taxID, count(order_taxID), order_name from boldtsvtaxa where order_taxID > 0 group by bin_uri, order_taxID;

CREATE TABLE `boldconsensus_class` (
bin_uri varchar(255) NOT NULL,
taxID INT(11),
sup_usages INT(11),
num_usages INT(11),
`name` varchar(255) DEFAULT NULL,
index(bin_uri),
index(taxID),
index(sup_usages),
index(num_usages)
) ENGINE=InnoDB DEFAULT CHARSET= UTF8;

insert into boldconsensus_class (bin_uri, taxID, sup_usages, `name`) SELECT bin_uri, class_taxID, count(class_taxID), class_name from boldtsvtaxa where class_taxID > 0 group by bin_uri, class_taxID;


CREATE TABLE `boldconsensus_phylum` (
bin_uri varchar(255) NOT NULL,
taxID INT(11),
sup_usages INT(11),
num_usages INT(11),
`name` varchar(255) DEFAULT NULL,
index(bin_uri),
index(taxID),
index(sup_usages),
index(num_usages)
) ENGINE=InnoDB DEFAULT CHARSET= UTF8;

insert into boldconsensus_phylum (bin_uri, taxID, sup_usages, `name`) SELECT bin_uri, phylum_taxID, count(phylum_taxID), phylum_name from boldtsvtaxa where phylum_taxID > 0 group by bin_uri, phylum_taxID;




UPDATE boldconsensus a, (SELECT bin_uri, taxID as species_taxID, `name` as species_name, sup_usages as species_sup_usages , sum(sup_usages) as species_num_usages from boldconsensus_species group by bin_uri order by sup_usages DESC limit 1 ) b
SET a.species_taxID = b.species_taxID, a.species_sup_usages = b.species_sup_usages, a.species_num_usages = b.species_num_usages, a.species_name=b.species_name where a.bin_uri = b.bin_uri;

UPDATE boldconsensus a, (SELECT bin_uri, taxID as species_taxID, `name` as species_name, max(sup_usages) as species_sup_usages , sum(sup_usages) as species_num_usages from boldconsensus_species group by bin_uri) b
SET a.species_taxID = b.species_taxID, a.species_sup_usages = b.species_sup_usages, a.species_num_usages = b.species_num_usages, a.species_name=b.species_name where a.bin_uri = b.bin_uri;

UPDATE boldconsensus a, (SELECT bin_uri, taxID as genus_taxID, `name` as genus_name, max(sup_usages) as genus_sup_usages , sum(sup_usages) as genus_num_usages from boldconsensus_genus group by bin_uri) b
SET a.genus_taxID = b.genus_taxID, a.genus_sup_usages = b.genus_sup_usages, a.genus_num_usages = b.genus_num_usages, a.genus_name=b.genus_name where a.bin_uri = b.bin_uri;

UPDATE boldconsensus a, (SELECT bin_uri, taxID as family_taxID, `name` as family_name, max(sup_usages) as family_sup_usages , sum(sup_usages) as family_num_usages from boldconsensus_family group by bin_uri) b
SET a.family_taxID = b.family_taxID, a.family_sup_usages = b.family_sup_usages, a.family_num_usages = b.family_num_usages, a.family_name=b.family_name where a.bin_uri = b.bin_uri;

UPDATE boldconsensus a, (SELECT bin_uri, taxID as order_taxID, `name` as order_name, max(sup_usages) as order_sup_usages , sum(sup_usages) as order_num_usages from boldconsensus_order group by bin_uri) b
SET a.order_taxID = b.order_taxID, a.order_sup_usages = b.order_sup_usages, a.order_num_usages = b.order_num_usages, a.order_name=b.order_name where a.bin_uri = b.bin_uri;

UPDATE boldconsensus a, (SELECT bin_uri, taxID as class_taxID, `name` as class_name, max(sup_usages) as class_sup_usages , sum(sup_usages) as class_num_usages from boldconsensus_class group by bin_uri) b
SET a.class_taxID = b.class_taxID, a.class_sup_usages = b.class_sup_usages, a.class_num_usages = b.class_num_usages, a.class_name=b.class_name where a.bin_uri = b.bin_uri;

UPDATE boldconsensus a, (SELECT bin_uri, taxID as phylum_taxID, `name` as phylum_name, max(sup_usages) as phylum_sup_usages , sum(sup_usages) as phylum_num_usages from boldconsensus_phylum group by bin_uri) b
SET a.phylum_taxID = b.phylum_taxID, a.phylum_sup_usages = b.phylum_sup_usages, a.phylum_num_usages = b.phylum_num_usages, a.phylum_name=b.phylum_name where a.bin_uri = b.bin_uri;