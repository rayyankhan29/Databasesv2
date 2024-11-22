-- Question 1: List the dates and bill totals for customer Bob Crow.
-- 1
SELECT bill_date, bill_total
FROM restBill
WHERE cust_name = 'Bob Crow';

-- Question 2: List the names of all customers whose last name is Smith. List each customer only once in reverse lexicographical order.
-- 2
SELECT DISTINCT cust_name
FROM restBill
WHERE cust_name LIKE '% Smith'
ORDER BY cust_name DESC;

-- Question 3: List the names of all customers whose second names begin with 'C'. List each customer only once.
-- 3
SELECT DISTINCT cust_name
FROM restBill
WHERE cust_name LIKE '% C%';

-- Question 4: List the names of all the headwaiters.
-- 4
SELECT first_name, surname
FROM restStaff
WHERE headwaiter IS NULL;

-- Question 5: List all the details of bills dated February 2016.
-- 5
SELECT *
FROM restBill
WHERE bill_date BETWEEN 160201 AND 160229;

-- Question 6: List the dates the restaurant took money in 2015. List each date only once in sorted order.
-- 6
SELECT DISTINCT bill_date
FROM restBill
WHERE bill_date BETWEEN 150101 AND 151231
ORDER BY bill_date;
