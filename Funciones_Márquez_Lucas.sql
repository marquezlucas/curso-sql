USE e_commerce_eeuu;

DROP FUNCTION IF EXISTS `segment_discount`;

DELIMITER $$

DROP FUNCTION IF EXISTS `client_id` $$

CREATE FUNCTION `client_id` (mail VARCHAR(40)) 
RETURNS INT
READS SQL DATA
BEGIN
	DECLARE customer_id INT;
	SET customer_id = (SELECT
							customer_id
					   FROM client
					   WHERE customer_id = customer_id);
	RETURN customer_id;
   
END $$

DELIMITER ;

DELIMITER $$

USE e_commerce_eeuu $$
CREATE FUNCTION `segment_discount`(segment VARCHAR (40), quantity INT)
RETURNS DECIMAL (3,2)
READS SQL DATA
BEGIN
	 DECLARE customerLevel VARCHAR(20);

    IF credit > 50000 THEN
		SET customerLevel = 'PLATINUM';
    ELSEIF (credit >= 50000 AND 
			credit <= 10000) THEN
        SET customerLevel = 'GOLD';
    ELSEIF credit < 10000 THEN
        SET customerLevel = 'SILVER';
    END IF; 
END $$

DELIMITER ;
