#Test Queries from haderman
SELECT company_name, AVG(GPA) AS average_gpa
FROM company c
LEFT JOIN resume_company rc ON c.company_id = rc.company_id
LEFT JOIN resume r ON r.resume_id = rc.resume_id
LEFT JOIN resume_school rs ON rs.resume_id = r.resume_id
LEFT JOIN account_school as1 ON as1.school_id = rs.school_id
WHERE rc.was_hired = 1
GROUP BY c.company_id;

SELECT first_name, last_name
FROM account a
JOIN resume r ON r.account_id = a.account_id
JOIN resume_company rc ON rc.resume_id = r.resume_id
WHERE rc.was_hired = 1;
###############################


#Task 1
select company_name
from resume_company rc
left join company c on rc.company_id = c.company_id
left join resume r on rc.resume_id = r.resume_id
where account_id = 1;

#Task 2
select count(company_id)
from resume_company rc
left join resume r on rc.resume_id = r.resume_id
where account_id = 1;

#Task 3
select count(company_id) as num_shared
from resume_company rc
left join resume r on rc.resume_id = r.resume_id
where account_id = 1;

#Task 4
select first_name, last_name, count(company_id) as num_shared
from account a
left join resume r on a.account_id = r.account_id
left join resume_company rc on r.resume_id = rc.resume_id
group by a.account_id;

#Task 5
select first_name, last_name, count(company_id) as num_shared
from account a
left join resume r on a.account_id = r.account_id
left join resume_company rc on r.resume_id = rc.resume_id
group by a.account_id
order by num_shared;

#Task 6
select first_name, last_name
from account a
left join resume r on a.account_id = r.account_id
left join resume_company rc on r.resume_id = rc.resume_id
group by a.account_id
having count(company_id) > 1;