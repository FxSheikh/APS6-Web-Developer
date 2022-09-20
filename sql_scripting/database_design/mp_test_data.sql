Use master
go

-- MajorProject is the name of the database
Use MajorProject
go

-- Setting the date format to simplify inputting date values 
Set dateformat dmy;

-- Inserting employers test data
Insert into employer values ('101','KPMG','Junior Programmer');
Insert into employer values ('102','Deloitte','Database Administrator');
Insert into employer values ('103','Michael Page','Frontstack Web Developer');
Insert into employer values ('104','DVA','Backend Web Developer'); 

-- Inserting student test data
Insert into student values ('001','Faizan','Sheikh','0298765432','fs@mail.com','graduated','9/6/2017','104');
Insert into student values ('002','John','Wick','0298764692','jw@mail.com','graduated','19/5/2017','103');
Insert into student values ('003','Amy','Adams','0298761357','aa@mail.com','graduated','4/2/2017','102');
Insert into student values ('004','Roger','Federer','0298766789','rf@mail.com','graduated','13/4/2017','101');

-- Inserting course test data
Insert into course values ('DPW','Diploma of Web Development','This qualification provides the skills for an individal to be competent in web development');
Insert into course values ('DPS','Diploma of Software Development','This qualification provides the skills for an individual to be competent in software development');
Insert into course values ('DPN','Diploma of Networking','This qualification provides the skills for an individual to be competent in networking');

-- Insering enrolment test data
Insert into enrolment values ('001','DPW','1/7/2017');
Insert into enrolment values ('002','DPS','1/7/2017');
Insert into enrolment values ('003','DPN','1/7/2017');

-- Inserting enquiries test data
Insert into enquiries values ('E01','course offering','resolved','The student wanted to know when the diploma of web development would be starting','7/6/2017','001','DPW');
Insert into enquiries values ('E02','course units','resolved','The student was enquriing about which units would be taught in the diploma of software development','8/6/2017','002','DPS');
Insert into enquiries values ('E03','course end date','resolved','The student wanted to know the course end date for the diploma of networking','9/6/2017','003','DPN');

-- Inserting information session test data
Insert into information_session values ('I01','25/6/2017 14:00','DPW');
Insert into information_session values ('I02','26/6/2017 13:30','DPS');
Insert into information_session values ('I03','27/6/2017 15:00','DPN');

-- Inserting attendance test data
Insert into attendance values ('A01','student did attend','001','I01');
Insert into attendance values ('A02','student did attend','002','I02');
Insert into attendance values ('A03','student did attend','003','I03');

-- Inserting qualifications test data
Insert into qualifications values ('Q01','001','Certificate IV Web');
Insert into qualifications values ('Q02','002','Certificate IV Programming');
Insert into qualifications values ('Q03','003','Certificate IV Gaming');
Insert into qualifications values ('Q04','004','Certificate IV Networking');

-- Testing data using select queries
select * from employer;
select * from student;
select * from course;
select * from enrolment;
select * from enquiries;
select * from information_session; 
select * from attendance;
select * from qualifications;