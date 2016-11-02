insert into company(company_name)
	values 	("Industrial Industries"),
			("Software Co."),
            ("Food4Cheap"),
            ("SunMoney Bank Inc."),
            ("Catastrophic Demolition Inc.");
            
insert into account(email, first_name, last_name)
	values	("susanwhite@gmaul.com", "Susan", "White"),
            ("dudebro@brofest.io", "Dude", "Bro"),
            ("facehugger36@gmaul.com", "Kelly", "Alienseed"),
            ("denzel1337@crashplane.gov", "Denzel", "Washington"),
            ("darthawesome4444444@gmaul.gov", "Darth", "Maul");
            
insert into address(street, zip_code)
	values	(":3 Kitty ct. Meowston, MA", 83839),
			("1337 Haxor ln. Darknet, CA", 69696),
            ("1234 Number st. Algebra, MA", 54321),
            ("4 Four blvd. Foorton, FO", 44444),
            ("5 five st. Fivewich, UK", 55555);
            
insert into skill(name, description)
	values	("Sleeping", "ZZZZZZZzzzzzzzZZZZZZzzZZzzZZZZZZZZZZZZZzzzzZZZZZZZzzz"),
			("Procrastinating", "TODO"),
            ("Laundry", "folding folding folding folding"),
            ("Giving up", "nothing matters in the end anyway."),
            ("Delivering Babies", "Just gotta reach in there, grab a leg, and pull em out");

insert into school(school_name, address_id)
	values	("Kitty Academy", 1),
			("Foorton State Univ. School of Laundry", 4),
            ("Foorton State Univ. School of Undecided", 4),
            ("Fivewich Univ. School of Laundering", 5),
            ("Fivewich Univ. School of Naught", 5);

insert into resume(account_id, resume_name)
	values	(1, "test"),
            (1, "why you should hire me"),
            (3, "acquire labor"),
            (4, "acting stuff"),
            (5, "jedi I've killed"),
            (5, "jedi jedi jedi"),
            (5, "I am sith"),
            (2, "lol");
            
insert into account_skill(account_id, skill_id)
	values	(1, 2), (1, 4),
            (3, 5),
            (4, 3), (4, 4),
            (5, 1), (5, 2), (5, 3), (5, 4), (5, 5);
            
insert into account_school(account_id, school_id, start_date, end_date, gpa)
	values	(1, 5, 400, 500, 4), 
            (3, 5, 1012, 1212, 2),
            (5, 1, 0711, 1100, 4.55),
            (4, 1, 0711, 1100, 2.5),
            (4, 2, 1101, 1229, 1.111);

insert into account_company(account_id, company_id)
	values	(1, 1),
			(1, 2),
            (2, 1),
            (3, 3),
            (5, 5);
            
insert into company_address(company_id, address_id)
	values 	(1,1),
			(2,2),
			(3,3),
            (4,2),
            (5,1);
            
insert into resume_company(resume_id, company_id, date_shared, was_hired)
	values	(1, 5, 11111, true),
			(2, 3, 11110, false),
            (3, 3, 1010, true),
            (4, 4, 1011, false),
            (5, 1, 1012, true),
            (6, 2, 1013, true),
            (7, 3, 1014, false);
            
insert into resume_skill(skill_id, resume_id)
	values	(2, 1), (2, 2), (4, 2),
			(5, 3),
            (3, 4), (4, 4),
            (1, 5), (2, 5), (4, 5), (1,6), (2,6), (3,6), (5,7), (4,7);

insert into resume_school(resume_id, school_id)
	values	(1, 5),
			(2, 5),
            (3, 5),
            (5, 1),
            (4, 1),
            (4, 2);