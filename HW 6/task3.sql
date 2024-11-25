-- Question 1: List the names of the waiters who have served the customer Tanya Singh.
-- 1
SELECT DISTINCT restStaff.first_name, restStaff.surname
FROM restStaff
JOIN restBill ON restStaff.staff_no = restBill.waiter_no
WHERE restBill.cust_name = 'Tanya Singh';

-- Question 2: On which dates in February 2016 did the Headwaiter 'Charles' manage the 'Green' room? The output date should be in the format they are stored.
-- 2
SELECT room_date
FROM restRoom_management
JOIN restStaff ON restRoom_management.headwaiter = restStaff.staff_no
WHERE restStaff.first_name = 'Charles' 
  AND restRoom_management.room_name = 'Green'
  AND room_date BETWEEN 160201 AND 160229;

-- Question 3: List the names and surnames of the waiters with the same headwaiter as the waiter Zoe Ball.
-- 3
SELECT first_name, surname
FROM restStaff
WHERE headwaiter = (
    SELECT headwaiter
    FROM restStaff
    WHERE first_name = 'Zoe' AND surname = 'Ball'
);

-- Question 4: List the customer name, the amount they spent, and the waiter’s name for all bills. Order the list by the amount spent, highest bill first.
-- 4
SELECT restBill.cust_name, restBill.bill_total, restStaff.first_name, restStaff.surname
FROM restBill
JOIN restStaff ON restBill.waiter_no = restStaff.staff_no
ORDER BY restBill.bill_total DESC;

-- Question 5: List the names and surnames of the waiters who serve tables that worked in the same team that served bills 00014 and 00017.
-- 5
SELECT DISTINCT restStaff.first_name, restStaff.surname
FROM restStaff
JOIN restBill ON restStaff.staff_no = restBill.waiter_no
WHERE restStaff.headwaiter IN (
    SELECT DISTINCT headwaiter
    FROM restStaff
    WHERE staff_no IN (
        SELECT waiter_no
        FROM restBill
        WHERE bill_no IN (00014, 00017)
    )
);

-- Question 6: List the names and surnames of the waiters in the team (including the headwaiter) that served Blue room on 160312.
-- 6
SELECT first_name, surname
FROM restStaff
WHERE staff_no IN (
    SELECT headwaiter
    FROM restRoom_management
    WHERE room_name = 'Blue' AND room_date = 160312
)
OR headwaiter = (
    SELECT headwaiter
    FROM restRoom_management
    WHERE room_name = 'Blue' AND room_date = 160312
);
