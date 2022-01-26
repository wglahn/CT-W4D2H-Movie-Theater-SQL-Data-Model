DROP TABLE IF EXISTS customer CASCADE;
CREATE TABLE customer(
    customer_id SERIAL PRIMARY KEY,
    customer_first_name VARCHAR(100),
    customer_last_name VARCHAR(100)
);

DROP TABLE IF EXISTS movie_rating CASCADE;
CREATE TABLE movie_rating(
    movie_rating_id SERIAL PRIMARY KEY,
    movie_rating VARCHAR(100)
);

DROP TABLE IF EXISTS movie CASCADE;
CREATE TABLE movie(
    movie_id SERIAL PRIMARY KEY,
    movie_name VARCHAR(100),
    movie_desc TEXT,
    movie_rating_id INTEGER NOT NULL,
    FOREIGN KEY(movie_rating_id) REFERENCES movie_rating(movie_rating_id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS concession CASCADE;
CREATE TABLE concession(
    concession_id SERIAL PRIMARY KEY,
    concession_name VARCHAR(100),
    concession_price DECIMAL(5,2)
);

DROP TABLE IF EXISTS ticket CASCADE;
CREATE TABLE ticket(
    ticket_id SERIAL PRIMARY KEY,
    price DECIMAL(5,2),
    date_time TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc',now()),
    customer_id INTEGER NOT NULL,
    movie_id INTEGER NOT NULL,
    FOREIGN KEY(customer_id) REFERENCES customer(customer_id) ON DELETE CASCADE,
    FOREIGN KEY(movie_id) REFERENCES movie(movie_id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS customer_concession CASCADE;
CREATE TABLE customer_concession(
    customer_id INTEGER NOT NULL,
    concession_id INTEGER NOT NULL,
    FOREIGN KEY(customer_id) REFERENCES customer(customer_id) ON DELETE CASCADE,
    FOREIGN KEY(concession_id) REFERENCES concession(concession_id) ON DELETE CASCADE
);

INSERT INTO customer (
    customer_id,
    customer_first_name,
    customer_last_name
  )
VALUES (
    customer_id:integer,
    'customer_first_name:character varying',
    'customer_last_name:character varying'
  );INSERT INTO customer (customer_first_name, customer_last_name) VALUES
('Mickey', 'Mouse'),
('Donald', 'Duck'),
('Minnie', 'Mouse'),
('Daisy', 'Duck'),
('Pluto', 'Dog'),
('Goofy', 'Dog');

INSERT INTO movie_rating (movie_rating) VALUES
('G'),
('PG'),
('PG-13'),
('R'),
('NC-17');

INSERT INTO movie (movie_name, movie_desc, movie_rating_id) VALUES
('Calebs Python', 'A love hate relationship between a man and his python.', 4),
('The Matrix Resurrections', 'The fourth installment of the Matrix series.', 4),
('Sing 2', 'Buster Moon and his friends must persuade reclusive rock star Clay Calloway to join them for the opening of a new show.', 2);

INSERT INTO ticket (customer_id, movie_id, price) VALUES
(1,2,10),
(2,2,10),
(3,1,25),
(4,1,25),
(5,3,5),
(6,3,5);

INSERT INTO concession(concession_name, concession_price) VALUES
('Popcorn', 7.99),
('Candy', 10.99),
('Soda', 5.99);

INSERT INTO customer_concession(customer_id, concession_id) VALUES
(1,1),
(1,3),
(2,2),
(3,1),
(4,3),
(5,2);

ALTER TABLE customer
ADD customer_age INTEGER;

UPDATE customer
SET customer_age = 93
WHERE customer_id = 1;

UPDATE customer
SET customer_age = 90
WHERE customer_id = 2;

UPDATE customer
SET customer_age = 93
WHERE customer_id = 3;

UPDATE customer
SET customer_age = 81
WHERE customer_id = 4;

UPDATE customer
SET customer_age = 91
WHERE customer_id = 5;

UPDATE customer
SET customer_age = 89
WHERE customer_id = 6;