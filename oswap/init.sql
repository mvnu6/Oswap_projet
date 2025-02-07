
DROP TABLE IF EXISTS users CASCADE;
CREATE TABLE IF NOT EXISTS users (
    id_user SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);


DROP TABLE IF EXISTS category CASCADE;
CREATE TABLE IF NOT EXISTS category (
    id_category SERIAL PRIMARY KEY,
    name_category VARCHAR(50) NOT NULL,
    description_category VARCHAR(255) NOT NULL,
    image_category VARCHAR(255) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);


DROP TABLE IF EXISTS brand  CASCADE;
CREATE TABLE IF NOT EXISTS brand  (
    id_brand SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);


DROP TABLE IF EXISTS product CASCADE;
CREATE TABLE IF NOT EXISTS product (
    id_product SERIAL PRIMARY KEY,
    name_product VARCHAR(100) NOT NULL,
    description_product TEXT NULL,
    price_product DECIMAL(10,2) NOT NULL,
    image_product VARCHAR(255) NOT NULL,
    id_brand INT,
    id_category INT,
    id_type INT,
    FOREIGN KEY (id_brand) REFERENCES brand(id_brand) ON DELETE CASCADE,
    FOREIGN KEY (id_category) REFERENCES category(id_category) ON DELETE CASCADE
    FOREIGN KEY (id_type) REFERENCES type(id_type) ON DELETE CASCADE
);


DROP TABLE IF EXISTS type CASCADE;
CREATE TABLE IF NOT EXISTS type (
    id_type SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'La date de création de la catégorie',  
    updated_at TIMESTAMP NULL COMMENT 'La date de la dernière mise à jour de la catégorie',
);

