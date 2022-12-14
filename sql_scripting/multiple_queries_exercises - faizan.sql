-- Question 1
SELECT ORDER_NUM,ORDER_DATE,CUSTOMER.CUSTOMER_NUM,CUSTOMER_NAME
FROM CUSTOMER JOIN ORDERS
ON CUSTOMER.CUSTOMER_NUM=ORDERS.CUSTOMER_NUM;

-- Question 2
SET DATEFORMAT dmy;
SELECT ORDER_NUM,ORDER_DATE,CUSTOMER.CUSTOMER_NUM,CUSTOMER_NAME
FROM CUSTOMER JOIN ORDERS
ON CUSTOMER.CUSTOMER_NUM=ORDERS.CUSTOMER_NUM
WHERE ORDER_DATE = '20/10/2003';

-- Question 3
SELECT ORDERS.ORDER_NUM,ORDER_DATE,PART_NUM,NUM_ORDERED,QUOTED_PRICE
FROM ORDERS JOIN ORDER_LINE
ON ORDERS.ORDER_NUM = ORDER_LINE.ORDER_NUM;

-- Question 4
SET DATEFORMAT dmy
SELECT CUSTOMER_NUM,CUSTOMER_NAME
FROM CUSTOMER
WHERE CUSTOMER_NUM IN
	(SELECT CUSTOMER_NUM
	FROM ORDERS
	WHERE ORDER_DATE='20/10/2003');   

-- Question 5
SET DATEFORMAT dmy
SELECT CUSTOMER_NUM,CUSTOMER_NAME
	FROM CUSTOMER
	WHERE EXISTS
	(SELECT *
	FROM ORDERS
	WHERE CUSTOMER.CUSTOMER_NUM=ORDERS.CUSTOMER_NUM
	AND ORDER_DATE='20/10/2003');  
	
-- Question 6
SET DATEFORMAT dmy
SELECT CUSTOMER_NUM,CUSTOMER_NAME
FROM CUSTOMER
WHERE CUSTOMER_NUM IN
 	(SELECT CUSTOMER_NUM
	FROM ORDERS
	WHERE ORDER_DATE !='20/10/2003'); 
	
-- Question 7
SELECT ORDERS.ORDER_NUM,ORDER_DATE,PART.PART_NUM,DESCRIPTION,CLASS
FROM ORDERS JOIN ORDER_LINE
ON ORDERS.ORDER_NUM=ORDER_LINE.ORDER_NUM
JOIN PART
ON ORDER_LINE.PART_NUM=PART.PART_NUM; 	

-- Question 8
SELECT ORDERS.ORDER_NUM,ORDER_DATE,PART.PART_NUM,DESCRIPTION,CLASS
FROM ORDERS JOIN ORDER_LINE
ON ORDERS.ORDER_NUM=ORDER_LINE.ORDER_NUM
JOIN PART
ON ORDER_LINE.PART_NUM=PART.PART_NUM
ORDER BY CLASS, ORDERS.ORDER_NUM;	