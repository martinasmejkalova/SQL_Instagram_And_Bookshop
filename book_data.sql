CREATE DATABASE book_shop;
USE book_shop;
CREATE TABLE books 
	(
		book_id INT NOT NULL AUTO_INCREMENT,
		title VARCHAR(100),
		author_fname VARCHAR(100),
		author_lname VARCHAR(100),
		released_year INT,
		stock_quantity INT,
		pages INT,
		PRIMARY KEY(book_id)
	);

INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);

SELECT * from books;

SELECT CONCAT(author_fname,' ', author_lname) AS author_name FROM books;

SELECT CONCAT_WS(" - ", title, author_fname, author_lname) FROM books;

SELECT SUBSTRING(title, 1, 15) fROM books;
SELECT SUBSTR(title, 1, 10) AS 'short title' FROM books;

SELECT 
    CONCAT(SUBSTR(title, 1, 10), '...') AS short_title
FROM
    books;
    
SELECT REPLACE ('cheese bread coffee', ' ', ' and ');

SELECT REPLACE (title, ' ', ' - ') FROM books;

SELECT title FROM books;

SELECT CONCAT(author_fname, REVERSE(author_fname)) FROM books;

SELECT CONCAT(author_lname, ' is ', CHAR_LENGTH(author_lname), ' characters long') FROM books;

SELECT CONCAT('MY FAVORITE BOOK IS ', LOWER(title)) FROM books;

SELECT REPLACE (title, ' ', '->') AS title FROM books;
SELECT author_lname as forwards, REVERSE(author_lname) as backwards FROM books;

SELECT UPPER(CONCAT(author_fname,' ', author_lname)) as full_name_in_caps FROM books;

SELECT CONCAT('The ',title, 'was released in ', released_year) AS blurb FROM books;

SELECT title, char_length(title) AS number_of_characters FROM books;

SELECT 
    CONCAT(LEFT(title, 10), '...') as short_title,
    CONCAT(author_lname, ',', author_fname) AS author,
    CONCAT(stock_quantity, ' in stock') AS quantity
FROM
    books;
    
INSERT INTO books
    (title, author_fname, author_lname, released_year, stock_quantity, pages)
    VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
           ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
           ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);
           
SELECT * FROM books;

SELECT DISTINCT author_lname FROM books;

SELECT DISTINCT author_fname, author_lname FROM books;

INSERT INTO books (title, author_lname) VALUES ('my life', 'steele');

SELECT book_id, author_fname, author_lname, pages
FROM books ORDER BY author_lname, author_fname;

SELECT * FROM books
WHERE author_fname LIKE '____';

SELECT * FROM books
WHERE title LIKE '%\_%';

SELECT title FROM books WHERE title LIKE '%stories%';

SELECT 
    title, pages
FROM
    books
ORDER BY pages DESC
LIMIT 1;

SELECT 
    CONCAT(title, ' - ', released_year) AS summary
FROM
    books
ORDER BY released_year DESC
LIMIT 3;

SELECT 
    title, author_lname
FROM
    books
WHERE
    author_lname LIKE '% %';
    
SELECT 
    title, released_year, stock_quantity
FROM
    books
ORDER BY stock_quantity, title ASC
LIMIT 1,3;

SELECT title, author_lname FROM books ORDER BY author_lname, title;

SELECT 
    UPPER(CONCAT('my favorite author is ',
                    author_fname,
                    ' ',
                    author_lname,
                    '!')) AS yell
FROM
    books ORDER BY author_lname;
    
SELECT COUNT(author_fname) FROM books;

SELECT author_lname, COUNT(*) FROM books GROUP BY author_lname;

SELECT released_year, COUNT(*) FROM books GROUP BY released_year;

SELECT MIN(released_year) FROM books;

SELECT * FROM books WHERE pages = (SELECT MIN(pages) FROM books);
SELECT title, released_year FROM books 
WHERE released_year = (SELECT MIN(released_year) FROM books);

SELECT 
    author_fname, author_lname, COUNT(*)
FROM
    books
GROUP BY author_lname , author_fname;

SELECT CONCAT(author_fname, ' ', author_lname) AS author,  COUNT(*)
FROM books
GROUP BY author;

SELECT 
    author_fname, author_lname, COUNT(*), MIN(released_year), MAX(released_year)
FROM
    books
GROUP BY author_lname , author_fname;

SELECT author_lname, SUM(pages) FROM books GROUP BY author_lname;

SELECT author_lname, COUNT(*), SUM(pages)
FROM books
GROUP BY author_lname;

