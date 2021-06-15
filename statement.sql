https://www.w3schools.com/sql/default.asp
----------------------------------------------------------------------------------------------------------------------------------
#### basic 
----------------------------------------------------------------------------------------------------------------------------------
595. Big Countries
https://leetcode.com/problems/big-countries/description/
SELECT name, area, population 
FROM world 
WHERE area > 3000000 OR population > 25000000

584. Find Customer Referee
https://leetcode.com/problems/find-customer-referee/description/
select name
from customer 
where referee_id!=2 or referee_id is NULL

610. Triangle Judgement
https://leetcode.com/problems/triangle-judgement/description/
select *, if(x+y-z>0 and x-y+z>0 and -x+y+z>0, 'Yes', 'No') as 'triangle'
from triangle 

183. Customers Who Never Order
https://leetcode.com/problems/customers-who-never-order/description/
select Name as Customers 
from Customers 
where Id not in   (select CustomerId  from Orders)

176. Second Highest Salary *
https://leetcode.com/problems/second-highest-salary/
select(
    select distinct Salary
    from Employee
    order by Salary desc limit 1, 1
) as SecondHighestSalary

----------------------------------------------------------------------------------------------------------------------------------
#### multi-table
----------------------------------------------------------------------------------------------------------------------------------
613. Shortest Distance in a Line
https://leetcode.com/problems/shortest-distance-in-a-line/description/
select min(abs(a.x-b.x)) as shortest
from point a, point b 
where a.x!=b.x

        612. Shortest Distance in a Place
        https://leetcode.com/problems/shortest-distance-in-a-plane/        
        select round( min( sqrt( pow(a.x-b.x, 2)+pow(a.y-b.y,2) )) ,2 ) as shortest 
        from point_2d a, point_2d b
        where a.x!= b.x or a.y!= b.y

603. Consecutive Available Seats
https://leetcode.com/problems/consecutive-available-seats/description/
select distinct a.seat_id 
from cinema a, cinema b
where abs(a.seat_id - b.seat_id)=1 and a.free= 1 and b.free= 1
order by a.seat_id

        180. Consecutive Numbers
        https://leetcode.com/problems/consecutive-numbers/description/
        select distinct a.Num as ConsecutiveNums 
        from Logs a, Logs  b, Logs  c
        where (a.Num = b.Num  and a.Id-b.Id=1) and (a.Num = c.Num  and a.Id-c.Id=2)               

182. Duplicate Emails
https://leetcode.com/problems/duplicate-emails/description/
select distinct p1.Email
from Person p1, Person p2
where p1.Id!=p2.Id and p1.Email=p2.Email

181. Employees Earning More Than Their Managers
https://leetcode.com/problems/employees-earning-more-than-their-managers/description/
select e.Name as Employee
from Employee e, Employee b
where e.ManagerId=b.Id and e.Salary > b.Salary

197. Rising Temperature
https://leetcode.com/problems/rising-temperature/description/
select w2.Id
from Weather w1, Weather w2
where TO_DAYS(w1.RecordDate) +1 = TO_DAYS(w2.RecordDate) and w1.Temperature < w2.Temperature

196. Delete Duplicate Emails
https://leetcode.com/problems/delete-duplicate-emails/description/
delete a from Person a, Person b
where a.Email=b.Email and a.Id > b.Id


178. Rank Scores
https://leetcode.com/problems/rank-scores/
select Score,
    (select count(distinct s2.Score) from Scores s2 where s2.score >= s1.score) as Rank
from  Scores s1
order by Score desc

----------------------------------------------------------------------------------------------------------------------------------
#### group 
----------------------------------------------------------------------------------------------------------------------------------

182. Duplicate Emails        
https://leetcode.com/problems/duplicate-emails/description/
select Email 
from Person 
group by Email having count(Email) > 1

        570. Managers with at Least 5 Direct Reports
        https://leetcode.com/problems/managers-with-at-least-5-direct-reports/description/
        select Name 	  
        from Employee
        where Id in 
            (select ManagerId 
            from Employee 
            group by ManagerId having count(ManagerId)>4 )

        585. Investments in 2016
        https://leetcode.com/problems/investments-in-2016/description/
        select sum(TIV_2016) as TIV_2016  from insurance
        where 
            TIV_2015 in (select TIV_2015 from insurance group by TIV_2015 having count(*) > 1) 
                and 
            concat(LAT, LON) in (select concat(LAT, LON) from insurance group by LAT, LON having count(*) = 1)

----------------------------------------------------------------------------------------------------------------------------------
#### order
----------------------------------------------------------------------------------------------------------------------------------

