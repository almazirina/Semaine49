/*evaluation*/

CREATE VIEW  catalogue_produits
(pro_id,pro_ref,pro_name,cat_id,cat_name)
 AS SELECT pro_id,pro_ref,pro_name,cat_id,cat_name
 FROM products, categories
 WHERE pro_cat_id = cat_id




/*Programmer des vues*/


CREATE VIEW v_hotels_station_2
AS
SELECT hot_id, hot_nom, sta_nom 
FROM hotel
join station
on hot_sta_id=sta_id
WHERE hot_sta_id=sta_id


/* Programmer des triggers */

CREATE TRIGGER maj_total 
AFTER INSERT ON lignedecommande
FOR EACH ROW

BEGIN
DECLARE @id_c int(10);
DECLARE @tot double(11.2);
    SET id_c = NEW.id_commande; 
    SET tot = (SELECT sum(prix*quantite) FROM lignedecommande WHERE id_commande=id_c);
    UPDATE commande SET total=tot WHERE id=id_c; 
END;





CREATE TABLE IF NOT EXISTS `commander_articles` (
    codart varchar(11) not null,
    qte int(11) not null,
    date datetime DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`codart`)
    ) ENGINE=INNODB DEFAULT CHARSET=utf8;

ALTER TABLE products ENGINE=InnoDB;

CREATE trigger after_products_update
after UPDATE on products
FOR EACH ROW
BEGIN
DECLARE tr_codart varchar(10);
DECLARE tr_qte int(5);
UPDATE commander_articles
SET INSERT INTO commander_articles(codart, qte, date) VALUES (@tr_codart, @tr_qte, now())
WHERE products.`pro_stock_alert`>`pro_stock`
END;