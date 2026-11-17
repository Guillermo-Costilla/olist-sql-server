-- Selecciono la db para trabajar en ella
USE olistDB;

-- inserte datos a una tabla de staging stg_category_translation mediante "Tareas" con el asistente, pero no tomo el nombre de la colunna
-- Tengo que borrar los nombres de las columnas ya que no son datos.
-- Primero hago una consulta select con el mismo where antes de borrar nada, para ver que datos trae

SELECT * FROM stg_category_translation
WHERE product_category_name = 'product_category_name';

-- El select esta OK, pasamos a borrar la fila con el nombre de las columnas.

DELETE FROM stg_category_translation
WHERE product_category_name = 'product_category_name';

-- 1 fila afectada, ahora realizo un conteo de los datos

SELECT COUNT(*) FROM stg_category_translation; -- conteo OK

GO

-- Ahora creo la tabla de staging para cargarlo mediante un bulk insert

CREATE TABLE stg_sellers (

	seller_id VARCHAR(100),
	seller_zip_code_prefix VARCHAR(100),
	seller_city VARCHAR(100),
	seller_state VARCHAR(100)
);

-- Creo la staging de clientes

CREATE TABLE stg_customers (
customer_id VARCHAR(100),
customer_unique_id VARCHAR(100),
customer_zip_code_prefix VARCHAR(100),
customer_city VARCHAR(100),
customer_state VARCHAR(100)
);

-- staging de ordenes

CREATE TABLE stg_orders (
order_id VARCHAR(100),
customer_id VARCHAR(100),
order_status VARCHAR(100),
order_purchase_timestamp VARCHAR(100),
order_approved_at VARCHAR(100),
order_delivered_carrier_date VARCHAR(100),
order_delivered_customer_date VARCHAR(100),
order_estimated_delivery_date VARCHAR(100)
);

-- staging de productos

CREATE TABLE stg_products (
product_id VARCHAR(100),
product_category_name VARCHAR(100),
product_name_lenght VARCHAR(100),
product_description_lenght VARCHAR(100),
product_photos_qty VARCHAR(100),
product_weight_g VARCHAR(100),
product_length_cm VARCHAR(100),
product_height_cm VARCHAR(100),
product_width_cm VARCHAR(100)
);

-- Staging de Orders items

CREATE TABLE stg_orders_items (
order_id VARCHAR(100),
order_item_id VARCHAR(100),
product_id VARCHAR(100),
seller_id VARCHAR(100),
shipping_limit_date VARCHAR(100),
price VARCHAR(100),
freight_value VARCHAR(100)
);

-- staging de order payments
 
CREATE TABLE stg_order_payments (
order_id VARCHAR(100),
payment_sequential VARCHAR(100),
payment_type VARCHAR(100),
payment_installments VARCHAR(100),
payment_value VARCHAR(100)
);

-- Staging reviews

CREATE TABLE stg_order_reviews (
review_id VARCHAR(100),
order_id VARCHAR(100),
review_score VARCHAR(100),
review_comment_title VARCHAR(MAX),
review_comment_message VARCHAR(MAX),
review_creation_date VARCHAR(100),
review_answer_timestamp VARCHAR(100)
);

-- staging de Geolocalizacion 

CREATE TABLE stg_geolocation (
geolocation_zip_code_prefix VARCHAR(100),
geolocation_lat VARCHAR(100),
geolocation_lng VARCHAR(100),
geolocation_city VARCHAR(100),
geolocation_state VARCHAR(100)
);

-- FIN