596. Classes More Than 5 Students
https://leetcode.com/problems/classes-more-than-5-students/description/
select class
from courses
group by class having count(distinct student)>4

    178. Rank Scores
    https://leetcode.com/problems/rank-scores/
    select Score,
        (select count(distinct s2.Score) from Scores s2 where s2.score >= s1.score) as Rank
    from  Scores s1
    order by Score desc
    
        602. Friend Requests II: Who Has the Most Friends
        # Write your MySQL query statement below
        select ids as id, cnt as num
        from(
                select ids, count(*) as cnt from (
                        select requester_id as ids from request_accepted 
                        union all#not del duplicate
                        select accepter_id from request_accepted    
                ) as tb1 group by ids 
        ) as tb2 order by cnt desc limit 1

619. Biggest Single Number
https://leetcode.com/problems/biggest-single-number/description/
select max(num) as num
from    
    (select num
    from number
    group by num having count(*)=1) as t

586. Customer Placing the Largest Number of Orders
https://leetcode.com/problems/customer-placing-the-largest-number-of-orders/description/
select customer_number 
from orders 
group by customer_number 
order by count(*) desc limit 1

620. Not Boring Movies
https://leetcode.com/problems/not-boring-movies/description/
select *
from cinema
where id%2=1 and  description!='boring' 
order by rating desc

603. Consecutive Available Seats
https://leetcode.com/problems/consecutive-available-seats/description/
select distinct a.seat_id 
from cinema a, cinema b
where abs(a.seat_id - b.seat_id)=1 and a.free= 1 and b.free= 1
order by a.seat_id



    177. Nth Highest Salary
    https://leetcode.com/problems/nth-highest-salary/description/
    CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
    BEGIN
        set N = N-1;
        RETURN (
        # Write your MySQL query statement below.
            select distinct Salary from Employee order by Salary desc limit N, 1
        );
    END

----------------------------------------------------------------------------------------------------------------------------------
#### if
----------------------------------------------------------------------------------------------------------------------------------

627. Swap Salary
https://leetcode.com/problems/swap-salary/description/
update salary
set sex = if(sex='m', 'f', 'm')

610. Triangle Judgement
https://leetcode.com/problems/triangle-judgement/description/
select *, if(x+y-z>0 and x-y+z>0 and -x+y+z>0, 'Yes', 'No') as 'triangle'
from triangle 

619. Biggest Single Number
https://leetcode.com/problems/friend-requests-i-overall-acceptance-rate/description/
select
round(
    ifnull(
        (select count(*) from (select distinct requester_id, accepter_id from request_accepted) as A_table)
        /
        (select count(*) from (select distinct sender_id, send_to_id from friend_request) as B_table)
        ,0) 
    ,2
    ) 
as accept_rate;

----------------------------------------------------------------------------------------------------------------------------------
#### join
----------------------------------------------------------------------------------------------------------------------------------
577. Employee Bonus
https://leetcode.com/problems/employee-bonus/description/
select name, bonus
from Employee left join Bonus on Employee.empId = Bonus.empId
where bonus < 1000 or bonus is null

183. Customers Who Never Order
https://leetcode.com/problems/customers-who-never-order/description/
select Name as Customers
from Customers left join Orders on Customers.Id= Orders.CustomerId
where CustomerId is null

    580.Count Student Number in Departments
    https://leetcode.com/problems/count-student-number-in-departments/
    # Write your MySQL query statement below
    select dept_name, count(student_id) as student_number 
    from 
        department left join student on department.dept_id = student.dept_id 
    group by department.dept_name
    order by student_number desc, department.dept_name
    
    574. Winning Candidate
    https://leetcode.com/problems/winning-candidate/
    # Write your MySQL query statement below
    SELECT
        name AS 'Name'
    FROM
        Candidate
            JOIN
        (
            SELECT  Candidateid
            FROM    Vote
            GROUP BY    Candidateid
            ORDER BY COUNT(*) DESC LIMIT 1
        ) AS winner
    WHERE   Candidate.id = winner.Candidateid



607. Sales Person
https://leetcode.com/problems/sales-person/description/
select name 
from salesperson
where sales_id not in 
    ( 
    select sales_id   
    from company join orders 
    on company.com_id= orders.com_id 
    where name = 'RED' 
    )

    184. Department Highest Salary *
    https://leetcode.com/problems/department-highest-salary/description/    
    select 
        Department.Name as Department, 
        Employee.Name as Employee, 
        Salary #Employee.Salary as Salary 
    from 
        Department  
            left join 
        Employee  on Department.Id = Employee.DepartmentId 

    where (Department.Id, Employee.Salary ) 
            in 
          (select DepartmentId, Max(Salary) from Employee group by DepartmentId)

608. Tree Node
https://leetcode.com/problems/tree-node/description/
select id, 'Root' as Type 
from tree 
where p_id is null
    union
select id, 'Leaf' as Type 
from tree 
where id not in ( select distinct p_id from tree where p_id is not null) and p_id is not null
    union
select id, 'Inner' as Type 
from tree 
where id in (select distinct p_id from tree where p_id is not null) and p_id is not null
order by id


