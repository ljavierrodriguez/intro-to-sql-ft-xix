-- Active: 1679661136225@@127.0.0.1@3306@intro_to_sql

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

INSERT INTO
    users (name, lastname, email)
VALUES (
        'Luis',
        'Rodriguez',
        'lrodriguez@4geeks.co'
    );

-- UPDATE table_name SET field1=value1, field2=value2, ...fieldn=valuen WHERE condition;

UPDATE users SET address='av new york 5' WHERE id = 1;

UPDATE users SET address='illinois, 333' WHERE id = 3;

-- DELETE FROM table_name WHERE condition;

DELETE FROM users WHERE id = 3;

DELETE FROM users WHERE id in (1, 2, 3, 4, 5);

INSERT INTO
    todos (task, date, users_id)
VALUES 
('Buy Bread', '2023-03-08', 1), 
('Prueba', '2023-03-23', 1), 
('Go to supermarket', '2023-03-23', 3), 
('Prueba', '2023-03-23', 3);

INSERT INTO todos (task, users_id) VALUES ('Go to the scholl', 3);

SELECT * FROM todos WHERE users_id = 3;

-- Usuarios con Tareas
SELECT u.*, t.* FROM users AS u
JOIN todos AS t ON u.id = t.users_id
WHERE t.date BETWEEN '2023-03-08 00:00:00' AND '2023-03-23 23:59:59';

-- Usuarios con o sin tareas
SELECT * FROM users AS u 
LEFT JOIN todos AS t ON u.id = t.users_id
WHERE u.id IN (1, 2, 3, 4);

SELECT * FROM users AS u
RIGHT JOIN todos AS t ON u.id = t.users_id;



SELECT * FROM users AS u 
LEFT JOIN todos AS t ON u.id = t.users_id
WHERE u.id IN (1, 2, 3, 4)

UNION 

SELECT * FROM users AS u
RIGHT JOIN todos AS t ON u.id = t.users_id;


SELECT * FROM users AS u 
LEFT OUTER JOIN todos AS t ON u.id = t.users_id
WHERE u.id IN (1, 2, 3, 4);

SELECT * FROM users AS u 
RIGHT OUTER JOIN todos AS t ON u.id = t.users_id
WHERE u.id IN (1, 2, 3, 4) ORDER BY t.date desc;

SELECT count(1) as total, t.users_id, u.name FROM todos AS t
LEFT JOIN users AS u ON t.users_id = u.id
GROUP BY t.users_id;

SELECT CONCAT(u.name, ' ', u.lastname) AS fullname, count(t.users_id) AS todos FROM users AS u
LEFT JOIN todos AS t ON u.id = t.users_id
GROUP BY u.id;