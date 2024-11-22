-- Question 1: How much money has the restaurant taken? Change the name of the output column to 'Income'.
-- 1
SELECT SUM(bill_total) AS Income
FROM restBill;

-- Question 2: How much money did the restaurant take in February 2016? Change the name of the output column to 'Feb Income'.
-- 2
SELECT SUM(bill_total) AS 'Feb Income'
FROM restBill
WHERE bill_date BETWEEN 160201 AND 160229;

-- Question 3: Calculate the average bill in table 2.
-- 3
SELECT AVG(bill_total) AS Avg_Bill
FROM restBill
WHERE table_no = 2;

-- Question 4: Calculate the minimal, maximal, and average amount of seats of tables in Blue room. Name the corresponding columns as Min, Max, Avg.
-- 4
SELECT MIN(no_of_seats) AS Min, 
       MAX(no_of_seats) AS Max, 
       AVG(no_of_seats) AS Avg
FROM restRest_table
WHERE room_name = 'Blue';

-- Question 5: Count how many distinct tables are served by waiters 004 and 002.
-- 5
SELECT COUNT(DISTINCT table_no) AS Distinct_Tables
FROM restBill
WHERE waiter_no IN (004, 002);
