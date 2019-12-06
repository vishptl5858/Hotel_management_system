
/* Query 1 How many customers does the store have? */

SELECT COUNT(customerid) FROM customer;

/* Query 2 The top sold products and least sold products over time. */

select albumname, orders.productid, count(orders.productid) totalcount from products 
Join orders on products.productid = orders.productid
group by orders.productid having count(orders.productid) > 1 order by totalcount desc limit 1;

select albumname, orders.productid, count(orders.productid) totalcount from products 
Join orders on products.productid = orders.productid
group by orders.productid having count(orders.productid) > 0 order by totalcount asc limit 1;

/* Query 3 The average price of products in the same category (for example, rock, pop, country, hip-hop). */

SELECT AVG(price) AS Category FROM  products
GROUP BY genres;

/* Query 4 List clients by city and then sort them.*/

SELECT firstname,lastname,city FROM customer
GROUP BY  city asc;

/* QUERY 5 Clients that bought more than 2 products in the last month. */

SELECT c.firstname,c.lastname,p.albumname from customer c JOIN products p  ON c.orderid = p.orderid 
JOIN orders o on p.orderid = o.orderid
WHERE (shipdate BETWEEN  '2019-03-01' AND '2019-04-30');

/* QUERY 6 List how many distinct albums each singer has. */
DROP PROCEDURE IF EXISTS getSinger;
DELIMITER //
CREATE PROCEDURE getSinger(IN productid int)
 BEGIN
 SELECT COUNT(productid),albumname,artist
 FROM products;
 END //
DELIMITER ;

CALL getSinger(2);

/* QUERY 7 List how many copies of an album are available of a particular singer. */

DROP PROCEDURE IF EXISTS getalbumcopy;
DELIMITER //
CREATE PROCEDURE getalbumcopy(IN ProductId int)
 BEGIN
 SELECT productid,albumname,artist,title
 FROM products p join album a
 on p.albumid = a.albumid
 WHERE a.albumid = ProductId;
 END //
DELIMITER ;

CALL getalbumcopy(1);