SELECT 
    released_year, 
    AVG(stock_quantity), 
    COUNT(*) FROM books
GROUP BY released_year;

SELECT released_year, COUNT(*) FROM books GROUP BY released_year;

SELECT COUNT(*) FROM books;

SELECT 
    AVG(released_year)
FROM
    books
GROUP BY author_lname, author_fname;

SELECT 
    CONCAT(author_fname, ' ', author_lname) AS author,
    MAX(pages)
FROM
    books
GROUP BY author;

SELECT CONCAT(author_fname, ' ', author_lname) AS author, pages from Books ORDER BY pages DESC LIMIT 1;

SELECT 
    released_year AS year, COUNT(*) AS books, AVG(pages)
FROM
    books
GROUP BY year
ORDER BY year;

SELECT NOW();

SELECT 
    birthdate,
    DAY(birthdate),
    DAYOFWEEK(birthdate),
    DAYOFYEAR(birthdate)
FROM people;

SELECT birthdate, DATE_FORMAT(birthdate, '%a %b %D') FROM people;
 
SELECT birthdt, DATE_FORMAT(birthdt, '%H:%i') FROM people;
 
SELECT birthdt, DATE_FORMAT(birthdt, 'BORN ON: %r') FROM people;

CREATE TABLE captions (
  text VARCHAR(150),
  created_at TIMESTAMP default CURRENT_TIMESTAMP
);
 
CREATE TABLE captions2 (
  text VARCHAR(150),
  created_at TIMESTAMP default CURRENT_TIMESTAMP,
  updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
SELECT DAYOFWEEK(CURDATE());
SELECT DAYOFWEEK(NOW());
SELECT DATE_FORMAT(NOW(), '%w') + 1;

SELECT DATE_FORMAT(CURDATE(), '%m/%d/%Y');

SELECT DATE_FORMAT(NOW(), '%M %D at %h:%i');

SELECT CURDATE();

SELECT DAYOFWEEK(CURDATE());

SELECT DAYNAME(NOW());
SELECT DATE_FORMAT(NOW(), '%W');

CREATE TABLE tweets(
    content VARCHAR(140),
    username VARCHAR(20),
    created_at TIMESTAMP DEFAULT NOW()
);
 INSERT INTO tweets (content, username) VALUES('this is my first tweet', 'coltscat');
SELECT * FROM tweets;
INSERT INTO tweets (content, username) VALUES('this is my second tweet', 'coltscat');

 SELECT * from tweets;
 
 SELECT * FROM books WHERE released_year != 1997;
 
 SELECT * FROM books WHERE title NOT LIKE '% %';
 
 SELECT * FROM books where author_lname = 'Eggers' AND released_year > 2010;
 
 SELECT title, pages FROM books 
WHERE CHAR_LENGTH(title) > 30
AND pages > 500;
 
SELECT title, author_lname FROM books
WHERE author_lname='Eggers' AND
released_year > 2010;
 
SELECT title, author_lname, released_year FROM books
WHERE author_lname='Eggers' OR
released_year > 2010;
 
 
SELECT title, pages FROM books
WHERE pages < 200 
OR title LIKE '%stories%';

SELECT title, released_year FROM books
WHERE released_year <= 2015
AND released_year >= 2004;
 
SELECT title, released_year FROM books
WHERE released_year BETWEEN 2004 AND 2014;

SELECT * FROM people WHERE birthtime 
BETWEEN CAST('12:00:00' AS TIME) 
AND CAST('16:00:00' AS TIME);
 
 
SELECT * FROM people WHERE HOUR(birthtime)
BETWEEN 12 AND 16;

SELECT * FROM books where released_year >=2000 AND released_year % 2 != 1;

SELECT 
    title,
    released_year,
    CASE
        WHEN released_year > 2000 THEN 'modern lit'
        ELSE 'no'
    END AS genre
FROM
    books;
    
    SELECT 
    title,
    stock_quantity,
    CASE
        WHEN stock_quantity <= 40 THEN '*'
        WHEN stock_quantity <= 70 THEN '**'
        WHEN stock_quantity <= 100 THEN '***'
        WHEN stock_quantity <= 140 THEN '****'
        ELSE '*****'
    END AS stock
FROM
    books;
    
DELETE FROM books where title IS NULL
    
SELECT 10!= 10;

SELECT * FROM books WHERE released_year < 1980;
 
SELECT * FROM books 
WHERE author_lname = 'Eggers'
OR author_lname = 'Chabon';
 
SELECT * FROM books
WHERE author_lname = 'Lahiri'
AND released_year > 2000;
 
SELECT * FROM books
WHERE pages >= 100 
AND pages <= 200;
 
SELECT * FROM books
WHERE pages BETWEEN 100 and 200;
 
SELECT title, author_lname FROM books
WHERE author_lname LIKE 'C%'
OR author_lname LIKE 'S%';
 
SELECT title, author_lname
FROM books WHERE SUBSTR(author_lname, 1, 1) in ('C', 'S');
 
SELECT title, author_lname,
CASE
    WHEN title LIKE '%stories%' THEN 'Short Stories'
    WHEN title = 'Just Kids' THEN 'Memoir' 
    WHEN title = 'A Heartbreaking Work of Staggering Genius' THEN 'Memior'
    ELSE 'Novel'
END AS type
FROM books;
 
 
SELECT author_fname, author_lname,
	CASE
        WHEN COUNT(*) = 1 THEN '1 book'
        ELSE CONCAT(COUNT(*), ' books')
	END AS count
FROM books
WHERE author_lname IS NOT NULL
GROUP BY author_fname, author_lname;
 
 CREATE TABLE users2 (
    username VARCHAR(20) NOT NULL,
    age INT,
    CONSTRAINT age_not_negative CHECK (age >= 0)
);
 
CREATE TABLE palindromes2 (
  word VARCHAR(100),
  CONSTRAINT word_is_palindrome CHECK(REVERSE(word) = word)
);

CREATE TABLE companies (
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    CONSTRAINT name_address UNIQUE (name , address)
);
 
CREATE TABLE houses (
  purchase_price INT NOT NULL,
  sale_price INT NOT NULL,
  CONSTRAINT sprice_gt_pprice CHECK(sale_price >= purchase_price)
);

ALTER TABLE companies 
ADD COLUMN phone VARCHAR(15);
 
ALTER TABLE companies
ADD COLUMN employee_count INT NOT NULL DEFAULT 1;

ALTER TABLE companies
MODIFY company_name VARCHAR(100) DEFAULT 'unknown';


ALTER TABLE suppliers
CHANGE business biz_name VARCHAR(50);

ALTER TABLE houses 
ADD CONSTRAINT positive_pprice CHECK (purchase_price >= 0);


ALTER TABLE houses DROP CONSTRAINT positive_pprice;


CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50)
);



CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    amount DECIMAL(8,2),
	customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);



CREATE DATABASE shop;

INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
       
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016-02-10', 99.99, 1),
       ('2017-11-11', 35.50, 1),
       ('2014-12-12', 800.67, 2),
       ('2015-01-03', 12.50, 2),
       ('1999-04-11', 450.25, 5);
       
SELECT id FROM customers WHERE last_name = "George";
SELECT * FROM orders WHERE customer_id = 1;

SELECT * FROM orders, customers;

SELECT 
    first_name, last_name, SUM(amount) AS total
FROM
    customers
        JOIN
    orders ON customers.id = orders.customer_id
GROUP BY first_name , last_name
ORDER BY total DESC;

SELECT first_name, last_name, order_date, amount FROM orders
LEFT JOIN customers ON customers.id = orders.customer_id;

SELECT first_name, last_name, IFNULL(SUM(amount), 0) AS money_spent FROM customers
LEFT JOIN orders ON customers.id = orders.customer_id GROUP BY first_name, last_name;

USE shop;

CREATE TABLE students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50)
);

CREATE TABLE papers (
    title VARCHAR(50),
    grade INT,
    student_id INT,
    FOREIGN KEY (student_id)
        REFERENCES students (id)
);

INSERT INTO students (first_name) VALUES 
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');
 
INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

SELECT 
    first_name, IFNULL(title, "Missing"), IFNULL(grade,0)
FROM
    students
       LEFT JOIN
    papers ON students.id = papers.student_id;

SELECT 
    first_name,
    IFNULL(AVG(grade), 0) AS average,
    CASE
        WHEN IFNULL(AVG(grade), 0) >= 75 THEN 'PASSING'
        ELSE 'FAILING'
    END AS passing_status
FROM
    students
        LEFT JOIN
    papers ON students.id = papers.student_id
GROUP BY first_name
ORDER BY average DESC;

CREATE TABLE reviewers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

CREATE TABLE series (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100),
    released_year YEAR,
    genre VARCHAR(100)
);

CREATE TABLE reviews (
    id INT PRIMARY KEY AUTO_INCREMENT,
    rating DECIMAL(2 , 1 ),
    series_id INT,
    reviewer_id INT,
    FOREIGN KEY (series_id)
        REFERENCES series (id),
    FOREIGN KEY (reviewer_id)
        REFERENCES reviewers (id)
);


