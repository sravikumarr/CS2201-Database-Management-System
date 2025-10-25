
CREATE DATABASE BookstoreDB;
USE BookstoreDB;

CREATE TABLE Books(
    BookID VARCHAR(60) PRIMARY KEY,
    Title VARCHAR(55),
    Author VARCHAR(60),
    Price INT,
    PublishDate DATE
);

INSERT INTO Books(BookID, Title, Author, Price, PublishDate)
VALUES
('B101', 'Echoes of Jupiter', 'Aria Sharma', 550, '2021-03-20'),
('B102', 'The Last Algorithm', 'Rohan Desai', 480, '2019-11-05'),
('B103', 'Saffron Skies', 'Mira Chatterjee', 320, '2022-08-14'),
('B104', 'Cybernetic Dawn', 'Vikram Rao', 600, '2020-02-28'),
('B105', 'The Merchant of Byculla', 'Karan Kapoor', 450, '2018-06-10');

CREATE TABLE Customers(
    CustID VARCHAR(45) PRIMARY KEY,
    Email VARCHAR(55),
    JoinDate DATE
);

ALTER TABLE Customers ADD(Name VARCHAR(45));

INSERT INTO Customers(CustID, Email, JoinDate, Name)
VALUES
('C101', 'arjun.r@email.com', '2024-02-10', 'Arjun Reddy'),
('C102', 'meera.p@email.com', '2024-04-18', 'Meera Patel'),
('C103', 'kavya.n@email.com', '2024-06-25', 'Kavya Nair'),
('C104', 'sid.g@email.com', '2024-08-01', 'Siddharth Gupta'),
('C105', 'ananya.j@email.com', '2024-10-09', 'Ananya Joshi');

CREATE TABLE Orders(
    OrderID VARCHAR(55) PRIMARY KEY,
    CustID VARCHAR(45),
    BookID VARCHAR(60),
    Quantity INT,
    OrderDate DATE,
    FOREIGN KEY (CustID) REFERENCES Customers(CustID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

INSERT INTO Orders (OrderID, CustID, BookID, Quantity, OrderDate)
VALUES 
('ORD101', 'C101', 'B102', 1, '2025-09-02'),
('ORD102', 'C102', 'B104', 2, '2025-09-04'),
('ORD103', 'C103', 'B101', 1, '2025-09-06'),
('ORD104', 'C104', 'B105', 3, '2025-09-08'),
('ORD105', 'C105', 'B103', 1, '2025-09-11');

-- ===================================================================
-- QUERIES AND ANSWERS
-- ===================================================================

-- Display all customer names in uppercase.
SELECT UPPER(Name) FROM Customers;
/*
'ARJUN REDDY'
'MEERA PATEL'
'KAVYA NAIR'
'SIDDHARTH GUPTA'
'ANANYA JOSHI'
*/

-- Show all customer names in lowercase.
SELECT LOWER(Name) FROM Customers;
/*
'arjun reddy'
'meera patel'
'kavya nair'
'siddharth gupta'
'ananya joshi'
*/

-- Extract the first 3 letters of each book title.
SELECT SUBSTRING(Title, 1, 3) FROM Books;
/*
'Ech'
'The'
'Saf'
'Cyb'
'The'
*/

-- Display each customer’s email domain (after @).
SELECT SUBSTRING_INDEX(Email, '@', -1) FROM Customers;
/*
'email.com'
'email.com'
'email.com'
'email.com'
'email.com'
*/

-- Find the length of each book title.
SELECT LENGTH(Title) FROM Books;
/*
17
18
13
15
24
*/

-- Replace the word "The" with "A New" in titles (if present).
SELECT REPLACE(Title, 'The', 'A New') FROM Books;
/*
'Echoes of Jupiter'
'A New Last Algorithm'
'Saffron Skies'
'Cybernetic Dawn'
'A New Merchant of Byculla'
*/

-- 7. Concatenate Author name and Book title as a single string.
SELECT CONCAT(Author, ' - ', Title) AS BookAndAuthor 
FROM Books;
/*
'Aria Sharma - Echoes of Jupiter'
'Rohan Desai - The Last Algorithm'
'Mira Chatterjee - Saffron Skies'
'Vikram Rao - Cybernetic Dawn'
'Karan Kapoor - The Merchant of Byculla'
*/

-- 8. Show book titles where the author’s name contains ‘a’.
SELECT Title 
FROM Books 
WHERE Author LIKE '%a%';
/*
'Echoes of Jupiter'
'The Last Algorithm'
'Saffron Skies'
'Cybernetic Dawn'
'The Merchant of Byculla'
*/

-- 9. Display the year in which each book was published.
SELECT YEAR(PublishDate) AS PublicationYear 
FROM Books;
/*
'2021'
'2019'
'2022'
'2020'
'2018'
*/

-- 10. Find the month name in which each customer joined.
SELECT MONTHNAME(JoinDate) AS JoinMonth 
FROM Customers;
/*
'February'
'April'
'June'
'August'
'October'
*/

-- 11. List customers who joined in 2024.
SELECT Name 
FROM Customers 
WHERE YEAR(JoinDate) = 2024;
/*
'Arjun Reddy'
'Meera Patel'
'Kavya Nair'
'Siddharth Gupta'
'Ananya Joshi'
*/

-- 12. Find the day name on which each order was placed.
SELECT DAYNAME(OrderDate) AS DayName 
FROM Orders;
/*
'Tuesday'
'Thursday'
'Saturday'
'Monday'
'Thursday'
*/

-- 13. Display the age of each book (in years since published).
SELECT YEAR(CURDATE()) - YEAR(PublishDate) AS AgeInYears 
FROM Books;
/*
'4'
'6'
'3'
'5'
'7'
*/

-- 14. Find the number of days between today and each customer’s join date.
SELECT DATEDIFF(CURDATE(), JoinDate) AS DaysSinceJoining 
FROM Customers;
/*
'584'
'517'
'449'
'412'
'343'
*/

-- 15. Show all orders placed in the month of December (any year).
SELECT OrderID 
FROM Orders 
WHERE MONTH(OrderDate) = 12;
/*
'Empty set'
*/

-- 16. Find the total number of books available in the store.
SELECT COUNT(BookID) AS TotalBooks 
FROM Books;
/*
'5'
*/

-- 17. Find the average price of books.
SELECT AVG(Price) AS AveragePrice 
FROM Books;
/*
'480.0000'
*/

-- 18. Find the maximum and minimum book price.
SELECT MAX(Price) FROM Books
UNION
SELECT MIN(Price) FROM Books;
/*
'600'
'320'
*/

-- 19. Count how many customers joined after 2023.
SELECT COUNT(CustID) AS CustomersJoinedAfter2023 
FROM Customers 
WHERE YEAR(JoinDate) > 2023;
/*
'5'
*/

-- 20. Find the total number of books ordered (all orders combined).
SELECT SUM(Quantity) AS TotalItemsOrdered 
FROM Orders;
/*
'8'
*/

