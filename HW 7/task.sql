-- Question 1: Create a view with the name samsBills to allow the waiter Sam Pitt to see the bills he has taken.
-- It should have columns in that order: first_name, surname, bill_date, cust_name, and bill_total.
-- 1
CREATE VIEW samsBills AS
SELECT restStaff.first_name, restStaff.surname, restBill.bill_date, restBill.cust_name, restBill.bill_total
FROM restBill
JOIN restStaff ON restBill.waiter_no = restStaff.staff_no
WHERE restStaff.first_name = 'Sam' AND restStaff.surname = 'Pitt';

-- Question 2: Write a query using the samsBills view so Sam can see only bills over £400.
-- 2
SELECT *
FROM samsBills
WHERE bill_total > 400;

-- Question 3: Create a view with the name roomTotals to allow management to see how much each room has taken.
-- The columns should be named: room_name and total_sum.
-- 3
CREATE VIEW roomTotals AS
SELECT restRest_table.room_name, SUM(restBill.bill_total) AS total_sum
FROM restBill
JOIN restRest_table ON restBill.table_no = restRest_table.table_no
GROUP BY restRest_table.room_name;

-- Question 4: Create a view with the name teamTotals to allow management to see how much each team has taken.
-- Concatenate the first name and surname of the waiter with a space in between. 
-- The columns should be named: headwaiter_name and total_sum.
-- 4
CREATE VIEW teamTotals AS
SELECT CONCAT(headwaiter.first_name, ' ', headwaiter.surname) AS headwaiter_name,
       SUM(restBill.bill_total) AS total_sum
FROM restStaff AS waiter
JOIN restStaff AS headwaiter ON waiter.headwaiter = headwaiter.staff_no
JOIN restBill ON waiter.staff_no = restBill.waiter_no
GROUP BY headwaiter.first_name, headwaiter.surname;
