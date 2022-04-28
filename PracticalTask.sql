DROP TABLE customer_address;

CREATE TABLE customer_address (
address_id SERIAL PRIMARY KEY NOT NULL,
address VARCHAR(255),
city VARCHAR(255) NOT NULL, 
province VARCHAR(255),
state_UK VARCHAR(255),
postal_code INT CHECK (postal_code > 0),
country VARCHAR(255) NOT NULL
);

--INSERT mandatory fields:
INSERT INTO 
	customer_address (city, country) 	 	
VALUES 
	('Gabrovo', 'Bulgaria'),
	('Sliven','Bulgaria'),
	('Velingrad','Bulgaria'),
	('Devin', 'Bulgaria');

--INSERT some of the fields:
INSERT INTO 
	customer_address (address, city, province, postal_code, country) 	 	
VALUES 
	('4-10 Kir Blago Todev Street, Bansko 2770, Bulgaria', 'Bansko', 'Bansko',3127, 'Bulgaria'),
	('1, Gourko Str., 1000 Sofia, Bulgaria', 'Sofia', 'Sofia',3237, 'Bulgaria'),
	('Kosherinata Str, Green Life Sky & Spa Resort, 1 Floor, Bansko 2770, Bulgaria', 'Bansko', 'Bansko',5478, 'Bulgaria'),
	('344 Carrer de Còrsega, Eixample, 08037 Barcelona, Spain', 'Barcelona', 'Barcelona', 9,'Spain'),
	('277, Carrer de Provença, Eixample, 08037 Barcelona, Spain ', 'Barcelona', 'Barcelona', 35,'Spain'),
	('Glazne Str, 5, Bansko 2770, Bulgaria', 'Bansko', 'Bansko', 3687,'Bulgaria'),
	('Rúa das Casas Reais, 29, 15704 Santiago de Compostela, Spain', 'Santiago de Compostela', 'Santiago de Compostela', 657,'Spain'),
	('SIKAMINI STR, Marmari, 85300, Greece', 'Marmari', 'Marmari',3647, 'Greece'),
	('Hersonissos, Limenas Hersonissou, Hersonissos, 70014, Greece', 'Hersonissos', 'Hersonissos',3258, 'Greece'),
	('Lara Yolu Muratpaşa, 07100 Antalya, Turkey', 'Antalya', 'Antalya',12,'Turkey'),
	(' Al Jadaf Street, Behind Latifa Hospital, Al Jadaf - Dubai Al Jadaf Street, Behind Latifa Hospital, Al Jadaf - Dubai, Bur Dubai, Dubai, United Arab Emirates', 'Dubai', 'Dubai', 325789,'United Arab Emirates'),
	('14 Rue Brey, 17th arr., 75017 Paris, France', 'Paris', 'Paris', 369785, 'France');

--INSERT some of the fields:
INSERT INTO 
	customer_address (address, city, state_UK, postal_code, country) 	 	
VALUES 
	('200 Westminster Bridge Road, London, SE1 7UT, United Kingdom', 'London', 'UK', 5211, 'United Kingdom'),
	('St Katharines Way, London, E1W 1LD, United Kingdom', 'London', 'UK', 5211, 'United Kingdom'),
	('11 Blackfriars Street, Manchester, M3 5AL, United Kingdom', 'Manchester', 'UK', 8911, 'United Kingdom'),
	('1 Morrison Link, Edinburgh, EH3 8DN, United Kingdom', 'Edinburgh', 'UK', 1211, 'United Kingdom'),
	('3-5 Portland Street, Manchester, M1 6DP, United Kingdom', 'Manchester', 'UK', 5295, 'United Kingdom'),
	('Great Colmore Street, Birmingham, B15 2AP, United Kingdom', 'Birmingham', 'UK', 3737, 'United Kingdom');


--VIEW bulgarian_customers_addresses which contains only addreses in Bulgaria
CREATE VIEW bulgarian_customers_addresses as
SELECT * 
FROM 
	customer_address
WHERE 
	country LIKE 'Bulgaria'; 

--countries ordered alphabetically
SELECT country
FROM 
	customer_address
ORDER BY 
	country;


--cities that start with a specific letter
SELECT city
FROM 
	customer_address
WHERE 
	city LIKE 'L%';

--3 different random cities located in Bulgaria
SELECT city
FROM 
	customer_address
WHERE 
	country LIKE 'Bulgaria'
ORDER BY 
	RANDOM()
LIMIT 3;

--all addresses in Bulgaria outside of Sliven, Gabrovo, Varna
SELECT *
FROM 
	customer_address
WHERE 
		country LIKE 'Bulgaria' 
	AND 
		city NOT LIKE 'Sliven' 
	AND
	 	city NOT LIKE 'Gabrovo'
	AND 
	 	city NOT LIKE 'Varna'
		


--last 10 added customer addresses with a 
--province and address filled, but without a state value
SELECT 
	address
FROM 
	customer_address
WHERE 
	address IS NOT NULL
	AND 
	province IS NOT NULL
	AND 
	state_UK IS NULL
ORDER BY 
		address_id DESC
LIMIT 10;

--addresses that have 4-digit postal code that start with 3 and end with 7.
--Order the result alpabetically by country and city
SELECT 
postal_code,
	address,
	country,
	city
FROM 
	customer_address
WHERE 
	postal_code ::text LIKE '3__7'
ORDER BY 
	country, city;


