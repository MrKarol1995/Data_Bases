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
SELECT city_id, 
       GROUP_CONCAT(DISTINCT district ORDER BY district SEPARATOR ' oraz ') AS dystrykty
FROM address
GROUP BY city_id
HAVING COUNT(DISTINCT district) > 1
ORDER BY city_id DESC;

--4.5
SELECT amount AS kwota_wypozyczenia, 
       staff_id AS pracownik, 
       SUM(amount) AS zarobek
FROM payment
GROUP BY amount, staff_id
ORDER BY zarobek DESC;

--4.6
SELECT MIN(IF(return_date IS NULL, 0, TIMESTAMPDIFF(SECOND, rental_date, return_date))) AS najkrotsze, 
MAX(IF(return_date IS NULL,TIMESTAMPDIFF(SECOND, rental_date, '2005-09-02 02:35:22') , TIMESTAMPDIFF(SECOND, rental_date, return_date))) AS najdluzsze
FROM rental
WHERE return_date IS NOT NULL;

--4.7
SELECT customer_id, 
AVG(IF(return_date IS NULL,TIMESTAMPDIFF(SECOND, rental_date, '2005-09-02 02:35:22') , TIMESTAMPDIFF(SECOND, rental_date, return_date))) / 86400 AS sredni_czas_dni
FROM rental
GROUP BY customer_id
ORDER BY sredni_czas DESC
LIMIT 1;

--4.8
SELECT customer_id, 
SUM(IF(return_date IS NULL,TIMESTAMPDIFF(SECOND, rental_date, '2005-09-02 02:35:22') , TIMESTAMPDIFF(SECOND, rental_date, return_date)) / 2629800) AS w_sumie_miesiecy
FROM rental
GROUP BY customer_id
ORDER BY w_sumie DESC
LIMIT 1;
