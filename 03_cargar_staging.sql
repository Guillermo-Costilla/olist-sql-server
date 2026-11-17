-- Selecciono la db para trabajar en ella
USE olistDB;

-- inserte datos a una tabla de staging mediante "Tareas" con el asistente, pero no tomo el nombre de la colunna
-- Tengo que borrar los nombres de las columnas ya que no son datos.
-- Primero hago una consulta select con el mismo where antes de borrar nada, para ver que datos trae

SELECT * FROM stg_category_translation
WHERE product_category_name = 'product_category_name';

-- El select esta OK, pasamos a borrar la fila con el nombre de las columnas.

DELETE FROM stg_category_translation
WHERE product_category_name = 'product_category_name';

-- 1 fila afectada, ahora realizo un conteo de los datos

SELECT COUNT(*) FROM stg_category_translation; -- conteo OK

-- Insertamos los datos en sellers con el bulk

BULK INSERT stg_sellers
FROM 'D:\Proyecto final Olist\CSV\olist_sellers_dataset.csv'
WITH (
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '0x0a',
	FIRSTROW = 2,
	CODEPAGE = '65001'
);


-- inserto los datos en customers con el BULK

BULK INSERT stg_customers
FROM 'D:\Proyecto final Olist\CSV\olist_customers_dataset.csv'
WITH (
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '0x0a',
	FIRSTROW = 2,
	CODEPAGE = '65001'
); -- Corrió OK 99.441 filas.


-- inserto las ordenes con BULK

BULK INSERT stg_orders
FROM 'D:\Proyecto final Olist\CSV\olist_orders_dataset.csv'
WITH (
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '0x0a',
	FIRSTROW = 2,
	CODEPAGE = '65001'
); -- OK. 99.441 filas.

-- insertamos los productos con BULK

BULK INSERT stg_products
FROM 'D:\Proyecto final Olist\CSV\olist_products_dataset.csv'
WITH (
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '0x0a',
	FIRSTROW = 2,
	CODEPAGE = '65001'
); -- OK. 32.951 filas.

-- inserto los datos en orders items con BULK

BULK INSERT stg_orders_items 
FROM 'D:\Proyecto final Olist\CSV\olist_order_items_dataset.csv'
WITH (
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '0x0a',
	FIRSTROW = 2,
	CODEPAGE = '65001'
); --OK. 112.650 filas

-- inserto los datos en order payments con el BULK

BULK INSERT stg_order_payments
FROM 'D:\Proyecto final Olist\CSV\olist_order_payments_dataset.csv'
WITH(
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '0x0a',
	FIRSTROW = 2,
	CODEPAGE = '65001'
); -- OK. 103.886 FILAS


-- Insertamos los datos con el BULK pero con FORMAT ya que hay titulos y comentarios con comas y comillas.

BULK INSERT stg_order_reviews 
FROM 'D:\Proyecto final Olist\CSV\olist_order_reviews_dataset.csv'
WITH (
	FORMAT = 'CSV',
	FIRSTROW = 2,
	CODEPAGE = '65001'
); -- OK. 99.224 filas

-- Inserto los datos en la última tabla

BULK INSERT stg_geolocation
FROM 'D:\Proyecto final Olist\CSV\olist_geolocation_dataset.csv'
WITH (
 FIELDTERMINATOR = ',',
 ROWTERMINATOR = '0x0a',
 FIRSTROW = 2,
 CODEPAGE = '65001',
 TABLOCK
); -- OK. 1.000.163 filas. Demoro 2 SEG.

-- FIN.