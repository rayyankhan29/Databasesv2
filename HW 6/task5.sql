-- Question 1: Which waiters have taken 2 or more bills on a single date? 
-- List the waiter names and surnames, the dates and the number of bills they have taken.
-- 1
SELECT restStaff.first_name, restStaff.surname, restBill.bill_date, COUNT(*) AS bill_count
FROM restBill
JOIN restStaff ON restBill.waiter_no = restStaff.staff_no
GROUP BY restStaff.first_name, restStaff.surname, restBill.bill_date
HAVING COUNT(*) >= 2;

-- Question 2: List the rooms with tables that can serve more than 6 people and how many of such tables they have.
-- 2
SELECT room_name, COUNT(*) AS table_count
FROM restRest_table
WHERE no_of_seats > 6
GROUP BY room_name;

-- Question 3: List the names of the rooms and the total amount of bills in each room.
-- 3
SELECT restRest_table.room_name, COUNT(restBill.bill_no) AS total_bills
FROM restRest_table
JOIN restBill ON restRest_table.table_no = restBill.table_no
GROUP BY restRest_table.room_name;

-- Question 4: List the headwaiter’s name and surname and the total bill amount their waiters have taken. 
-- Order the list by total bill amount, largest first.
-- 4
SELECT headwaiter.first_name, headwaiter.surname, SUM(restBill.bill_total) AS total_bill_amount
FROM restStaff AS headwaiter
JOIN restStaff AS waiter ON headwaiter.staff_no = waiter.headwaiter
JOIN restBill ON waiter.staff_no = restBill.waiter_no
GROUP BY headwaiter.first_name, headwaiter.surname
ORDER BY total_bill_amount DESC;

-- Question 5: List any customers who have spent more than £400 on average.
-- 5
SELECT cust_name, AVG(bill_total) AS average_spent
FROM restBill
GROUP BY cust_name
HAVING AVG(bill_total) > 400;

-- Question 6: Which waiters have taken 3 or more bills on a single date? 
-- List the waiter names, surnames, and the number of bills they have taken.
-- 6
SELECT restStaff.first_name, restStaff.surname, COUNT(*) AS bill_count
FROM restBill
JOIN restStaff ON restBill.waiter_no = restStaff.staff_no
GROUP BY restStaff.first_name, restStaff.surname, restBill.bill_date
HAVING COUNT(*) >= 3;
