USE my_guitar_shop;

DROP USER IF EXISTS speters;

CREATE USER 'speters' IDENTIFIED BY 'sesame80';

GRANT order_manager TO speters;

SHOW GRANTS FOR speters;

SHOW GRANTS FOR order_manager;