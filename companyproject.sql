/*CREATE DATABASE*/
create database project;

/*USE DATABASE*/
use project;

/*CREATE WORKER TABLE*/
create table worker(
first_name varchar(25),
last_name varchar(25),
worker_id varchar(10),
salary bigint,
joining_date date,
department varchar(25),
primary key(worker_id)
);

/*CREATE TABLE TITLE*/
create table title(
worker_title varchar(25),
worker_ref_id varchar(10),
affected_from datetime,
foreign key (worker_ref_id) references worker(worker_id)
);

/*CREATE TABLE BONUS*/
create table bonus(
bonus_amount int(5),
worker_ref_id varchar(10),
bonus_date datetime,
foreign key (worker_ref_id) references worker(worker_id)
);


/*INSERT IN WORKER TAABLE*/
inSERT into worker values("hasham","uddin","1",35000,"2021-06-23","DATA CENTER");
inSERT into worker values("hammad","khan","2",45000,"2020-06-23","SALES CENTER");
inSERT into worker values("hashir","ahmed","3",15000,"2021-07-23","DATA CENTER");
inSERT into worker values("usama","khan","4",35000,"2020-12-23","APP CENTER");
inSERT into worker values("iqbal","uddin","5",25000,"2021-04-23","APP CENTER");
inSERT into worker values("uzair","ali","6",30000,"2021-01-23","SALES CENTER");
inSERT into worker values("uzair","khan","7",31000,"2018-01-23","SALES CENTER");

/*INSERT IN TITLE TABLE*/
insert into title values("managar","1","2021-07-20");
insert into title values("ceo","2","2021-04-20");
insert into title values("intern","3","2021-08-20");
insert into title values("managar","4","2021-06-20");
insert into title values("permament employee","5","2021-07-20");
insert into title values("ceo","6","2021-07-25");

/*INSERT IN BONUS TABLE*/
insert into bonus values(10000,"1","2021-07-20");
insert into bonus values(5000,"2","2021-04-20");
insert into bonus values(4500,"3","2021-08-20");
insert into bonus values(3500,"4","2021-06-20");
insert into bonus values(8000,"5","2021-07-20");
insert into bonus values(2500,"6","2021-07-25");

/*Write an SQL query to fetch the no. of workers for each department
in the descending order.*/
select department,count(worker_id) as total_worker from worker group by department order by total_worker desc;

/*Write an SQL query to print details of the Workers who are also
Managers.*/
select * from worker 
inner join title
on worker.worker_id=title.worker_ref_id and title.worker_title="managar";

/*Write an SQL query to show only odd rows from a table.*/
SELECT *  FROM worker where mod(worker_id,2)!=0;

/*Write an SQL query to clone a new table from another table.*/
CREATE TABLE clone_worker select * from worker;
select * from clone_worker;

/*Write an SQL query to show the current date and time.*/
select current_date(),current_time();

/*Write an SQL query to fetch the first 50% records from a table.*/
select *
from   worker
where  worker_id <= (select count(*)/2 from worker);

/*Write an SQL query to fetch the departments that have less than
five people in it.*/
select department,count(worker_id) from worker group by department having count(worker_id)<5; 

/*Write an SQL query to show all departments along with the number
of people in there.*/
select department,count(worker_id) from worker group by department;

/*Write an SQL query to show the last record from a table.*/
select * from worker order by worker_id desc limit 1;

/*Write an SQL query to fetch the first row of a table.*/
select * from worker limit 1;

/*Write an SQL query to fetch departments along with the total
salaries paid for each of them.*/
select sum(salary),department from worker group by department;

/*Write an SQL query to fetch the names of workers who earn the
highest salary.*/
select max(salary),department from worker group by department;
















