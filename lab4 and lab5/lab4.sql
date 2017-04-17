-- 1.1
INSERT INTO client 
VALUES (3, "kirill","2007-05-23",89989000212);

-- 1.2
INSERT INTO client (name_client, date_of_birth, phone_number) 
VALUES ("artyom", "12.03.1198", 89677311234);

-- 1.3
INSERT INTO voucher (id_client) 
SELECT id_client FROM client;

-- 2.1
DELETE *
FROM voucher;

-- 2.2
DELETE *
FROM voucher
WHERE id_client = 4;

-- 2.3
TRUNCATE TABLE voucher;

-- 3.1
UPDATE voucher SET price = 12000;

-- 3.2
UPDATE voucher SET price = 13500
WHERE id_voucher = 4;

-- 3.3
UPDATE terrain SET relief = "forest", extension = 150 
WHERE relief = "mountain";

-- 4.1
SELECT name_client, phone_number
FROM client;

-- 4.2
SELECT *
FROM route_program;

-- 4.3
SELECT * FROM route WHERE name_route = "boom";