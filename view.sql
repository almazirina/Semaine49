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


