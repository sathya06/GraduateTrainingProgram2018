 ProblemSet<00>, July 25 2018
Submission by sathya.a.loganathan
Problem (1):Select the Employee with the top three salaries
Query:select name,salary from Employee order by salary desc LIMIT 3 ;
output:
+---------------+--------+
| name          | salary |
+---------------+--------+
| Tara Cummings |  99475 |
| Paul vincet   |  94791 |
| Adam Wayne    |  94324 |
+---------------+--------+
3 rows in set (0.00 sec)

Problem (2):Select the Employee with the least salary
Query:select name,salary from Employee order by salary  LIMIT 1 ;
output:
+-------------+--------+
| name        | salary |
+-------------+--------+
| John Hellen |  15380 |
+-------------+--------+
1 row in set (0.00 sec)

Problem (3)Select the Employee who does not have a manager in the department table
Query:select E_ID,Manager_ID from employee where Manager_ID  not in (select e.E_ID from employee e inner join Departments d on e.name=d.dep_Manager);
output:
+------+------------+
| E_ID | Manager_ID |
+------+------------+
| A120 | A298       |
| A165 | A298       |
| A178 | A298       |
| A187 | A298       |
+------+------------+
4 rows in set (0.00 sec)

Problem(4):Select the Employee who is also a Manager
Query: select a.name,a.E_ID ,a.Manager_ID,b.name from Employee a,Employee b where a.Manager_ID=b.E_ID;
output:
+-----------------+------+------------+-----------------+
| name            | E_ID | Manager_ID | name            |
+-----------------+------+------------+-----------------+
| John Hellen     | A111 | A120       | Tim Archer      |
| Martin Tredeau  | A114 | A120       | Tim Archer      |
| Robin Wayne     | A116 | A187       | Adam Justin     |
| Stuart Willam   | A121 | A187       | Adam Justin     |
| Adam Wayne      | A128 | A165       | Natasha Stevens |
| Joseph Angelin  | A129 | A165       | Natasha Stevens |
| Vanessa Parry   | A130 | A187       | Adam Justin     |
| Paul vincet     | A132 | A120       | Tim Archer      |
| Steve Michelos  | A133 | A187       | Adam Justin     |
| Tara Cummings   | A142 | A187       | Adam Justin     |
| Braud Micheal   | A143 | A120       | Tim Archer      |
| Nick Martin     | A156 | A178       | Bruce Wills     |
| Edward Cane     | A176 | A120       | Tim Archer      |
| Harolld Stevens | A194 | A187       | Adam Justin     |
| Tom Hanks       | A198 | A187       | Adam Justin     |
+-----------------+------+------------+-----------------+
15 rows in set (0.00 sec)

Problem(5):Select the Empolyee who is a Manager and has least salary
Query:select name, min(salary) from (select a.name,a.salary from Employee a,Employee b where a.Manager_ID=b.E_ID)as t;
output:
+-------------+-------------+
| name        | min(salary) |
+-------------+-------------+
| John Hellen |       15380 |
+-------------+-------------+

Problem(6):Select the total number of Employees in Communications departments
Query:select count(E_ID) from Employee where Dept_id=(select Dept_id from Departments where Dept_name='Communications');
output:
+-------------+
| count(E_ID) |
+-------------+
|           6 |
+-------------+
1 row in set (0.00 sec)

Problem(7):Select the Employee in Finance Department who has the top salary
Query:select name,max(salary) from Employee where Dept_id=(select Dept_id from Departments where Dept_name='Finance');
output:
+------------+-------------+
| name       | max(salary) |
+------------+-------------+
| Adam Wayne |       94324 |
+------------+-------------+
1 row in set (0.00 sec)

Problem(8):Select the Employee in product department who has the least salary
Query:select name,min(salary) from Employee where Dept_id=(select Dept_id from Departments where Dept_name='product');
output:
+-------------+-------------+
| name        | min(salary) |
+-------------+-------------+
| Nick Martin |       50174 |
+-------------+-------------+
1 row in set (0.00 sec)

Problem(9):Select the count of Empolyees in Health with maximum salary
Query:select name,max(salary) from Employee where Dept_id=(select Dept_id from Departments where Dept_name='Health');
output:
+-------------+-------------+
| name        | max(salary) |
+-------------+-------------+
| John Hellen |       94791 |
+-------------+-------------+
1 row in set (0.00 sec)

Problem(10):Select the Employees who report to Natasha Stevens
Query: select name from Employee where Manager_ID=(select E_ID from Employee where name='Natasha Stevens');
+----------------+
| name           |
+----------------+
| Adam Wayne     |
| Joseph Angelin |
+----------------+
2 rows in set (0.00 sec)

