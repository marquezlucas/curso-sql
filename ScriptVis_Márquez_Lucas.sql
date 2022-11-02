


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
    sales DECIMAL (11,3),
    profit DECIMAL (11,2),
    PRIMARY KEY (order_id),
    FOREIGN KEY (ditail_id) REFERENCES ditail (ditail_id)
) ENGINE=InnoDB AUTO_INCREMENT=1
;  

-- Se generan dos subtablas de category. Una es ship_mode y la otra sub_category.

-- Se crea y se estructura la tabla ship_mode.

CREATE TABLE IF NOT EXISTS ship_mode (
	ship_mode_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    ship_mode VARCHAR (40) NOT NULL,
    PRIMARY KEY (ship_mode_id)
) ENGINE=InnoDB AUTO_INCREMENT=1
;  

-- Se crea y se estructura la tabla sub_category.
 
CREATE TABLE IF NOT EXISTS sub_category (
	sub_category_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    sub_category VARCHAR (40),
    PRIMARY KEY (sub_category_id)
) ENGINE=InnoDB AUTO_INCREMENT=1
;  

 -- Se crea y se estructura la tabla category. Se continua con la rama de la tabla product.
 
CREATE TABLE IF NOT EXISTS category (
	category_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    product_id INT UNSIGNED NOT NULL,
    ship_mode_id INT UNSIGNED NOT NULL,
    sub_category_id INT UNSIGNED NOT NULL,
    category VARCHAR (40),
    PRIMARY KEY (category_id),
    FOREIGN KEY (product_id) REFERENCES product (product_id),
    FOREIGN KEY (ship_mode_id) REFERENCES ship_mode (ship_mode_id),
    FOREIGN KEY (sub_category_id) REFERENCES sub_category (sub_category_id)
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

CREATE TABLE IF NOT EXISTS country (
	country_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    country VARCHAR (40) NOT NULL,
    PRIMARY KEY (country_id)
) ENGINE=InnoDB AUTO_INCREMENT=1
; 

 -- Se crea y se estructura la tabla client.

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

CREATE TABLE IF NOT EXISTS postal_code (
	postal_code_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    postal_code INT NOT NULL,
    PRIMARY KEY (postal_code_id)
) ENGINE=InnoDB AUTO_INCREMENT=1
;   

-- Se crea y se estructura la tabla city.

CREATE TABLE IF NOT EXISTS city (
	city_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    city VARCHAR (40) NOT NULL,
    PRIMARY KEY (city_id)
) ENGINE=InnoDB AUTO_INCREMENT=1
;

-- Se crea y se estructura la tabla state.

CREATE TABLE IF NOT EXISTS state (
	state_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    state VARCHAR (40) NOT NULL,
    PRIMARY KEY (state_id)
) ENGINE=InnoDB AUTO_INCREMENT=1
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
) ENGINE=InnoDB AUTO_INCREMENT=1
;

-- se comienza a insertar registros

USE e_commerce_eeuu
;

-- se insertan 30 registros en la columna state de la tabla state

INSERT INTO state (state) VALUES
('North Carolina'),
('Pennsylvania'),
('Texas'),
('Illinois'),
('Florida'),
('Michigan'),
('Texas'),
('Texas'),
('Texas'),
('Illinois'),
('South Carolina'),
('Minnesota'),
('Minnesota'),
('Oregon'),
('New York'),
('California'),
('North Carolina'),
('North Carolina'),
('North Carolina'),
('New York'),
('Arizona'),
('Arizona'),
('Ohio'),
('Ohio'),
('Ohio'),
('California'),
('California'),
('California'),
('Missouri'),
('Texas')
;

-- se insertan 30 registros en la columna postal_code de la tabla postal_code

INSERT INTO postal_code (postal_code) VALUES
(28027),
(19140),
(77095),
(60540),
(32935),
(49201),
(77041),
(77041),
(77041),
(60623),
(29203),
(55901),
(55901),
(97206),
(10009),
(94122),
(28205),
(28205),
(28205),
(10035),
(85023),
(85023),
(43229),
(43229),
(43229),
(94122),
(94122),
(94122),
(64055),
(77036)
;

