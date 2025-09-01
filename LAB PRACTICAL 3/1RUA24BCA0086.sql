-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Lab Experiment 02: Program 02 - Implementation of DML Commands in SQL ( INSERT , SELECT, UPDATE and DELETE )
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- STUDENT NAME: Sumukh R
-- USN: 1RUA24BCA0086
-- SECTION: A
-- -----------------------------------------------------------------------------------------------------------------------------------------
SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;

-- Paste the Output below by execution of above command
-- 'root@localhost', 'Sumuks-MacBook.local', '8.4.6', '2025-09-01 11:32:55'
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Scenario: You are managing a database for a library with two tables: Books and Members.
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Task 01: Create Tables [ Check the below mentioned Instructions:
-- Create the Books and Members tables with the specified structure.
-- Books Table and Member Table : 
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task with the Instructed Column in the session 

create database Library_Management;
use Library_Management;

create table Books (
book_ID int primary key,
title varchar(15),
author varchar(10)
);
 alter table Books modify column title varchar(30);
 alter table Books modify column author varchar(30);
 create table Members (
 member_ID int primary key,
 member_name varchar(15),
 phone_number int);
alter table Members modify column member_name varchar(30);
alter table Members rename column phone_number to Date_Joined;
alter table Members modify column Date_Joined varchar(30);
 
 desc Books;
desc Members;


-- Paste the Output below for the given command ( DESC TableName;) 

/* # Field	Type	Null	Key	Default	Extra
book_ID	int	NO	PRI		
title	varchar(15)	YES			
author	varchar(10)	YES	*/		

/*
# Field	Type	Null	Key	Default	Extra
member_ID	int	NO	PRI		
member_name	varchar(15)	YES			
phone_number	int	YES			
*/



-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 02: Insert a New Book
-- Instructions: Insert a book titled "1984_The Black Swan" by George Orwell (published in 1949) with 04 available copies and 10 Total copies. 
-- Populate other fields as needed.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.

insert into Books values
(001, '1984_The Black Swan', 'George Orwell'),
(002, '48_Laws of Power', 'Robert Greene'),
(003, 'Psychology_of Money', 'Morgan'),
(004, 'Soldier_Boy', 'Greek Yogurt'),
(005, 'Vought_International', 'Homelander');

select * from Books;


-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).
/* # book_ID	title	author
1	1984_The Black Swan	George Orwell
2	48_Laws of Power	Robert Greene
3	Psychology_of Money	Morgan
4	Soldier_Boy	Greek Yogurt
5	Vought_International	Homelander
*/

-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 03: Add New Members
-- Instructions: Insert two members: David Lee (Platinum, joined 2024-04-15) and Emma Wilson (Silver, joined 2024-05-22).
-- Populate other fields as needed.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.

insert into Members values
(001, 'Rheehaw', '2020-05-16'),
(002, 'Rishitha B Raju', '2020-05-21'),
(003, 'Lulli Yadav', '2020-05-19'),
(004, 'Maike Jhonson', '2020-06-21'),
(005, 'Stuttgart Bro', '2020-04-23');

select * from Members;

-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).
/*
# member_ID	member_name	Date_Joined
1	Rheehaw	2020-05-16
2	Rishitha B Raju	2020-05-21
3	Lulli Yadav	2020-05-19
4	Maike Jhonson	2020-06-21
5	Stuttgart Bro	2020-04-23
*/

-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 04: Update Book Details 
-- Instructions: The library acquired 2 additional copies of "1984_The Black Swan". Update the Books table.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.

alter table Books add publoc varchar(20);
update Books set publoc = 'Ínternational';

select * from Books;

-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).


/*
# book_ID	title	author	publoc
1	1984_The Black Swan	George Orwell	Ínternational
2	48_Laws of Power	Robert Greene	Ínternational
3	Psychology_of Money	Morgan	Ínternational
4	Soldier_Boy	Greek Yogurt	Ínternational
5	Vought_International	Homelander	Ínternational
*/
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 05: Modify a Member's Information
-- Instructions: Update a member's membership type. Emma Wilson has upgraded her membership from 'Silver' to 'Gold'.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.

alter table members add membership_type varchar(25);
update members set membership_type = 'Gold';
select * from members;


-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).

/*
# member_ID	member_name	Date_Joined	membership_type
1	Rheehaw	2020-05-16	Gold
2	Rishitha B Raju	2020-05-21	Gold
3	Lulli Yadav	2020-05-19	Gold
4	Maike Jhonson	2020-06-21	Gold
5	Stuttgart Bro	2020-04-23	Gold
*/

-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 06: Remove a Member
-- Instructions: Delete David Lee’s record from the Members table.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.

delete from members
where name = 'Rheehaw';

-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).


-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 09: Borrowing Table 
-- Instructions: Create a Borrowing table with foreign keys referencing Books and Members.
-- Subtask 1: Borrow a Book
-- Scenario:Emma Wilson (member_id = 2) borrows the book "The Catcher in the Rye" (book_id = 102) on 2024-06-01. Insert this record into the Borrowing table.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.








-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).


-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 10: Find the name of Borrower who book = 102 [ Advance and Optional ]
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.








-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).


-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Final Task 00: ER Diagram - Instructions:
-- Draw an ER diagram for the library database. Additional Upload the scanned copy of the created ER Daigram in the Google Classroom.



-- END of the Task -- 