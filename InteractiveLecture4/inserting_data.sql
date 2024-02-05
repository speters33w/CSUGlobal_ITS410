USE scratch;

SELECT * FROM customer;

INSERT INTO customer(name, address, city, state, zip) VALUES
('Fred Flinstone', '123 Cobblestone Way', 'Bedrock', 'CO', '81411');

SELECT * FROM customer;

INSERT INTO customer(name, city, state) VALUES
('Jimi Hendrix', 'Renton', 'WA');

SELECT * FROM customer;