-- se insertan 30 registros en la columna city de la tabla city

INSERT INTO city (city) VALUES 
('Concord'),
('Philadelphia'),
('Houston'),
('Naperville'),
('Melbourne'),
('Jackson'),
('Houston'),
('Houston'),
('Houston'),
('Chicago'),
('Columbia'),
('Rochester'),
('Rochester'),
('Columbia'),
('New York City'),
('San Francisco'),
('Charlotte'),
('Charlotte'),
('Charlotte'),
('New York City'),
('Phoenix'),
('Phoenix'),
('Columbus'),
('Columbus'),
('Columbus'),
('San Francisco'),
('San Francisco'),
('San Francisco'),
('Independence'),
('Houston')
;

-- se insertan 30 registros en la columna country de la tabla country

INSERT INTO country (country) VALUES 
('United States'),
('United States'),
('United States'),
('United States'),
('United States'),
('United States'),
('United States'),
('United States'),
('United States'),
('United States'),
('United States'),
('United States'),
('United States'),
('United States'),
('United States'),
('United States'),
('United States'),
('United States'),
('United States'),
('United States'),
('United States'),
('United States'),
('United States'),
('United States'),
('United States'),
('United States'),
('United States'),
('United States'),
('United States'),
('United States')
;

-- se insertan 30 registros en la columna segment de la tabla segment

INSERT INTO segment (segment) VALUES 
('Consumer'),
('Consumer'),
('Home Office'),
('Corporate'),
('Corporate'),
('Consumer'),
('Corporate'),
('Corporate'),
('Corporate'),
('Home Office'),
('Consumer'),
('Consumer'),
('Consumer'),
('Home Office'),
('Home Office'),
('Consumer'),
('Consumer'),
('Consumer'),
('Consumer'),
('Corporate'),
('Consumer'),
('Consumer'),
('Corporate'),
('Corporate'),
('Corporate'),
('Corporate'),
('Corporate'),
('Corporate'),
('Corporate'),
('Consumer'),
('Consumer')
;

-- se insertan 30 registros en la columna quantity de la tabla ditail

INSERT INTO ditail (quantity) VALUES
(3),
(2),
(3),
(4),
(2),
(3),
(3),
(3),
(3),
(3),
(2),
(1),
(2),
(1),
(7),
(3),
(8),
(1),
(1),
(2),
(2),
(7),
(5),
(2),
(9),
(3),
(3),
(3),
(3),
(4)
;

-- se insertan 30 registros en la columna segment de la tabla segment

INSERT INTO sub_category (sub_category) VALUES 
('Paper'),
('Chairs'),
('Paper'),
('Phones'),
('Storage'),
('Paper'),
('Binders'),
('Furnishings'),
('Storage'),
('Storage'),
('Chairs'),
('Accessories'),
('Labels'),
('Binders'),
('Furnishings'),
('Binders'),
('Accessories'),
('Phones'),
('Art'),
('Furnishings'),
('Binders'),
('Storage'),
('Phones'),
('Paper'),
('Fasteners'),
('Art'),
('Envelopes'),
('Paper'),
('Appliances'),
('Appliances')
;

-- se insertan 30 registros en la columna ship_mode de la tabla ship_mode

INSERT INTO ship_mode (ship_mode) VALUES 
('Standard Class'),
('Second Class'),
('Second Class'),
('Standard Class'),
('Standard Class'),
('Second Class'),
('First Class'),
('First Class'),
('First Class'),
('First Class'),
('Second Class'),
('Standard Class'),
('Standard Class'),
('Standard Class'),
('Second Class'),
('First Class'),
('Standard Class'),
('Standard Class'),
('Standard Class'),
('Standard Class'),
('Standard Class'),
('Standard Class'),
('First Class'),
('First Class'),
('First Class'),
('Standard Class'),
('Standard Class'),
('Standard Class'),
('Standard Class'),
('Second Class')
;

-- se insertan 30 registros en la columna product_name de la tabla product y se inserta el numero de id de la columna ditail_id de la tabla ditail

