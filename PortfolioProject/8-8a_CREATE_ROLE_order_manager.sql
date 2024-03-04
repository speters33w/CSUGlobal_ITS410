USE my_guitar_shop;

DROP ROLE IF EXISTS 'order_manager';
CREATE ROLE IF NOT EXISTS 'order_manager';

REVOKE USAGE ON *.* FROM order_manager;

GRANT SELECT, INSERT, UPDATE, DELETE
ON my_guitar_shop.customers
TO 'order_manager';

GRANT SELECT, INSERT, UPDATE, DELETE
ON my_guitar_shop.addresses
TO 'order_manager';

GRANT SELECT, INSERT, UPDATE, DELETE
ON my_guitar_shop.orders
TO 'order_manager';

GRANT SELECT, INSERT, UPDATE, DELETE
ON my_guitar_shop.order_items
TO 'order_manager';

GRANT SELECT
ON my_guitar_shop.products
TO 'order_manager';

GRANT SELECT
ON my_guitar_shop.categories
TO 'order_manager';
