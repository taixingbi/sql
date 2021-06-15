
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