INSERT INTO product (ditail_id, product_name) VALUES
(1, 'Xerox 1967'),
(2, 'Global Deluxe Stacking Chair, Gray'),
(3, 'Easy-staple paper'),
(4, 'Panasonic Kx-TS550'),
(5, 'Advantus 10-Drawer Portable Organizer, Chrome Metal Frame, Smoke Drawers'),
(6, 'Telephone Message Books with Fax/Mobile Section, 5 1/2" x 3 3/16"'),
(7, 'Economy Binders'),
(8, '6" Cubicle Wall Clock, Black'),
(9, 'SimpliFile Personal File, Black Granite, 15w x 6-15/16d x 11-1/4h'),
(10, 'Safco Industrial Wire Shelving'),
(11, 'Novimex Swivel Fabric Task Chair'),
(12, 'Logitech LS21 Speaker System - PC Multimedia - 2.1-CH - Wired'),
(13, 'Avery 511'),
(14, 'Flexible Leather- Look Classic Collection Ring Binder'),
(15, '9-3/4 Diameter Round Wall Clock'),
(16, 'Trimflex Flexible Post Binders'),
(17, 'Memorex Mini Travel Drive 8 GB USB 2.0 Flash Drive'),
(18, 'Speck Products Candyshell Flip Case'),
(19, 'Newell Chalk Holder'),
(20, 'Magnifier Swing Arm Lamp'),
(21, 'Avery Durable Slant Ring Binders, No Labels'),
(22, 'Trav-L-File Heavy-Duty Shuttle II, Black'),
(23, 'Anker 36W 4-Port USB Wall Charger Travel Power Adapter for iPhone 5s 5c 5'),
(24, 'Xerox 1916'),
(25, 'Staples'),
(26, 'Newell 343'),
(27, 'Convenience Packs of Business Envelopes'),
(28, 'Xerox 1911'),
(29, 'Sanyo 2.5 Cubic Foot Mid-Size Office Refrigerators'),
(30, 'Acco 7-Outlet Masterpiece Power Center, Wihtout Fax/Phone Line Protection')
;

-- se insertan 30 registros en la columna category de la tabla category, se inserta el numero de id 
-- de la columna ship_mode_id de la tabla ship_mode, se inserta el numero de id de la columna sub_category_id de la tabla sub_category
-- y se inserta el numero de id de la columna product_id de la tabla product.

INSERT INTO category (product_id, ship_mode_id, sub_category_id, category) VALUES
(1, 1, 1, 'Office Supplies'),
(2, 2, 2, 'Furniture'),
(3, 3, 3, 'Office Supplies'),
(4, 4, 4, 'Technology'),
(5, 5, 5, 'Office Supplies'),
(6, 6, 6, 'Office Supplies'),
(7, 7, 7, 'Office Supplies'),
(8, 8, 8, 'Furniture'),
(9, 9, 9, 'Office Supplies'),
(10, 10, 10, 'Office Supplies'),
(11, 11, 11, 'Furniture'),
(12, 12, 12, 'Technology'),
(13, 13, 13, 'Office Supplies'),
(14, 14, 14, 'Office Supplies'),
(15, 15, 15, 'Furniture'),
(16, 16, 16, 'Office Supplies'),
(17, 17, 17, 'Technology'),
(18, 18, 18, 'Technology'),
(19, 19, 19, 'Office Supplies'),
(20, 20, 20, 'Furniture'),
(21, 21, 21, 'Office Supplies'),
(22, 22, 22, 'Office Supplies'),
(23, 23, 23, 'Technology'),
(24, 24, 24, 'Office Supplies'),
(25, 25, 25, 'Office Supplies'),
(26, 26, 26, 'Office Supplies'),
(27, 27, 27, 'Office Supplies'),
(28, 28, 28, 'Office Supplies'),
(29, 29, 29, 'Office Supplies'),
(30, 30, 30, 'Office Supplies')
;

-- se insertan 30 registros en la columna region de la tabla region, se inserta el numero de id 
-- de la columna country_id de la tabla country, se inserta el numero de id de la columna postal_code_id de la tabla postal_code,
-- se inserta el numero de id de la columna state_id de la tabla state y se inserta el numero de id de la columna city_id de la tabla city.

