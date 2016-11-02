	create or replace view CompanyResumeView as
	select c.company_id, company_name, r.resume_id, resume_name, account_id, was_hired
	from resume_company rc
    left join company c on rc.company_id = c.company_id
    left join resume r on rc.resume_id = r.resume_id;
    
    create or replace view ResumeGPAView as
    select rs.resume_id, rs.school_id, gpa
    from resume_school rs
    left join resume r on r.resume_id = rs.resume_id
    left join account_school a_s on a_s.account_id = r.account_id and a_s.school_id = rs.school_id;
    
    select * from ResumeGPAView;
    select * from account_school;
    
    DROP FUNCTION IF EXISTS company_num_submitted;
    
	DELIMITER //
	CREATE FUNCTION company_num_submitted(_company_id int) RETURNS INT
	BEGIN
	DECLARE num_resumes int;
    
	SELECT count(*) INTO num_resumes
    FROM CompanyResumeView
    WHERE company_id = _company_id;
    
	RETURN num_resumes;
	
    END//
	DELIMITER ;
    
    DROP FUNCTION IF EXISTS company_avg_gpa;
    delimiter //
    create function company_avg_gpa(_company_id int) returns decimal(4,3)
    begin
    declare avg_gpa decimal(4,3);
    select avg(gpa) into avg_gpa
    from CompanyResumeView crv
    left join ResumeGPAView rgv on rgv.resume_id = crv.resume_id
    where company_id = _company_id;
    return avg_gpa;
    end
    // delimiter ;
    
    drop function if exists company_num_hired;
    delimiter //
    create function company_num_hired(_company_id int) returns int
    begin
    declare num_hired int;
    select count(*) into num_hired
    from CompanyResumeView crv
    where company_id = _company_id and was_hired = true;
    return num_hired;
    end
    // delimiter ;
    
    #Joins, Views, and derived functions cont,
    
    #1)
	select c.company_id, company_name, company_num_submitted(c.company_id),
    company_avg_gpa(c.company_id), company_num_hired(c.company_id)
    from company c;
    
	#2)
    create or replace view company_resume_statistics as
	select c.company_id, company_name, company_num_submitted(c.company_id) 'num_submitted',
    company_avg_gpa(c.company_id) 'avg_gpa', company_num_hired(c.company_id) 'num_hired'
    from company c;
    
    select * from company_resume_statistics;
    
    #3)
    drop procedure if exists company_getstats;
    delimiter //
    create procedure company_getstats (_company_id int)
    begin
    select * from company_resume_statistics crsv
    where crsv.company_id = _company_id;
    end
    // delimiter ;
    
    call company_getstats(2);
    
    #4)
    drop procedure if exists gpa_getgreatercompanies;
    delimiter //
    create procedure gpa_getgreatercompanies(_gpa decimal(4,3))
    begin
    select company_id, company_name
    from company_resume_statistics crsv
    where crsv.avg_gpa >= _gpa;
    end
    // delimiter ;
    
    call gpa_getgreatercompanies(4);
    
    #5) 
    drop function if exists company_has_hired;
    delimiter //
    create function company_has_hired(_company_id int) returns bool
    begin
    declare have_hired bool;
    select num_hired >= 1 into have_hired
    from company_resume_statistics crsv
    where crsv.company_id = _company_id;
    return have_hired;
    end
    // delimiter ;
    
    select company_has_hired(2);
    
    
    
    