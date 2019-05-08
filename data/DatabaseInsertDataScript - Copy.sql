INSERT INTO student (id, NAME) 
	VALUES 	(1, 'Student 1'), 
			(2, 'Student 2'),
			(3, 'Student 3');
			
INSERT INTO course (id, title, amount, currency) 
	VALUES 	(1, 'Course 1 Title', 0.0, 'USD'), 
			(2, 'Course 2 Title', 20.0, 'USD'),
			(3, 'Course 3 Title', 200.0, 'USD');
			
INSERT INTO module (id, course_id, `order`) 
	VALUES 	(1, 1, 1), 
			(2, 1, 2),
			(3, 2, 1), 
			(4, 2, 2),
			(5, 3, 1), 
			(6, 3, 2);
			
INSERT INTO lesson (id, module_id, `order`, title, content) 
	VALUES 	(1,  1, 1, 'lesson title', 'free text'), 
			(2,  1, 2, 'lesson title', 'free text'),
			(3,  2, 1, 'lesson title', 'free text'),
			(4,  2, 2, 'lesson title', 'free text'),
			(5,  3, 1, 'lesson title', 'free text'),
			(6,  3, 2, 'lesson title', 'free text'),
			(7,  4, 1, 'lesson title', 'free text'),
			(8,  4, 2, 'lesson title', 'free text'),
			(9,  5, 1, 'lesson title', 'free text'),
			(10, 5, 2, 'lesson title', 'free text'),
			(11, 6, 1, 'lesson title', 'free text'),
			(12, 6, 2, 'lesson title', 'free text');
			
INSERT INTO enrolments (student_id, course_id) 
	VALUES 	(1, 1), 
			(2, 1),
			(3, 1);