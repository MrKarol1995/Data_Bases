--5.1
SELECT OrderID, CONCAT(ROUND(SUM(UnitPrice * Quantity), 2), '$') AS total_value,SUM(Quantity) AS total_products
FROM northwind.`Order Details`
GROUP BY OrderID
ORDER BY SUM(UnitPrice * Quantity) DESC;


--5.2
SELECT CustomerID, count(OrderID)
from northwind.`Orders`
GROUP BY CustomerID
having count(OrderID) > 20;

--5.2bis

SELECT count(*)
from(
    SELECT CustomerID, count(OrderID)
    from northwind.`Orders`
    GROUP BY CustomerID
    having count(OrderID) > 20
) as licz

--5.3

select concat(ROUND((
    SELECT count(*) 
    from northwind.Products
    WHERE Discontinued > 0) * 100.0 / (select count(*) from northwind.Products),0), '%');


--5.4
SELECT country, ROUND(sum(right(CustomerID,1)='A') * 100.0 / count(*), 2) as procent
FROM northwind.Customers
GROUP BY country
ORDER BY procent DESC LIMIT 5;

--5 bis 
--5.2
SELECT CustomerID, COUNT(*) AS liczba_zamowien
FROM Orders
GROUP BY CustomerID
HAVING liczba_zamowien > 20; 

--5.3
SELECT CONCAT(ROUND(SUM(Discontinued = "01") / COUNT(*) * 100, 0), "%")
FROM Products;

--5.4
SELECT Country, SUM(RIGHT(LEFT(ContactName, LOCATE(' ', ContactName) - 1), 1) = 'a') / COUNT(*) AS odsetek
FROM Customers
GROUP BY Country
ORDER BY odsetek DESC, Country
LIMIT 5;
