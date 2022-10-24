-- Creando la base de datos e_commerce_eeuu.
 
SET NAMES utf8mb4
;
 
 
DROP SCHEMA IF EXISTS e_commerce_eeuu
;

CREATE SCHEMA e_commerce_eeuu
;
 
-- Se llama a la base de datos e_commerce_eeuu.
 
USE e_commerce_eeuu
;
 
-- Se comienzan a crear las diferentes tablas de la base de datos.

-- Se crea y se estructura la tabla ditail.
 
CREATE TABLE IF NOT EXISTS ditail (
	ditail_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    quantity INT NOT NULL,
    PRIMARY KEY (ditail_id)
) ENGINE=InnoDB AUTO_INCREMENT=1
;
 
-- Se crea y se estructura la tabla product.
 
CREATE TABLE IF NOT EXISTS product (
	product_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    ditail_id INT UNSIGNED NOT NULL,
    product_name VARCHAR (100),
    PRIMARY KEY (product_id),
    FOREIGN KEY (ditail_id) REFERENCES ditail (ditail_id)
) ENGINE=InnoDB AUTO_INCREMENT=1
;

-- Se crea y se estructura la tabla sales.

CREATE TABLE IF NOT EXISTS sales (
	order_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    ditail_id INT UNSIGNED NOT NULL,
    order_date DATE,
    discount DECIMAL (4,2),
    sales DECIMAL (11,2),
    profit DECIMAL (11,2),
    PRIMARY KEY (order_id),
    FOREIGN KEY (ditail_id) REFERENCES ditail (ditail_id)
) ENGINE=InnoDB AUTO_INCREMENT=1
;  

 -- Se crea y se estructura la tabla category. Se continua con la rama de la tabla product.
 
CREATE TABLE IF NOT EXISTS category (
	category_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    product_id INT UNSIGNED NOT NULL,
    category VARCHAR (40),
    PRIMARY KEY (category_id),
    FOREIGN KEY (product_id) REFERENCES product (product_id)
) ENGINE=InnoDB AUTO_INCREMENT=1
;

-- Se generan dos subtablas de category. Una es ship_mode y la otra sub_category.

-- Se crea y se estructura la tabla ship_mode.

CREATE TABLE IF NOT EXISTS ship_mode (
	ship_mode_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    category_id INT UNSIGNED NOT NULL,
    ship_mode VARCHAR (40) NOT NULL,
    PRIMARY KEY (ship_mode_id),
    FOREIGN KEY (category_id) REFERENCES category (category_id)
)ENGINE=InnoDB AUTO_INCREMENT=1
;  

-- Se crea y se estructura la tabla sub_category.
 
CREATE TABLE IF NOT EXISTS sub_category (
	sub_category_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    category_id INT UNSIGNED NOT NULL,
    sub_category VARCHAR (40),
    PRIMARY KEY (sub_category_id),
    FOREIGN KEY (category_id) REFERENCES category (category_id)
) ENGINE=InnoDB AUTO_INCREMENT=1
;  

 -- Se continua con la rama de la tabla sales.
 
-- Se crea y se estructura la tabla segment para poder crear la tabla client ya que segment es una FK en client 
-- y si no la genero de antemano, al momento de crear la tabla client no me lo va a permitir. 

CREATE TABLE IF NOT EXISTS segment (
	segment_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    segment VARCHAR (40),
    PRIMARY KEY (segment_id)
) ENGINE=InnoDB AUTO_INCREMENT=1
;  
 
 -- Se crea y se estructura la tabla country.
DROP TABLE IF EXISTS country;
CREATE TABLE IF NOT EXISTS country (
	country_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    country VARCHAR (40) NOT NULL,
    PRIMARY KEY (country_id)
)ENGINE=InnoDB AUTO_INCREMENT=1
; 

 -- Se crea y se estructura la tabla client.
DROP TABLE IF EXISTS client;
CREATE TABLE IF NOT EXISTS client (
	customer_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	order_id INT UNSIGNED NOT NULL,
    segment_id INT UNSIGNED NOT NULL,
    country_id INT UNSIGNED NOT NULL,
    mail VARCHAR(40) NOT NULL,
    PRIMARY KEY (customer_id),
    FOREIGN KEY (order_id) REFERENCES sales (order_id),
    FOREIGN KEY (segment_id) REFERENCES segment (segment_id),
    FOREIGN KEY (country_id) REFERENCES country (country_id)
);


-- Se generan tres subtablas de category. Son postal_code, city y state.

-- Se crea y se estructura la tabla postal_code.
DROP TABLE IF EXISTS postal_code;
CREATE TABLE IF NOT EXISTS postal_code (
	postal_code_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    postal_code INT NOT NULL,
    PRIMARY KEY (postal_code_id)
)ENGINE=InnoDB AUTO_INCREMENT=1
;   

-- Se crea y se estructura la tabla city.
DROP TABLE IF EXISTS city;
CREATE TABLE IF NOT EXISTS city (
	city_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    region_id INT UNSIGNED NOT NULL,
    city VARCHAR (40) NOT NULL,
    PRIMARY KEY (city_id)
)ENGINE=InnoDB AUTO_INCREMENT=1
;

-- Se crea y se estructura la tabla state.
DROP TABLE IF EXISTS state;
CREATE TABLE IF NOT EXISTS state (
	state_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    state VARCHAR (40) NOT NULL,
    PRIMARY KEY (state_id)
)ENGINE=InnoDB AUTO_INCREMENT=1
;   

-- Se crea y se estructura la tabla region.
DROP TABLE IF EXISTS region;
CREATE TABLE IF NOT EXISTS region (
	region_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    country_id INT UNSIGNED NOT NULL,
    state_id INT UNSIGNED NOT NULL,
    city_id INT UNSIGNED NOT NULL,
    postal_code_id INT UNSIGNED NOT NULL,
    region VARCHAR (40) NOT NULL,
    PRIMARY KEY (region_id),
    FOREIGN KEY (country_id) REFERENCES country (country_id),
    FOREIGN KEY (state_id) REFERENCES state (state_id),
    FOREIGN KEY (city_id) REFERENCES city (city_id),
    FOREIGN KEY (postal_code_id) REFERENCES postal_code (postal_code_id)
)ENGINE=InnoDB AUTO_INCREMENT=1
;