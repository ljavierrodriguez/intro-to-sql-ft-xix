-- Active: 1679577619104@@127.0.0.1@3306

-- DDL => Data Definition Lenguage

DROP DATABASE IF EXISTS intro_to_sql;

CREATE DATABASE IF NOT EXISTS intro_to_sql;

USE intro_to_sql;

CREATE TABLE
    users (
        id INTEGER NOT NULL AUTO_INCREMENT,
        name VARCHAR(50) NULL,
        lastname VARCHAR(50) NULL,
        email VARCHAR(120) NOT NULL,
        address VARCHAR(200) NULL,
        PRIMARY KEY (id),
        UNIQUE KEY (email)
    );

CREATE TABLE
    todos (
        id INTEGER NOT NULL AUTO_INCREMENT,
        task VARCHAR(150) NOT NULL,
        date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        users_id INTEGER NOT NULL,
        PRIMARY KEY (id),
        FOREIGN KEY (users_id) REFERENCES users (id)
    );

CREATE TABLE
    phone_numbers (
        id INTEGER NOT NULL AUTO_INCREMENT,
        phone VARCHAR(40) NOT NULL,
        users_id INTEGER NOT NULL,
        PRIMARY KEY (id),
        FOREIGN KEY (users_id) REFERENCES users (id)
    );

-- DML => DATA MANIPULATION LANGUAGE

-- SELECT, INSERT, UPDATE, DELETE

-- SELECT * FROM table_name; SELECT field1, field2, ...fieldn FROM table_name;

SELECT * FROM users;

SELECT name, lastname, email FROM users;

SELECT * FROM users WHERE email = 'john.doe@gmail.com';

SELECT * FROM users WHERE id = 1;

-- INSERT INTO table_name (field1, field2, ...fieldn) VALUES ('value1', value2, ...'valuen');

INSERT INTO
    users (name, lastname, email, address)
VALUES (
        'John',
        'Doe',
        'john.doe@gmail.com',
        'av new york 5'
    );

INSERT INTO
    users (name, lastname, email)
VALUES (
        'Jane',
        'Doe',
        'jane.doe@gmail.com'
    );

-- UPDATE table_name SET field1=value1, field2=value2, ...fieldn=valuen WHERE condition;

UPDATE users SET address='av new york 5' WHERE id = 1;

UPDATE users SET address='illinois, 333' WHERE id = 3;

-- DELETE FROM table_name WHERE condition;

DELETE FROM users WHERE id = 3;

DELETE FROM users WHERE id in (1,2,3,4,5) 