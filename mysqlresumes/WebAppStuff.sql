create or replace view school_view as
select s.*, a.street, a.zip_code from school s
join address a on a.address_id = s.address_id;

create or replace view resume_view as
select resume_id, r.account_id, first_name, last_name, resume_name
from resume r
left join account a on a.account_id = r.account_id;

select * from resume_view;

