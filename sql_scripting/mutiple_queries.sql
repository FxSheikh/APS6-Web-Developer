-- Faizan Sheikh

-- Multiple table Queries Exercises

-- Question 1

SELECT ORDER_NUM,ORDER_DATE,CUSTOMER.CUSTOMER_NUM,CUSTOMER_NAME
FROM CUSTOMER JOIN ORDERS
ON CUSTOMER.CUSTOMER_NUM=ORDERS.CUSTOMER_NUM;

-- Question 2

SET DATEFORMAT dmy
SELECT ORDER_NUM,ORDER_DATE,CUSTOMER.CUSTOMER_NUM,CUSTOMER_NAME
FROM CUSTOMER JOIN ORDERS
ON CUSTOMER.CUSTOMER_NUM=ORDERS.CUSTOMER_NUM
WHERE ORDER_DATE = '20/10/2003';

-- Question 3

SELECT ORDERS.ORDER_NUM,ORDER_DATE,PART_NUM,NUM_ORDERED,QUOTED_PRICE
FROM ORDERS JOIN ORDER_LINE
ON ORDERS.ORDER_NUM = ORDER_LINE.ORDER_NUM

 -- Question 4
 
SET DATEFORMAT dmy
SELECT CUSTOMER.CUSTOMER_NUM,CUSTOMER_NAME
FROM CUSTOMER
WHERE CUSTOMER_NUM IN
	(SELECT CUSTOMER_NUM
	FROM ORDERS
	WHERE ORDER_DATE = '20/10/2003'
	);
	
-- Question 5

SET DATEFORMAT dmy
SELECT CUSTOMER.CUSTOMER_NUM,CUSTOMER_NAME
FROM CUSTOMER
WHERE EXISTS
	(SELECT *
	FROM ORDERS
	WHERE CUSTOMER.CUSTOMER_NUM = ORDERS.CUSTOMER_NUM
	AND ORDER_DATE = '20/10/2003');

-- Question 6

SET DATEFORMAT dmy
SELECT CUSTOMER.CUSTOMER_NUM,CUSTOMER_NAME
FROM CUSTOMER JOIN ORDERS
ON CUSTOMER.CUSTOMER_NUM = ORDERS.CUSTOMER_NUM
WHERE ORDER_DATE <> '20/10/2003';

-- Question 7

SELECT ORDERS.ORDER_NUM,ORDER_DATE,PART.PART_NUM,DESCRIPTION,CLASS
FROM ORDERS JOIN ORDER_LINE
ON ORDERS.ORDER_NUM = ORDER_LINE.ORDER_NUM
JOIN PART 
ON 	ORDER_LINE.PART_NUM = PART.PART_NUM

-- Question 8

SELECT ORDERS.ORDER_NUM,ORDER_DATE,PART.PART_NUM,DESCRIPTION,CLASS
FROM ORDERS JOIN ORDER_LINE
ON ORDERS.ORDER_NUM = ORDER_LINE.ORDER_NUM
JOIN PART 
ON 	ORDER_LINE.PART_NUM = PART.PART_NUM
ORDER BY CLASS, ORDERS.ORDER_NUM;

-- Question 9

SELECT REP_NUM, FIRST_NAME,LAST_NAME 
FROM REP
WHERE REP_NUM IN
	(SELECT REP_NUM
	FROM CUSTOMER
	WHERE CREDIT_LIMIT = 10000
	GROUP BY REP_NUM
	HAVING COUNT(CUSTOMER_NUM)>1);
	
-- Question 10

SELECT REP.REP_NUM, FIRST_NAME,LAST_NAME 
FROM REP JOIN CUSTOMER
ON REP.REP_NUM = CUSTOMER.REP_NUM
WHERE CREDIT_LIMIT = 10000
GROUP BY REP.REP_NUM,FIRST_NAME,LAST_NAME
HAVING COUNT(CUSTOMER_NUM)>1;

-- Question 11

SELECT CUSTOMER.CUSTOMER_NUM,CUSTOMER_NAME
FROM CUSTOMER JOIN ORDERS
ON CUSTOMER.CUSTOMER_NUM = ORDERS.CUSTOMER_NUM
JOIN ORDER_LINE
ON ORDERS.ORDER_NUM = ORDER_LINE.ORDER_NUM
JOIN PART
ON ORDER_LINE.PART_NUM = PART.PART_NUM
WHERE DESCRIPTION = 'Iron';

-- Question 12

SELECT F.PART_NUM,F.DESCRIPTION,F.CLASS,S.PART_NUM,S.DESCRIPTION,S.CLASS
FROM PART F JOIN PART S
ON F.CLASS = S.CLASS AND F.WAREHOUSE = S.WAREHOUSE
ORDER BY F.CLASS,F.PART_NUM; 		

-- Question 13

