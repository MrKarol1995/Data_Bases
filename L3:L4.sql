-- dodatkowe
SELECT film_id
FROM film
WHERE (description LIKE '% BORING %' 
       OR description LIKE 'BORING %' 
       OR description LIKE '% BORING' 
       OR description = 'BORING')

SELECT  concat( LEFT(first_name,1), '. ', right(first_name,1), '.') FROM customer
ORDER BY customer_id DESC LIMIT 5;

SELECT min(length(phone)), max(length(phone)) FROM address
WHERE (phone is NOT null and LENGTH(phone)>0);

SELECT district, AVG(length(phone)) FROM address
GROUP BY district
ORDER BY AVG(length(phone)) DESC

--Zad 4.1

SELECT group_concat(last_name order BY last_name asc separator  ", ")as dwuliterowi_aktorzy FROM actor;

--Zad 4.2

SELECT title, right(description, length(description)-2)
FROM film
WHERE description not RLIKE '\\bBORING\\b'
ORDER BY right(description, length(description)-2);

--4.3
SELECT customer_id, IF((rental_date BETWEEN '2005-07-01' AND '2005-08-31') AND (return_date>'2005-08-31'), 
CONCAT(COUNT(customer_id) * 0.5,'$') '0$') AS doplata FROM rental
GROUP BY customer_id;

SELECT 
    customer_id, 
    CONCAT(COUNT(*) * 0.5, '$') AS doplata 
    FROM rental
    WHERE (rental_date BETWEEN '2005-07-01' AND '2005-08-31 23:59:59') 
    AND (return_date > '2005-08-31 23:59:59')
GROUP BY customer_id
ORDER BY doplata DESC;

--4.4

