USE my_guitar_shop;

DROP PROCEDURE IF EXISTS insert_category;

DELIMITER //
CREATE PROCEDURE insert_category(param VARCHAR(255))
    BEGIN
        INSERT INTO categories(category_name)
        VALUES(param);
        SELECT category_name
            FROM categories
            ORDER BY category_id DESC;
    END//
DELIMITER ;

CALL insert_category('Brass');

SHOW PROCEDURE STATUS WHERE db = 'my_guitar_shop';

CALL insert_category('Woodwinds');
