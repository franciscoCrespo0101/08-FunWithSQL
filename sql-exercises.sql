-- 1.Write a query to return all category names with their descriptions from the Categories table.

SELECT CategoryName, Description
FROM dbo.Categories

-- 2.Write a query to return the contact name, customer id, company name and city name of all Customers in London
SELECT  ContactName, CustomerID, CompanyName, City
FROM dbo.Customers
WHERE City = 'London';

-- 3. Write a query to return all available columns in the Suppliers tables for the marketing managers and sales representatives that have a FAX number
SELECT * 
FROM dbo.Suppliers
WHERE Fax != 'null'
AND (ContactTitle = 'Marketing Manager' OR ContactTitle = 'Sales Representative');


-- 4. Write a query to return a list of customer id's from the Orders table with required dates between Jan 1, 1997 and Dec 31, 1997 and with freight under 100 units.
SELECT CustomerID
FROM Orders
WHERE RequiredDate BETWEEN '1997-01-01' AND '1997-12-31'; 

-- 5. Write a query to return a list of company names and contact names of all customers from Mexico, Sweden and Germany.
SELECT CompanyName, ContactName
FROM Customers
WHERE (Country = 'Mexico' OR Country = 'Sweden' OR Country = 'Germany');


-- 6. Write a query to return a count of the number of discontinued products in the Products table.

SELECT COUNT(Discontinued)
FROM Products
WHERE Discontinued = '0';



-- 7. Write a query to return a list of category names and descriptions of all categories beginning with 'Co' from the Categories table.

SELECT CategoryName, Description
FROM Categories
WHERE CategoryName LIKE 'Co%';


-- 8. Write a query to return all the company names, city, country and postal code from the Suppliers table with the word 'rue' in their address. The list should ordered alphabetically by company name.

SELECT CompanyName, City, Country, PostalCode
FROM Suppliers
WHERE Address LIKE '%rue%' ORDER BY CompanyName;


-- 9. Write a query to return the product id and the quantity ordered for each product labelled as 'Quantity Purchased' in the Order Details table ordered by the Quantity Purchased in descending order.

SELECT ProductID, Quantity AS 'Quantity Purchased'
FROM [Order Details]
ORDER BY Quantity DESC;

-- 10. Write a query to return the company name, address, city, postal code and country of all customers with orders that shipped using Speedy Express, along with the date that the order was made.

SELECT CompanyName, Address, City, PostalCode, Country, OrderDate
FROM Orders
INNER JOIN Customers
ON Customers.CustomerID = Orders.CustomerID
WHERE Orders.ShipVia = 1;


-- 11.Write a query to return a list of Suppliers containing company name, contact name, contact title and region description.

SELECT Suppliers.CompanyName, Suppliers.ContactName, Suppliers.ContactTitle, Suppliers.Region
FROM Suppliers


-- 12. Write a query to return all product names from the Products table that are condiments.

SELECT Products.ProductName
FROM Products
WHERE CategoryID = '2';


-- 13. Write a query to return a list of customer names who have no orders in the Orders table.

SELECT ContactName
FROM Customers
WHERE Customers.CustomerID
NOT IN (select CustomerID from Orders)


-- 14. Write a query to add a shipper named 'Amazon' to the Shippers table using SQL.



SELECT *
FROM Shippers
INSERT INTO Shippers (CompanyName)
VALUES ('Amazon')



-- 15.Write a query to change the company name from 'Amazon' to 'Amazon Prime Shipping' in the Shippers table using SQL.



SELECT *
FROM Shippers
UPDATE Shippers
Set CompanyName = 'Amazon Prime Shipping'
WHERE CompanyName = 'Amazon';




-- 16. Write a query to return a complete list of company names from the Shippers table. Include freight totals rounded to the nearest whole number for each shipper from the Orders table for those shippers with orders.

SELECT Orders.ShipName, CONVERT(int,ROUND(SUM(Orders.Freight),0)) AS 'Freight Total'
FROM ORDERS
LEFT JOIN Shippers
ON Shippers.ShipperID = Orders.ShipVia
GROUP BY Orders.ShipName;




-- 17. Write a query to return all employee first and last names from the Employees table by combining the 2 columns aliased as 'DisplayName'. The combined format should be 'LastName, FirstName'.


SELECT LastName +', '+ FirstName AS DisplayName
FROM Employees

-- 18. Write a query to add yourself to the Customers table with an order for 'Grandma's Boysenberry Spread'.

SELECT *
FROM Customers,Orders,[Order Details]
INSERT INTO Customers(CustomerID,CompanyName,ContactName,ContactTitle)
VALUES ('FRCRE','Crespo Distribution','Francisco Crespo','Boss Man')
INSERT INTO Orders(OrderID,CustomerID)
VALUES ('10247','FRCRE')
INSERT INTO [Order Details](OrderID,ProductID,UnitPrice,Quantity,Discount)
VALUES ('10247','6','20.00','10','10')



-- 19. Write a query to remove yourself and your order from the database.

DELETE FROM Orders
WHERE OrderID ='10247'
DELETE FROM [Order Details]
WHERE OrderID ='10247'
DELETE FROM Customers
WHERE CustomerID = 'FRCRE'





-- 20. Write a query to return a list of products from the Products table along with the total units in stock for each product. Include only products with TotalUnits greater than 100.




SELECT ProductName, UnitsInStock
FROM Products
WHERE UnitsInStock > 100