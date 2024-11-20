-- Retrieve the name and membership_type of members who are female (gender = 'F').
select * from memberships 
	
Select member_id, membership_type 
from memberships
where gender = 'F'

-- get total female in each memeberships type 
Select membership_type, count(distinct member_id) as femalTotal
from memberships 
where gender = 'F'
Group by membership_type 
order by femalTotal desc
	
-- Find all members who have a Monthly membership type and have joined after 2023-11-01.
Select * 
from memberships
where membership_type = 'Monthly' 
	and join_date > '2023-11-01'

--Retrieve the name and status of members who have an Active status and are aged above 25.

Select member_id, status 
from memberships 
where status = 'Active' and age > 25

--Retrieve the details of visits made by members with visit_date = '2024-01-01'.

Select * 
from visits 
where visit_date = '2024-01-01'
	
--Get the list of members who have a Quarterly membership type and are aged between 20 and 30.
select *
from memberships 
where membership_type = 'Weekly' 
	and age between 20 and 30

--Retrieve the top 3 members who have made the most visits, only showing name and total_visits, 
--and order by total_visits in descending order.
Select name, count(visit_id) as vistCount
from members as m 
inner join visits as v 
	 on m.member_id = v.member_id 
group by name 
order by vistCount desc 
limit 3


--Find the number of members with a Monthly membership who are Active, 
-- grouped by membership_type,and limit the result to the top 2 most recent join dates
--?
SELECT membership_type, COUNT(member_id) AS member_count
FROM memberships
WHERE membership_type = 'Monthly' AND status = 'Active'
GROUP BY membership_type
ORDER BY  (join_date) DESC
LIMIT 2;

--Get the total number of visits for each member who has more than 2 visits,
--ordered by total_visits, and display only the first 5 members.
Select 
	member_id, 
	count(visit_id) as total_visits
from visits 
group by member_id 
having count(visit_id) > 2
order by total_visits desc 
limit 5

--Retrieve the number of members who have joined in 2023, grouped by membership_type, 
--where the total number of members in each group is more than 1.

Select membership_type, count(member_id) memberCount
from memberships
group by membership_type 
having count(member_id) > 1
order by memberCount desc 

--Find the average age of members who have Active membership status, grouped by membership_type, 
--ordered by membership_type alphabetically, and limit the result to 3.
Select 
	membership_type,
	avg(age)
from memberships
where status ='Active'
group by membership_type
order by membership_type, avg(age) desc
limit 3

--Retrieve all details of members who have a Cancelled membership.
Select * 
from memberships
where status = 'Cancelled'


--Find all members who are Male and have a Weekly membership 
--type, and order the result by join_date
Select * 
from memberships 
where gender = 'M'
And membership_type ='Weekly'
order by join_date 


--Get a list of distinct member ages.
Select distinct age 
from memberships
order by age

--Retrieve the name, membership_type, and join_date of all members who joined after 2023-10-01, 
--ordered by join_date in ascending order.

Select 
	name, 
	membership_type, 
	join_date
from memberships as ship
join members mem
	on mem.member_id = ship.member_id
where join_date > '2023-10-01'

	select * from visits

--Count the total number of visits made by each member, grouping by member_id.
Select member_id, count(visit_id) as total_visits
from visits 
group by member_id
order by total_visits desc


--Retrieve the membership_type and the count of members for each membership type.
Select 
	membership_type, 
	count(distinct member_id) as total_members 
from memberships 
group by membership_type
order by total_members desc



--Get the names and ages of members who have a Monthly 
--membership and are younger than 25, using WHERE.

Select name, age 
from memberships as ship
inner join members as mem
		on ship.member_id = mem.member_id
where membership_type = 'Monthly'
and age < 25
order by age


--retrieve the number of visits for each visit_date, ordered by visit_date.
Select visit_date, 
	count(visit_id)
from visits
group by visit_date 
order by visit_date

--Find the average age of members who have a Quarterly membership type
Select member_id, avg(age) as avg_age 
from memberships 
where membership_type = 'Quaterly'
group by member_id
order by avg_age desc


--Retrieve the name, membership_type, and status of members 
--who are Active and Monthly

Select 
	member_id, 
	membership_type,
	status 
from memberships 
where membership_type = 'Monthly'
And status = 'Active'

--Count the number of members with each membership_type, 
--using GROUP BY and HAVING to show only those with more than 1 member.
Select membership_type, 
	count(member_id) as member_count
from memberships 
group by membership_type
Having count(member_id) > 1
order by member_count desc

--Find the name of the member who has made the most visits, ordered by total_visits.
Select name, max(visit_id) as max_visits
from visits as vis 
join members as mem 
	on vis.member_id = mem.member_id 
group by name
order by max_visits desc 
limit 1


Retrieve the list of name and status of members who have 
Cancelled status and joined before 2023-11-01, and limit the result to 3 rows.

Select name,
	status
from members as mem 
join memberships as ship 
	on mem.member_id = ship.member_id
where ship.status = 'Cancelled'
	And ship.join_date < '2023-11-01'
limit 3

--Find the average age of members with Active status, grouped by membership_type.
Select membership_type, 
	   avg(age) as avg_age 
from memberships 
where status = 'Active'
group by membership_type
order by  avg_age desc    -- the youngest customers tend to get weekly memebership_type



--Retrieve all visit details (date, check-in, check-out)
--for the first 5 visits, ordered by visit_date in descending order.
--?
Select member_id, 
	count(visit_id), 
	visit_date,
	check_in_time, 
	check_out_time
from visits 
group by member_id, visit_date
order by visit_date desc 





 
	