SELECT ORDER_NUM,ORDER_DATE
FROM CUSTOMER JOIN ORDERS
ON CUSTOMER.CUSTOMER_NUM = ORDERS.CUSTOMER_NUM
WHERE CUSTOMER_NAME = 'Ferguson''s';

-- Question 14

SELECT ORDERS.ORDER_NUM,ORDER_DATE
FROM ORDERS JOIN ORDER_LINE
ON ORDERS.ORDER_NUM = ORDER_LINE.ORDER_NUM
JOIN PART
ON ORDER_LINE.PART_NUM = PART.PART_NUM
WHERE DESCRIPTION = 'Gas Range';

-- Question 15

SELECT ORDERS.ORDER_NUM, ORDERS.ORDER_DATE
FROM ORDERS JOIN ORDER_LINE
ON ORDERS.ORDER_NUM = ORDER_LINE.ORDER_NUM
JOIN PART
ON ORDER_LINE.PART_NUM = PART.PART_NUM
WHERE DESCRIPTION = 'Gas Range'
UNION
SELECT ORDERS.ORDER_NUM, ORDERS.ORDER_DATE
FROM ORDERS JOIN CUSTOMER
ON ORDERS.CUSTOMER_NUM = CUSTOMER.CUSTOMER_NUM
WHERE CUSTOMER_NAME = 'Ferguson''s';

-- Question 16

SELECT ORDERS.ORDER_NUM, ORDERS.ORDER_DATE
FROM ORDERS JOIN ORDER_LINE
ON ORDERS.ORDER_NUM = ORDER_LINE.ORDER_NUM
JOIN PART
ON ORDER_LINE.PART_NUM = PART.PART_NUM
WHERE DESCRIPTION = 'Gas Range'
INTERSECT
SELECT ORDERS.ORDER_NUM, ORDERS.ORDER_DATE
FROM ORDERS JOIN CUSTOMER
ON ORDERS.CUSTOMER_NUM = CUSTOMER.CUSTOMER_NUM
WHERE CUSTOMER_NAME = 'Ferguson''s';

-- Question 17
SELECT ORDERS.ORDER_NUM, ORDERS.ORDER_DATE
FROM ORDERS JOIN CUSTOMER
ON ORDERS.CUSTOMER_NUM = CUSTOMER.CUSTOMER_NUM
WHERE CUSTOMER_NAME = 'Ferguson''s'
EXCEPT
SELECT ORDERS.ORDER_NUM, ORDERS.ORDER_DATE
FROM ORDERS JOIN ORDER_LINE
ON ORDERS.ORDER_NUM = ORDER_LINE.ORDER_NUM
JOIN PART
ON ORDER_LINE.PART_NUM = PART.PART_NUM
WHERE DESCRIPTION = 'Gas Range';

-- Question 17 (all gas ranges not ordered by Ferguson)
SELECT ORDERS.ORDER_NUM, ORDERS.ORDER_DATE
FROM ORDERS JOIN ORDER_LINE
ON ORDERS.ORDER_NUM = ORDER_LINE.ORDER_NUM
JOIN PART
ON ORDER_LINE.PART_NUM = PART.PART_NUM
WHERE DESCRIPTION = 'Gas Range'
EXCEPT
SELECT ORDERS.ORDER_NUM, ORDERS.ORDER_DATE
FROM ORDERS JOIN CUSTOMER
ON ORDERS.CUSTOMER_NUM = CUSTOMER.CUSTOMER_NUM
WHERE CUSTOMER_NAME = 'Ferguson''s';


-- Question 18

SELECT PART.PART_NUM,DESCRIPTION 
FROM PART
WHERE PRICE > ANY
	(SELECT PRICE
	FROM PART
	WHERE CLASS='AP'); 

-- Question 19
SELECT PART.PART_NUM,DESCRIPTION 
FROM PART
WHERE PRICE > ALL
	(SELECT PRICE
	FROM PART
	WHERE CLASS='AP'); 	
-- This question answers listing the part number and description
-- for all parts that have a unit price greater than the unit price 
-- of ALL of the parts in item class 'AP'.	

-- Question 20, rewriting question 18
SELECT PART.PART_NUM,DESCRIPTION 
FROM PART
WHERE PRICE > 
	(SELECT MIN(PRICE)
	FROM PART
	WHERE CLASS='AP'); 		
	
-- Question 20, rewriting question 19	
SELECT PART.PART_NUM,DESCRIPTION 
FROM PART
WHERE PRICE > 
	(SELECT MAX(PRICE)
	FROM PART
	WHERE CLASS='AP');
	
-- Question 21
SELECT PART.PART_NUM,DESCRIPTION,ORDER_NUM,ON_HAND,NUM_ORDERED
FROM PART 
LEFT JOIN ORDER_LINE
ON PART.PART_NUM=ORDER_LINE.PART_NUM;
	 