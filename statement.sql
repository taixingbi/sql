
#### basic 
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
select(
    select distinct Salary
    from Employee
    order by Salary desc limit 1, 1
) as SecondHighestSalary


#### from multi-table
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