INSERT INTO series (title, released_year, genre) VALUES
    ('Archer', 2009, 'Animation'),
    ('Arrested Development', 2003, 'Comedy'),
    ("Bob's Burgers", 2011, 'Animation'),
    ('Bojack Horseman', 2014, 'Animation'),
    ("Breaking Bad", 2008, 'Drama'),
    ('Curb Your Enthusiasm', 2000, 'Comedy'),
    ("Fargo", 2014, 'Drama'),
    ('Freaks and Geeks', 1999, 'Comedy'),
    ('General Hospital', 1963, 'Drama'),
    ('Halt and Catch Fire', 2014, 'Drama'),
    ('Malcolm In The Middle', 2000, 'Comedy'),
    ('Pushing Daisies', 2007, 'Comedy'),
    ('Seinfeld', 1989, 'Comedy'),
    ('Stranger Things', 2016, 'Drama');
 
 
INSERT INTO reviewers (first_name, last_name) VALUES
    ('Thomas', 'Stoneman'),
    ('Wyatt', 'Skaggs'),
    ('Kimbra', 'Masters'),
    ('Domingo', 'Cortes'),
    ('Colt', 'Steele'),
    ('Pinkie', 'Petit'),
    ('Marlon', 'Crafford');
    
 
INSERT INTO reviews(series_id, reviewer_id, rating) VALUES
    (1,1,8.0),(1,2,7.5),(1,3,8.5),(1,4,7.7),(1,5,8.9),
    (2,1,8.1),(2,4,6.0),(2,3,8.0),(2,6,8.4),(2,5,9.9),
    (3,1,7.0),(3,6,7.5),(3,4,8.0),(3,3,7.1),(3,5,8.0),
    (4,1,7.5),(4,3,7.8),(4,4,8.3),(4,2,7.6),(4,5,8.5),
    (5,1,9.5),(5,3,9.0),(5,4,9.1),(5,2,9.3),(5,5,9.9),
    (6,2,6.5),(6,3,7.8),(6,4,8.8),(6,2,8.4),(6,5,9.1),
    (7,2,9.1),(7,5,9.7),
    (8,4,8.5),(8,2,7.8),(8,6,8.8),(8,5,9.3),
    (9,2,5.5),(9,3,6.8),(9,4,5.8),(9,6,4.3),(9,5,4.5),
    (10,5,9.9),
    (13,3,8.0),(13,4,7.2),
    (14,2,8.5),(14,3,8.9),(14,4,8.9);
    
    SELECT * FROM series
    JOIN reviews ON reviews.series_id = series.ID
    LIMIT 15;
    
SELECT 
    title, ROUND(AVG(rating),2) AS avg_rating
FROM
    series
        JOIN
    reviews ON reviews.series_id = series.id
GROUP BY title
ORDER BY avg_rating;

SELECT first_name, last_name, rating FROM reviewers
JOIN reviews ON reviews.reviewer_id = reviewers.id;

SELECT title AS unreviewed_series FROM series
LEFT JOIN reviews ON reviews.series_id = series.id
WHERE rating IS NULL;

SELECT genre, ROUND(avg(rating),2) AS avg_rating
FROM series
JOIN reviews ON reviews.series_id = series.id
GROUP BY genre;

SELECT 
    first_name,
    last_name,
    COUNT(rating),
    IFNULL(MIN(rating), 0) AS MIN,
    IFNULL(MAX(rating), 0) AS MAX,
    ROUND(IFNULL(AVG(rating), 0), 2) AS average,
    CASE
        WHEN COUNT(rating) >= 10 THEN 'POWERUSER'
        WHEN COUNT(rating) >= 0 THEN 'active'
        ELSE 'inactive'
    END AS status
FROM
    reviewers
        LEFT JOIN
    reviews ON reviews.reviewer_id = reviewers.id
GROUP BY first_name , last_name;

SELECT 
    title,
    rating,
    CONCAT(first_name, ' ', last_name) AS reviewer
FROM
    series
        JOIN
    reviews ON reviews.reviewer_id = series.id
        JOIN
    reviewers ON reviewers.id = series.id;
    
    CREATE VIEW full_reviews AS
    SELECT 
    title,
    rating,
    CONCAT(first_name, ' ', last_name) AS reviewer
FROM
    series
        JOIN
    reviews ON reviews.reviewer_id = series.id
        JOIN
    reviewers ON reviewers.id = series.id;
    