INSERT INTO region (country_id, state_id, city_id, postal_code_id, region) VALUES
(1, 1, 1, 1, 'South'),
(2, 2, 2, 2, 'East'),
(3, 3, 3, 3, 'Central'),
(4, 4, 4, 4, 'Central'),
(5, 5, 5, 5, 'South'),
(6, 6, 6, 6, 'Central'),
(7, 7, 7, 7, 'Central'),
(8, 8, 8, 8, 'Central'),
(9, 9, 9, 9, 'Central'),
(10, 10, 10, 10, 'Central'),
(11, 11, 11, 11, 'South'),
(12, 12, 12, 12, 'Central'),
(13, 13, 13, 13, 'Central'),
(14, 14, 14, 14, 'West'),
(15, 15, 15, 15, 'East'),
(16, 16, 16, 16, 'West'),
(17, 17, 17, 17, 'South'),
(18, 18, 18, 18, 'South'),
(19, 19, 19, 19, 'South'),
(20, 20, 20, 20, 'East'),
(21, 21, 21, 21, 'West'),
(22, 22, 22, 22, 'West'),
(23, 23, 23, 23, 'East'),
(24, 24, 24, 24, 'East'),
(25, 25, 25, 25, 'East'),
(26, 26, 26, 26, 'West'),
(27, 27, 27, 27, 'West'),
(28, 28, 28, 28, 'West'),
(29, 29, 29, 29, 'Central'),
(30, 30, 30, 30, 'Central')
;
-- se insertan 30 registros en las columnas order_date, discount, sales, profit de la tabla sales y se inserta el numero de id 
-- de la columna ditail_id de la tabla ditail.

INSERT INTO sales (ditail_id, order_date, discount, sales, profit) VALUES
(1, '15-04-20', 0.2, 15.552, 54432),
(2, '16-07-20', 0.3, 71.372, -10.19),
(3, '19-10-20', 0.2, 29.472, 99468),
(4, '10-09-20', 0.2, 147.168, 165564),
(5, '19-09-20', 0.2, 95.616, 95616),
(6, '14-09-20', 0, 19.05, 8763),
(7, '09-12-20', 0.8, 1.248, -19.34),
(8, '09-12-20', 0.6, 9.708, -58.24),
(9, '09-12-20', 0.2, 27.24, 2724),
(10, '13-11-20', 0.2, 230.376, -489.54),
(11, '28-05-20', 0, 301.96, 332156),
(12, '26-10-20', 0, 19.99, 67966),
(13, '26-10-20', 0, 6.16, 29568),
(14, '06-11-20', 0.7, 5.682, -3.78),
(15, '09-11-20', 0, 96.53, 405426),
(16, '17-06-20', 0.2, 51.312, 179592),
(17, '23-11-20', 0.2, 74.112, 176016),
(18, '23-11-20', 0.2, 27.992, 20994),
(19, '23-11-20', 0.2, 3.304, 10738),
(20, '25-12-20', 0, 41.96, 109096),
(21, '05-11-20', 0.7, 2.388, -18.30),
(22, '05-11-20', 0.2, 243.992, 30499),
(23, '02-02-20', 0.4, 59.97, -11.99),
(24, '02-02-20', 0.2, 78.304, 29364),
(25, '02-02-20', 0.2, 21.456, 69732),
(26, '18-09-20', 0, 8.82, 23814),
(27, '18-09-20', 0, 10.86, 51042),
(28, '18-09-20', 0, 143.7, 68976),
(29, '22-12-20', 0, 839.43, 2182518),
(30, '21-04-20', 0.8, 97.264, -243.16)
;

-- se insertan 30 registros en la columna mail de la tabla client, se inserta el numero de id 
-- de la columna country_id de la tabla country, se inserta el numero de id de la columna order_id de la tabla sales y
-- se inserta el numero de id de la columna segment_id de la tabla segment.

