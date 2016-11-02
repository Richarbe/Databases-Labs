use richardson;
drop table if exists resume_school;
drop table if exists resume_skill;
drop table if exists resume_company;
drop table if exists company_address;
drop table if exists account_company;
drop table if exists account_school;
drop table if exists account_skill;
drop table if exists school;
drop table if exists resume;
drop table if exists skill;
drop table if exists address;
drop table if exists account;
drop table if exists company;

create table company(	
						company_id int auto_increment primary key, 
						company_name varchar(256) unique);


create table account(	
						account_id int auto_increment primary key, 
						email varchar(256) unique, 
						first_name varchar(64), 
						last_name varchar(64));


create table address(
						address_id int auto_increment primary key,
                        street varchar(256),
                        zip_code int);
                        

create table skill(
						skill_id int auto_increment primary key,
                        name varchar(64) unique,
                        description varchar(256));


create table school(
						school_id int auto_increment primary key,
                        school_name varchar(256) unique,
                        address_id int,
					foreign key (address_id) references address(address_id) on delete cascade);

create table resume(
						resume_id int auto_increment primary key,
                        account_id int,
                        resume_name varchar(128),
					unique (account_id, resume_name),
                    foreign key (account_id) references account(account_id) on delete cascade);

create table account_skill(
						account_id int,
                        skill_id int,
					primary key (account_id, skill_id),
                    foreign key (account_id) references account(account_id) on delete cascade,
                    foreign key (skill_id) references skill(skill_id) on delete cascade);
					

create table account_school(
						account_id int,
                        school_id int,
                        start_date date,
                        end_date date,
                        gpa decimal(4,3),
					primary key (account_id, school_id),
					foreign key (account_id) references account(account_id) on delete cascade,
                    foreign key (school_id) references school(school_id) on delete cascade);

create table account_company(
						account_id int, 
						company_id int, 
					primary key (account_id, company_id),
					foreign key (account_id) references account(account_id) on delete cascade,
					foreign key (company_id) references company(company_id) on delete cascade);


create table company_address(
						company_id int,
                        address_id int,
					primary key (company_id, address_id),
					foreign key (company_id) references company(company_id) on delete cascade,
                    foreign key (address_id) references address(address_id) on delete cascade);
				
create table resume_company(
						resume_id int,
                        company_id int,
                        date_shared date,
                        was_hired bool,
					primary key (resume_id, company_id),
					foreign key (resume_id) references resume(resume_id) on delete cascade,
                    foreign key (company_id) references company(company_id) on delete cascade);
                    
create table resume_skill(
						skill_id int,
                        resume_id int,
					primary key (skill_id, resume_id),
					foreign key (skill_id) references skill(skill_id) on delete cascade,
					foreign key (resume_id) references resume(resume_id) on delete cascade);
                        
create table resume_school(
						resume_id int,
                        school_id int,
					primary key (resume_id, school_id),
                    foreign key (resume_id) references resume(resume_id) on delete cascade,
                    foreign key (school_id) references school(school_id) on delete cascade);