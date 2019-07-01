
DROP PROCEDURE IF EXISTS getSpeciesForBINS;
DELIMITER ;;
CREATE PROCEDURE getSpeciesForBINS()
BEGIN
  DECLARE cursor_BIN VARCHAR(255);
  DECLARE done INT DEFAULT FALSE;
  DECLARE cursor_i CURSOR FOR SELECT bin_uri FROM bins b;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
  OPEN cursor_i;
  read_loop: LOOP
    FETCH cursor_i INTO cursor_BIN;
    IF done THEN
      LEAVE read_loop;
    END IF;
    UPDATE boldconsensus a, (SELECT  bin_uri, taxID as species_taxID, `name` as species_name, sup_usages as species_sup_usages from boldconsensus_species where bin_uri = cursor_BIN group by bin_uri, taxID order by sup_usages desc limit 1) b SET a.species_taxID = b.species_taxID, a.species_sup_usages = b.species_sup_usages, a.species_name=b.species_name where a.bin_uri = b.bin_uri AND a.bin_uri=cursor_BIN;
  END LOOP;
  CLOSE cursor_i;
END;
;;
DELIMITER ;

DROP PROCEDURE IF EXISTS getGenusForBINS;
DELIMITER ;;
CREATE PROCEDURE getGenusForBINS()
BEGIN
  DECLARE cursor_BIN VARCHAR(255);
  DECLARE done INT DEFAULT FALSE;
  DECLARE cursor_i CURSOR FOR SELECT bin_uri FROM bins b ;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
  OPEN cursor_i;
  read_loop: LOOP
    FETCH cursor_i INTO cursor_BIN;
    IF done THEN
      LEAVE read_loop;
    END IF;
    UPDATE boldconsensus a, (SELECT  bin_uri, taxID as genus_taxID, `name` as genus_name, sup_usages as genus_sup_usages from boldconsensus_genus where bin_uri = cursor_BIN group by bin_uri, taxID order by sup_usages desc limit 1) b SET a.genus_taxID = b.genus_taxID, a.genus_sup_usages = b.genus_sup_usages, a.genus_name=b.genus_name where a.bin_uri = b.bin_uri AND a.bin_uri=cursor_BIN;
  END LOOP;
  CLOSE cursor_i;
END;
;;
DELIMITER ;

DROP PROCEDURE IF EXISTS getFamilyForBINS;
DELIMITER ;;
CREATE PROCEDURE getFamilyForBINS()
BEGIN
  DECLARE cursor_BIN VARCHAR(255);
  DECLARE done INT DEFAULT FALSE;
  DECLARE cursor_i CURSOR FOR SELECT bin_uri FROM bins b ;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
  OPEN cursor_i;
  read_loop: LOOP
    FETCH cursor_i INTO cursor_BIN;
    IF done THEN
      LEAVE read_loop;
    END IF;
    UPDATE boldconsensus a, (SELECT  bin_uri, taxID as family_taxID, `name` as family_name, sup_usages as family_sup_usages from boldconsensus_family where bin_uri = cursor_BIN group by bin_uri, taxID order by sup_usages desc limit 1) b SET a.family_taxID = b.family_taxID, a.family_sup_usages = b.family_sup_usages, a.family_name=b.family_name where a.bin_uri = b.bin_uri AND a.bin_uri=cursor_BIN;
  END LOOP;
  CLOSE cursor_i;
END;
;;
DELIMITER ;

DROP PROCEDURE IF EXISTS getOrderForBINS;
DELIMITER ;;
CREATE PROCEDURE getOrderForBINS()
BEGIN
  DECLARE cursor_BIN VARCHAR(255);
  DECLARE done INT DEFAULT FALSE;
  DECLARE cursor_i CURSOR FOR SELECT bin_uri FROM bins b ;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
  OPEN cursor_i;
  read_loop: LOOP
    FETCH cursor_i INTO cursor_BIN;
    IF done THEN
      LEAVE read_loop;
    END IF;
    UPDATE boldconsensus a, (SELECT  bin_uri, taxID as order_taxID, `name` as order_name, sup_usages as order_sup_usages from boldconsensus_order where bin_uri = cursor_BIN group by bin_uri, taxID order by sup_usages desc limit 1) b SET a.order_taxID = b.order_taxID, a.order_sup_usages = b.order_sup_usages, a.order_name=b.order_name where a.bin_uri = b.bin_uri AND a.bin_uri=cursor_BIN;
  END LOOP;
  CLOSE cursor_i;
END;
;;
DELIMITER ;

DROP PROCEDURE IF EXISTS getClassForBINS;
DELIMITER ;;
CREATE PROCEDURE getClassForBINS()
BEGIN
  DECLARE cursor_BIN VARCHAR(255);
  DECLARE done INT DEFAULT FALSE;
  DECLARE cursor_i CURSOR FOR SELECT bin_uri FROM bins b ;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
  OPEN cursor_i;
  read_loop: LOOP
    FETCH cursor_i INTO cursor_BIN;
    IF done THEN
      LEAVE read_loop;
    END IF;
    UPDATE boldconsensus a, (SELECT  bin_uri, taxID as class_taxID, `name` as class_name, sup_usages as class_sup_usages from boldconsensus_class where bin_uri = cursor_BIN group by bin_uri, taxID order by sup_usages desc limit 1) b SET a.class_taxID = b.class_taxID, a.class_sup_usages = b.class_sup_usages, a.class_name=b.class_name where a.bin_uri = b.bin_uri AND a.bin_uri=cursor_BIN;
  END LOOP;
  CLOSE cursor_i;
END;
;;
DELIMITER ;


DROP PROCEDURE IF EXISTS getPhylumForBINS;
DELIMITER ;;
CREATE PROCEDURE getPhylumForBINS()
BEGIN
  DECLARE cursor_BIN VARCHAR(255);
  DECLARE done INT DEFAULT FALSE;
  DECLARE cursor_i CURSOR FOR SELECT bin_uri FROM bins b ;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
  OPEN cursor_i;
  read_loop: LOOP
    FETCH cursor_i INTO cursor_BIN;
    IF done THEN
      LEAVE read_loop;
    END IF;
    UPDATE boldconsensus a, (SELECT  bin_uri, taxID as phylum_taxID, `name` as phylum_name, sup_usages as phylum_sup_usages from boldconsensus_phylum where bin_uri = cursor_BIN group by bin_uri, taxID order by sup_usages desc limit 1) b SET a.phylum_taxID = b.phylum_taxID, a.phylum_sup_usages = b.phylum_sup_usages, a.phylum_name=b.phylum_name where a.bin_uri = b.bin_uri AND a.bin_uri=cursor_BIN;
  END LOOP;
  CLOSE cursor_i;
END;
;;
DELIMITER ;



CALL getSpeciesForBINS();
CALL getGenusForBINS();
CALL getFamilyForBINS();
CALL getOrderForBINS();
CALL getClassForBINS();
CALL getPhylumForBINS();