SELECT * from full_reviews;

DELETE FROM full_reviews WHERE title = "Archer";

CREATE VIEW ordered_series AS
SELECT * FROM series ORDER BY released_year;

SELECT * FROM ordered_series;

ALTER VIEW ordered_series AS
SELECT * FROM series ORDER BY released_year;

CREATE OR REPLACE VIEW ordered_series AS
SELECT * FROM series ORDER BY released_year DESC;

SELECT * FROM full_reviews;

SELECT title, AVG(rating) 
FROM full_reviews 
GROUP BY title WITH ROLLUP;

SELECT 
    first_name, released_year, genre, AVG(rating)
FROM
    full_reviews
GROUP BY released_year , genre , first_name WITH ROLLUP;

SELECT 
    title, 
    AVG(rating),
    COUNT(rating) AS review_count
FROM full_reviews 
GROUP BY title HAVING COUNT(rating) > 1;

SELECT 
    first_name, released_year, genre, AVG(rating)
FROM
    full_reviews
GROUP BY released_year , genre , first_name WITH ROLLUP;

SELECT @@session.sql_mode;

CREATE DATABASE 

SET GLOBAL sql_mode = 'modes';
SET SESSION sql_mode = 'modes';


CREATE TABLE employees (
    emp_no INT PRIMARY KEY AUTO_INCREMENT,
    department VARCHAR(20),
    salary INT
);

INSERT INTO employees (department, salary) VALUES
('engineering', 80000),
('engineering', 69000),
('engineering', 70000),
('engineering', 103000),
('engineering', 67000),
('engineering', 89000),
('engineering', 91000),
('sales', 59000),
('sales', 70000),
('sales', 159000),
('sales', 72000),
('sales', 60000),
('sales', 61000),
('sales', 61000),
('customer service', 38000),
('customer service', 45000),
('customer service', 61000),
('customer service', 40000),
('customer service', 31000),
('customer service', 56000),
('customer service', 55000);

SELECT emp_no, department, salary, AVG(salary) OVER(PARTITION BY department) AS avg_dpt, AVG(salary) OVER() AS company_avg FROM employees;
 
SELECT 
    emp_no, 
    department, 
    salary, 
    SUM(salary) OVER(PARTITION BY department) AS dept_payroll,
    SUM(salary) OVER() AS total_payroll
FROM employees;

SELECT 
    emp_no, 
    department, 
    salary, 
    SUM(salary) OVER(PARTITION BY department ORDER BY salary) AS rolling_dept_salary,
    SUM(salary) OVER(PARTITION BY department) AS total_dept_salary
FROM employees;

SELECT 
    emp_no, 
    department, 
    salary, 
    MIN(salary) OVER(PARTITION BY department ORDER BY salary DESC) as rolling_min
FROM employees;
 
SELECT 
    emp_no, 
    department, 
    salary,
    ROW_NUMBER() OVER(PARTITION BY department ORDER BY SALARY DESC) as dept_row_number,
    RANK() OVER(PARTITION BY department ORDER BY SALARY DESC) as dept_salary_rank,
    RANK() OVER(ORDER BY salary DESC) as overall_rank,
    DENSE_RANK() OVER(ORDER BY salary DESC) as overall_dense_rank,
    ROW_NUMBER() OVER(ORDER BY salary DESC) as overall_num
FROM employees ORDER BY overall_rank;

SELECT emp_no, department, salary, NTILE(4) OVER(ORDER BY salary DESC) AS sal_quartile, NTILE(4) OVER(PARTITION BY department ORDER BY salary DESC) AS dep_quartile
FROM employees;

SELECT 
    emp_no, 
    department, 
    salary,
    NTILE(4) OVER(PARTITION BY department ORDER BY salary DESC) AS dept_salary_quartile,
	NTILE(4) OVER(ORDER BY salary DESC) AS salary_quartile
FROM employees;

SELECT 
    emp_no, 
    department, 
    salary,
    FIRST_VALUE(emp_no) OVER(PARTITION BY department ORDER BY salary DESC) as highest_paid_dept,
    FIRST_VALUE(emp_no) OVER(ORDER BY salary DESC) as highest_paid_overall
FROM employees;

SELECT 
    emp_no, 
    department, 
    salary,
    salary - LAG(salary) OVER(ORDER BY salary DESC) as salary_diff
FROM employees;
 
SELECT 
    emp_no, 
    department, 
    salary,
    salary - LAG(salary) OVER(PARTITION BY department ORDER BY salary DESC) as dept_salary_diff
FROM employees;

