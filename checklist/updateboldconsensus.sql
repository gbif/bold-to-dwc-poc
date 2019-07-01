UPDATE boldconsensus a, (SELECT bin_uri, sum(sup_usages) as species_num_usages from boldconsensus_species where taxID > 0 group by bin_uri  ) b
SET a.species_num_usages = b.species_num_usages where a.bin_uri=b.bin_uri;

UPDATE boldconsensus a, (SELECT bin_uri, sum(sup_usages) as genus_num_usages from boldconsensus_genus where taxID > 0 group by bin_uri  ) b
SET a.genus_num_usages = b.genus_num_usages where a.bin_uri=b.bin_uri;

UPDATE boldconsensus a, (SELECT bin_uri, sum(sup_usages) as family_num_usages from boldconsensus_family where taxID > 0 group by bin_uri  ) b
SET a.family_num_usages = b.family_num_usages where a.bin_uri=b.bin_uri;

UPDATE boldconsensus a, (SELECT bin_uri, sum(sup_usages) as order_num_usages from boldconsensus_order where taxID > 0 group by bin_uri  ) b
SET a.order_num_usages = b.order_num_usages where a.bin_uri=b.bin_uri;

UPDATE boldconsensus a, (SELECT bin_uri, sum(sup_usages) as class_num_usages from boldconsensus_class where taxID > 0 group by bin_uri  ) b
SET a.class_num_usages = b.class_num_usages where a.bin_uri=b.bin_uri;

UPDATE boldconsensus a, (SELECT bin_uri, sum(sup_usages) as phylum_num_usages from boldconsensus_phylum where taxID > 0 group by bin_uri  ) b
SET a.phylum_num_usages = b.phylum_num_usages where a.bin_uri=b.bin_uri;

alter table boldconsensus add column species_remarks TEXT;

UPDATE boldconsensus a, (SELECT  bin_uri,  GROUP_CONCAT(distinct CONCAT(name, " (", sup_usages, ")") SEPARATOR ", ") as remarks from boldconsensus_species where taxID > 0 group by bin_uri) b SET a.species_remarks = b.remarks WHERE a.bin_uri=b.bin_uri;

alter table boldconsensus add column genus_remarks TEXT;

UPDATE boldconsensus a, (SELECT  bin_uri,  GROUP_CONCAT(distinct CONCAT(name, " (", sup_usages, ")") SEPARATOR ", ") as remarks from boldconsensus_genus where taxID > 0  group by bin_uri) b SET a.genus_remarks = b.remarks WHERE a.bin_uri=b.bin_uri;

alter table boldconsensus add column family_remarks TEXT;

UPDATE boldconsensus a, (SELECT  bin_uri,  GROUP_CONCAT(distinct CONCAT(name, " (", sup_usages, ")") SEPARATOR ", ") as remarks from boldconsensus_family where taxID > 0 group by bin_uri) b SET a.family_remarks = b.remarks WHERE a.bin_uri=b.bin_uri;

alter table boldconsensus add column order_remarks TEXT;

UPDATE boldconsensus a, (SELECT  bin_uri,  GROUP_CONCAT(distinct CONCAT(name, " (", sup_usages, ")") SEPARATOR ", ") as remarks from boldconsensus_order where taxID > 0 group by bin_uri) b SET a.order_remarks = b.remarks WHERE a.bin_uri=b.bin_uri;

alter table boldconsensus add column class_remarks TEXT;

UPDATE boldconsensus a, (SELECT  bin_uri,  GROUP_CONCAT(distinct CONCAT(name, " (", sup_usages, ")") SEPARATOR ", ") as remarks from boldconsensus_class where taxID > 0 group by bin_uri) b SET a.class_remarks = b.remarks WHERE a.bin_uri=b.bin_uri;

alter table boldconsensus add column phylum_remarks TEXT;

UPDATE boldconsensus a, (SELECT  bin_uri,  GROUP_CONCAT(distinct CONCAT(name, " (", sup_usages, ")") SEPARATOR ", ") as remarks from boldconsensus_phylum where taxID > 0 group by bin_uri) b SET a.phylum_remarks = b.remarks WHERE a.bin_uri=b.bin_uri;