// Load the MySQL pool connection
const pool = require('../data/config');

const router = app => {
    app.get('/', (request, response) => {
        response.send({
            message: 'Node.js RESTful courses service'
        });
    });
	// Display all students
	app.get('/students', (request, response) => {
		pool.query('SELECT * FROM student', (error, result) => {
			if (error) throw error;
 
			response.send(result);
		});
	});
	
	// Display a single student by ID
	app.get('/students/:id', (request, response) => {
		const id = request.params.id;
	
		pool.query('SELECT * FROM student WHERE id = ?', id, (error, result) => {
			if (error) throw error;
	
			response.send(result);
		});
	});
	
	// Add a new student
	app.post('/students', (request, response) => {
		pool.query('INSERT INTO student SET ?', request.body, (error, result) => {
			if (error) throw error;
	
			response.status(201).send(`A new student was added.`);
		});
	});
	
	// Update an existing student
	app.put('/students/:id', (request, response) => {
		const id = request.params.id;
	
		pool.query('UPDATE student SET ? WHERE id = ?', [request.body, id], (error, result) => {
			if (error) throw error;
	
			response.send('Student updated successfully.');
		});
	});
	
	// Delete a student
	app.delete('/students/:id', (request, response) => {
		const id = request.params.id;
	
		pool.query('DELETE FROM student WHERE id = ?', id, (error, result) => {
			if (error) throw error;
	
			response.send('User deleted.');
		});
	});
	
	// Display all courses
	app.get('/courses', (request, response) => {
		pool.query('SELECT * FROM course', (error, result) => {
			if (error) throw error;
 
			response.send(result);
		});
	});
	
	//Display a single course by ID
	app.get('/courses/:id', (request, response) => {
		const id = request.params.id;
	
		pool.query('SELECT * FROM course WHERE id = ?', id, (error, result) => {
			if (error) throw error;
	
			response.send(result);
		});
	});
	
	// Display all enrolments
	app.get('/enrolments', (request, response) => {
		pool.query('SELECT * FROM enrolments', (error, result) => {
			if (error) throw error;
 
			response.send(result);
		});
	});
	
	//Display all enrolments by a course
	app.get('/enrolments/student/:id', (request, response) => {
		const id = request.params.id;
	
		pool.query('SELECT * FROM enrolments WHERE student_id = ?', id, (error, result) => {
			if (error) throw error;
	
			response.send(result);
		});
	});
	
	//Display all enrolments by a course
	app.get('/enrolments/course/:id', (request, response) => {
		const id = request.params.id;
	/* TODO many to many join
					SELECT s.id, s.name, e.id, e.title
					FROM student as s, course as c, entrolments as e
					WHERE s.id = ?
					AND e.student_id = s.id
					AND c.id = e.course_id
	*/
		pool.query('SELECT * FROM enrolments WHERE course_id = ?', id, (error, result) => {
			if (error) throw error;
	
			response.send(result);
		});
	});
	
	//Display all enrolments by a student
	app.get('/enrolments/student/:id', (request, response) => {
		const id = request.params.id;
	
		pool.query('SELECT * FROM enrolments WHERE student_id = ?', id, (error, result) => {
			if (error) throw error;
	
			response.send(result);
		});
	});
	
	// Add a new enrolment
	app.post('/enrolments', (request, response) => {
		pool.query('INSERT INTO enrolments SET ?', request.body, (error, result) => {
			if (error) throw error;
	
			response.status(201).send(`Adding a new enrolment was successful`);
		});
	});
}

// Export the router
module.exports = router;