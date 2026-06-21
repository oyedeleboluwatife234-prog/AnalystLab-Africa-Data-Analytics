CREATE DATABASE Chinook;
-- USE chinook;
SHOW TABLES;
SELECT * FROM customer;
SELECT * FROM invoice;
SELECT * FROM track;
-- Customers + Invoices
SELECT c.FirstName,c.LastName,i.Total FROM customer c INNER JOIN invoice i ON c.CustomerId = i.CustomerId;

-- TotalSpending Per Customer
SELECT c.FirstName, c.LastName,SUM(i.Total) AS total_spent FROM customer c
JOIN invoice i ON c.CustomerId = i.CustomerId GROUP BY c.CustomerId
ORDER BY total_spent DESC;


-- Top 5 Customers
SELECT c.FirstName,c.LastName,SUM(i.Total) AS total_spent FROM customer c
JOIN invoice i ON c.CustomerId = i.CustomerId GROUP BY c.CustomerId
ORDER BY total_spent DESC LIMIT 5;

 -- Revenue by Country
SELECT BillingCountry,SUM(Total) AS revenue FROM invoice GROUP BY BillingCountry
ORDER BY revenue DESC;

-- Track + Album + Artist (MULTIPLE JOINS)
SELECT t.Name AS track_name,ar.Name AS artist_name,al.Title AS album_name
FROM track t JOIN album al ON t.AlbumId = al.AlbumId
JOIN artist ar ON al.ArtistId = ar.ArtistId;

-- Most Popular Genres
SELECT g.Name AS genre,COUNT(il.InvoiceLineId) AS purchases FROM invoiceline il
JOIN track t ON il.TrackId = t.TrackId JOIN genre g ON t.GenreId = g.GenreId
GROUP BY g.Name ORDER BY purchases DESC;

-- Window Function
SELECT c.FirstName,SUM(i.Total) AS total_spent,RANK() OVER (ORDER BY SUM(i.Total) DESC) AS rank_position
FROM customer c JOIN invoice i ON c.CustomerId = i.CustomerId GROUP BY c.CustomerId;

-- Subquery Example
SELECT FirstName, LastName FROM customer WHERE CustomerId IN (SELECT CustomerId FROM invoice
    GROUP BY CustomerId HAVING SUM(Total) > 40);
    
    