INSERT INTO client (order_id, segment_id, country_id, mail) VALUES
(1, 1, 1, 'juancho@hotmail.com'),
(2, 2, 2, 'pedro@gmail.com'),
(3, 3, 3, 'lucas@gmail.com'),
(4, 4, 4, 'camila@hotmail.com'),
(5, 5, 5, 'sofia@hotmail.com'),
(6, 6, 6, 'edgardo@outlook.com'),
(7, 7, 7, 'sebastion@outlook.com'),
(8, 8, 8, 'cecilia@gmail.com'),
(9, 9, 9, 'augusto@gmail.com'),
(10, 10, 10, 'mario@gmail.com'),
(11, 11, 11, 'bautista@outlook.com'),
(12, 12, 12, 'tatiana@outlook.com'),
(13, 13, 13, 'asd@outlook.com'),
(14, 14, 14, 'qwe@hotmail.com'),
(15, 15, 15, 'zxc@hotmail.com'),
(16, 16, 16, 'rty@hotmail.com'),
(17, 17, 17, 'fgh@outlook.com'),
(18, 18, 18, 'vbn@gmail.com'),
(19, 19, 19, 'uio@gmail.com'),
(20, 20, 20, 'jkl@hotmail.com'),
(21, 21, 21, 'mñp@hotmail.com'),
(22, 22, 22, '123@gmail.com'),
(23, 23, 23, '456@outlook.com'),
(24, 24, 24, '789@gmail.com'),
(25, 25, 25, '987@outlook.com'),
(26, 26, 26, '654@outlook.com'),
(27, 27, 27, '321@hotmail.com'),
(28, 28, 28, '111@gmail.com'),
(29, 29, 29, '222@gmail.com'),
(30, 30, 30, '333@hotmail.com')
;

-- se comienza a crear views

USE e_commerce_eeuu;

CREATE OR REPLACE VIEW client_sales_view
AS
	SELECT
    c.customer_id,
    c.mail,
    v.order_date,
    v.discount,
    v.sales,
    v.profit
    FROM 
    client AS c JOIN sales AS v ON (c.order_id = v.order_id)
    WHERE mail LIKE UPPER('%@hotmail%')
;    
    
CREATE OR REPLACE VIEW region_segment_ditail_view
AS
	SELECT
    v.region,
    b.segment,
    COUNT(n.quantity)
    FROM
    client AS c 
    JOIN region AS v ON (c.customer_id = v.region_id)
    JOIN segment AS b ON (c.segment_id = b.segment_id) 
    JOIN ditail AS n ON (c.customer_id = n.ditail_id)
GROUP BY v.region
;
    
CREATE OR REPLACE VIEW city_sales_ditail_product_view
AS
	SELECT
    c.city,
    v.sales,
    b.quantity,
    n.product_name
    FROM
    client AS x 
    JOIN city AS c ON (x.customer_id = c.city_id)
    JOIN sales AS v ON (x.order_id = v.order_id) 
    JOIN ditail AS b ON (v.order_id = b.ditail_id)
    JOIN product AS n ON (b.ditail_id = n.ditail_id)
ORDER BY c.city DESC
;

CREATE OR REPLACE VIEW category_ship_mode_sub_category_product_ditail_sales_view
AS
	SELECT
    c.category,
    v.ship_mode,
    b.sub_category,
    n.product_name,
    m.quantity,
    l.*
    FROM
    category AS c 
    JOIN ship_mode AS v ON (c.ship_mode_id = v.ship_mode_id)
    JOIN sub_category AS b ON (c.sub_category_id = b.sub_category_id) 
    JOIN product AS n ON (c.product_id = n.product_id)
    JOIN ditail AS m ON (n.ditail_id = m.ditail_id)
    JOIN sales AS l ON (m.ditail_id = l.ditail_id)
	WHERE m.quantity > 2 AND v.ship_mode = 'First Class'
;

CREATE OR REPLACE VIEW product_sales_city_postal_code_view
AS
	SELECT
    b.city,
    n.postal_code,
    SUM(v.profit) AS suma_profit
    FROM sales AS v
    JOIN product AS c ON (v.ditail_id = c.ditail_id)
    JOIN city AS b ON (v.order_id = b.city_id)
    JOIN postal_code AS n ON (v.order_id = postal_code_id)
    GROUP BY n.postal_code
    ORDER BY b.city
;
    