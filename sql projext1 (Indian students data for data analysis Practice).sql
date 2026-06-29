CREATE TABLE Indian_Students
(
    srno INT,
    order_id VARCHAR(30),
    student_name VARCHAR(100),
    payment_date VARCHAR(20),
    course_name VARCHAR(100),
    price INT,
    payment_status VARCHAR(20),
    payment_id VARCHAR(30),
    email VARCHAR(150),
    state VARCHAR(100)
);

/*
copied the csv file into my file and copied all the rows using bulk 
*/

BULK INSERT Indian_Students
FROM 'C:\SQLData\Indian_Students_Data.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
);
/*Question 1 – DDL + Constraints
Create a new table named Indian_Students_New with the following requirements:
srno should be the PRIMARY KEY.
order_id should be UNIQUE.
student_name, course_name, and email should NOT NULL.
price should be of type DECIMAL(10,2).
payment_status should allow only 'Paid' or 'Pending'*/


CREATE TABLE Indian_Students_new(
    srno INT PRIMARY KEY ,
    order_id VARCHAR(30) UNIQUE,
    student_name VARCHAR(100) NOT NULL,
    payment_date VARCHAR(20),
    course_name VARCHAR(100) NOT NULL,
    price DECIMAL (10,2),s
    payment_status VARCHAR(20) CHECK (payment_status IN ('paid' , 'pending')),
    payment_id VARCHAR(30),
    email VARCHAR(150) NOT NULL,
    state VARCHAR(100)
);

/*Question 2 – DML
Using the existing table:
Insert three new student records.
Update the payment status to 'Paid' for all students whose payment status is 'Pending'.
Delete all records where the email is NULL.*/

INSERT INTO Indian_Students_New
(srno, order_id, student_name, payment_date, course_name, price, payment_status, payment_id, email, state)
VALUES
(19956, 'ORD19956', 'Rahul Sharma', '2026-06-28', 'SQL Basics', 4999.00, 'Paid', 'PAY19956', 'rahul.sharma@email.com', 'Maharashtra');

INSERT INTO Indian_Students_New
(srno, order_id, student_name, payment_date, course_name, price, payment_status, payment_id, email, state)
VALUES
(19957, 'ORD19957', 'Priya Patel', '2026-06-28', 'Python Programming', 5999.00, 'Pending', 'PAY19957', 'priya.patel@email.com', 'Gujarat');

INSERT INTO Indian_Students_New
(srno, order_id, student_name, payment_date, course_name, price, payment_status, payment_id, email, state)
VALUES
(19958, 'ORD19958', 'Arjun Reddy', '2026-06-28', 'Data Science', 7999.00, 'Paid', 'PAY19958', 'arjun.reddy@email.com', 'Telangana');


UPDATE Indian_Students_New
SET payment_status = 'Paid'
WHERE payment_status = 'Pending';

DELETE Indian_Students_new
where email is null;

/*Question 3 – Filtering + Sorting
Write a query to display:
Student Name
Course Name
Price
State
Only for students:
whose price is between 20,000 and 40,000
whose payment status is 'Paid'
and who belong to either Andhra Pradesh, Telangana, or Karnataka.*/
SELECT
student_name,
course_name,
price,
state
FROM Indian_Students_new
WHERE price BETWEEN 20000 AND 40000
AND 
payment_status = 'paid'
AND
