/*
Created		    8/6/2017
Modified		8/6/2017
Project		
Model			
Company		
Author		
Version		
Database		MS SQL 2005 
*/

-- Faizan Sheikh
-- Major Project database script

Use master
go

Create Database MajorProject
go

Use MajorProject
go

Create table [employer]
(
	[job_id] Char(3) NOT NULL,
	[job_name] Varchar(40) NOT NULL,
	[job_title] Varchar(40) NOT NULL,
Primary Key ([job_id])
) 
go

Create table [student]
(
	[stu_num] Char(3) NOT NULL,
	[stu_first_name] Varchar(30) NOT NULL,
	[stu_last_name] Varchar(35) NOT NULL,
	[stu_phone_num] Char(10) NULL,
	[stu_email] Varchar(50) NULL,
	[stu_graduated] Varchar(10) NULL,
	[stu_hire_date] Datetime NULL,
	[job_id] Char(3) NULL,
Primary Key ([stu_num])
) 
go

Create table [course]
(
	[course_id] Char(3) NOT NULL,
	[course_name] Varchar(40) NOT NULL,
	[course_description] Varchar(100) NOT NULL,
Primary Key ([course_id])
) 
go

Create table [enrolment]
(
	[stu_num] Char(3) NOT NULL,
	[course_id] Char(3) NOT NULL,
	[enrolment_date] Datetime NOT NULL,
Primary Key ([stu_num],[course_id])
) 
go

Create table [enquiries]
(
	[enquiry_id] Char(3) NOT NULL,
	[enquiry_subject] Varchar(50) NULL,
	[enquiry_outcome] Varchar(30) NULL,
	[enquiry_comment] Text NULL,
	[enquiry_date] Datetime NULL,
	[stu_num] Char(3) NOT NULL,
	[course_id] Char(3) NOT NULL,
Primary Key ([enquiry_id])
) 
go

Create table [information_session]
(
	[info_session_id] Char(3) NOT NULL,
	[info_session_date] Datetime NOT NULL,
	[course_id] Char(3) NOT NULL,
Primary Key ([info_session_id])
) 
go

Create table [attendance]
(
	[attendance_id] Char(3) NOT NULL,
	[attend_or_not] Varchar(30) NULL,
	[stu_num] Char(3) NOT NULL,
	[info_session_id] Char(3) NOT NULL,
Primary Key ([attendance_id])
) 
go

Create table [qualifications]
(
	[qual_id] Char(3) NOT NULL,
	[stu_num] Char(3) NOT NULL,
	[qual_description] Varchar(45) NULL,
Primary Key ([qual_id],[stu_num])
) 
go


Alter table [student] add  foreign key([job_id]) references [employer] ([job_id])  on update no action on delete no action 
go
Alter table [enrolment] add  foreign key([stu_num]) references [student] ([stu_num])  on update no action on delete no action 
go
Alter table [enquiries] add  foreign key([stu_num]) references [student] ([stu_num])  on update no action on delete no action 
go
Alter table [attendance] add  foreign key([stu_num]) references [student] ([stu_num])  on update no action on delete no action 
go
Alter table [qualifications] add  foreign key([stu_num]) references [student] ([stu_num])  on update no action on delete no action 
go
Alter table [enrolment] add  foreign key([course_id]) references [course] ([course_id])  on update no action on delete no action 
go
Alter table [enquiries] add  foreign key([course_id]) references [course] ([course_id])  on update no action on delete no action 
go
Alter table [information_session] add  foreign key([course_id]) references [course] ([course_id])  on update no action on delete no action 
go
Alter table [attendance] add  foreign key([info_session_id]) references [information_session] ([info_session_id])  on update no action on delete no action 
go