Problem(11):Display the Employee name,Employee count,Dep name,Dept manager in the Health department
Query:select t.name,d.Dept_name,d.Dep_Manager from departments d inner join(select name from employee where Dept_id= (select Dept_id from Departments where Dept_name='Health'))as t where Dept_name='Health';
output:
+----------------+-----------+-------------+
| name           | Dept_name | Dep_Manager |
+----------------+-----------+-------------+
| John Hellen    | Health    | Tim Archer  |
| Martin Tredeau | Health    | Tim Archer  |
| Tim Archer     | Health    | Tim Archer  |
| Paul vincet    | Health    | Tim Archer  |
| Braud Micheal  | Health    | Tim Archer  |
| Edward Cane    | Health    | Tim Archer  |
+----------------+-----------+-------------+
6 rows in set (0.00 sec)

Problem(12):Display the Department id,Employee ids and Manager ids for the Communications department
Query:select E_ID,Dept_id,Manager_ID from employee where Dept_id=(select Dept_id from Departments where Dept_name='Communications');
output:
+------+---------+------------+
| E_ID | Dept_id | Manager_ID |
+------+---------+------------+
| A116 | D02     | A187       |
| A121 | D02     | A187       |
| A133 | D02     | A187       |
| A187 | D02     | A298       |
| A194 | D02     | A187       |
| A198 | D02     | A187       |
+------+---------+------------+
6 rows in set (0.00 sec)

Problem(13):Select the Average Expenses for Each dept with Dept id and Dept name
Query:select d.Dept_name,t.Dept_id,t.average from departments d inner join (select Dept_id,avg(salary) as average from employee group by Dept_id) as t where d.Dept_id=t.Dept_id;
output:
+----------------+---------+------------+
| Dept_name      | Dept_id | average    |
+----------------+---------+------------+
| Health         | D01     | 54527.6667 |
| Communications | D02     | 48271.3333 |
| product        | D03     | 58517.5000 |
| Insurance      | D04     | 64020.0000 |
| Finance        | D05     | 56660.3333 |
+----------------+---------+------------+
5 rows in set (0.00 sec)

Problem(14):Select the total expense for the department finance
Query:select sum(salary)  from employee where Dept_id=(select Dept_id from departments where Dept_name='Finance' );
output:
+-------------+
| sum(salary) |
+-------------+
|      169981 |
+-------------+
1 row in set (0.00 sec)

Problem(15):Select the department which spends the least with Dept id and Dept manager name
Query:select d.Dept_name,Dep_Manager,tt.minimum from Departments d inner join (select min(t.total) as minimum,Dept_id from (select Dept_id,sum(salary) as total from employee group by Dept_id)as t)as tt where d.Dept_id=tt.Dept_id;
output:
+-----------+-------------+---------+
| Dept_name | Dep_Manager | minimum |
+-----------+-------------+---------+
| Health    | Tim Archer  |  117035 |
+-----------+-------------+---------+
1 row in set (0.00 sec)

Problem(16):Select the count of Employees in each department
Query:(select count(E_ID),Dept_id from employee group by Dept_id);
output:
+-------------+---------+
| count(E_ID) | Dept_id |
+-------------+---------+
|           6 | D01     |
|           6 | D02     |
|           2 | D03     |
|           2 | D04     |
|           3 | D05     |
+-------------+---------+
5 rows in set (0.00 sec)

Problem(17):Select the count of Employees in each department having salary <10000
Query:select count(E_ID) ,salary,E_ID from Employee group by  Dept_id having salary<10000;
output:Empty set (0.02 sec)

Problem(18):Select the total number of Employees in Dept id D04
Query:select count(E_ID) from employee group by Dept_id having Dept_id='D04';
output:
+-------------+
| count(E_ID) |
+-------------+
|           2 |
+-------------+
1 row in set (0.00 sec)

Problem(19):Select all department details of the Department with Maximum Employees
 select  d.dept_id,Dept_name,Dep_Manager from Departments d inner join(select max(mycount),Dept_id from(select count(E_ID) as mycount ,Dept_id from employee group by Dept_id)as t)as tt where d.dept_id=tt.Dept_id;
+---------+-----------+-------------+
| dept_id | Dept_name | Dep_Manager |
+---------+-----------+-------------+
| D01     | Health    | Tim Archer  |
+---------+-----------+-------------+
1 row in set (0.00 sec)

Problem(20):Select the Employees who has Tim Cook as their manager
Query: select name from employee where Manager_id in (select E_ID from employee where name='Tim Archer');
output:
+----------------+
| name           |
+----------------+
| John Hellen    |
| Martin Tredeau |
| Paul vincet    |
| Braud Micheal  |
| Edward Cane    |
+----------------+
5 rows in set (0.00 sec)



