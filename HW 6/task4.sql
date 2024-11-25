-- Question 1: List the names of customers who spent more than 450.00 on a single bill on occasions when 'Charles' was their Headwaiter.
-- 1
SELECT DISTINCT restBill.cust_name
FROM restBill
JOIN restRoom_management ON restBill.table_no IN (
    SELECT table_no
    FROM restRest_table
    WHERE room_name = restRoom_management.room_name
)
JOIN restStaff ON restRoom_management.headwaiter = restStaff.staff_no
WHERE restStaff.first_name = 'Charles'
  AND restBill.bill_total > 450.00;

-- Question 2: A customer called Nerida has complained that a waiter was rude to her when she dined at the restaurant on the 11th January 2016. What is the name and surname of the Headwaiter who will have to deal with the matter?
-- 2
SELECT restStaff.first_name, restStaff.surname
FROM restStaff
WHERE restStaff.staff_no = (
    SELECT headwaiter
    FROM restRoom_management
    WHERE room_name = (
        SELECT room_name
        FROM restRest_table
        WHERE table_no = (
            SELECT table_no
            FROM restBill
            WHERE cust_name = 'Nerida Smith' AND bill_date = 160111
        )
    )
    AND room_date = 160111
);

-- Question 3: What are the names of customers with the smallest bill?
-- 3
SELECT cust_name
FROM restBill
WHERE bill_total = (
    SELECT MIN(bill_total)
    FROM restBill
);

-- Question 4: List the names of any waiters who have not taken any bills.
-- 4
SELECT first_name, surname
FROM restStaff
WHERE staff_no NOT IN (
    SELECT DISTINCT waiter_no
    FROM restBill
);

-- Question 5: Which customers had the largest single bill? List the customer name, the name and surname of headwaiters, and the room name where they were served on that occasion.
-- 5
SELECT restBill.cust_name, restStaff.first_name AS headwaiter_first_name, restStaff.surname AS headwaiter_surname, restRoom_management.room_name
FROM restBill
JOIN restRest_table ON restBill.table_no = restRest_table.table_no
JOIN restRoom_management ON restRest_table.room_name = restRoom_management.room_name
AND restRoom_management.room_date = restBill.bill_date
JOIN restStaff ON restRoom_management.headwaiter = restStaff.staff_no
WHERE restBill.bill_total = (
    SELECT MAX(bill_total)
    FROM restBill
);
