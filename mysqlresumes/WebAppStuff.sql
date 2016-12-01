use richardson;

create or replace view school_view as
select s.*, a.street, a.zip_code from school s
join address a on a.address_id = s.address_id;

create or replace view resume_view as
select resume_id, r.account_id, first_name, last_name, resume_name
from resume r
left join account a on a.account_id = r.account_id;

select * from resume_view;

#lab 12

 DROP PROCEDURE IF EXISTS company_getinfo;
 DELIMITER //
 CREATE PROCEDURE company_getinfo (_company_id int)
 BEGIN
 SELECT * FROM company WHERE company_id = _company_id;
 SELECT a.*, s.company_id FROM address a
 LEFT JOIN company_address s on s.address_id = a.address_id AND company_id = _company_id;
 END //
 DELIMITER ;
 # Call the Stored Procedure
 CALL company_getinfo (4);
 
 DROP PROCEDURE IF EXISTS school_getinfo;
 DELIMITER //
 CREATE PROCEDURE school_getinfo (school_id int)
 BEGIN
 SELECT * FROM school WHERE school_id = school_id;
 SELECT a.*, school_id FROM address a
 LEFT JOIN school s on s.address_id = a.address_id;
 END //
 DELIMITER ;
 # Call the Stored Procedure
 CALL school_getinfo (4);