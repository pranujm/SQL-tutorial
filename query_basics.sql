/* SQL BASICS */

/* 1 & 2. View the table (SELECT, FROM) */

-- show all columns and rows in students table

SELECT * 
FROM students;

-- show only student names, gpa, and school lunch

SELECT student_name, gpa, school_lunch
FROM students;

/* 3. Show students who get school lunch (WHERE) */

SELECT student_name, gpa, school_lunch
FROM students
WHERE school_lunch = 'Yes';

-- also show students who get school lunch and with gpa > 3.3

SELECT student_name, gpa, school_lunch
FROM students
WHERE school_lunch = 'Yes' AND gpa > 3.3;

/* 4. Sort the students by gpa (ORDER BY) */

-- ascending order

SELECT student_name, gpa, school_lunch
FROM students
WHERE school_lunch = 'Yes' AND gpa > 3.3
ORDER BY gpa; 

-- descending order

SELECT student_name, gpa, school_lunch
FROM students
WHERE school_lunch = 'Yes' AND gpa > 3.3
ORDER BY gpa DESC; 

/* 5. Show average GPA for each grade level (GROUP BY) */

-- select grade_level column 
-- get the average of all GPAs in each grade level and select that as a column

SELECT grade_level, AVG(gpa)
FROM students

-- group all rows with the same grade_level value together
-- order by the grade level lowest to highest (ascending order)

GROUP BY grade_level
ORDER BY grade_level;

/* 6. Show grade levels with average gpa below 3.3 (HAVING) */

-- use having clause to filter group by data

SELECT grade_level, AVG(gpa) AS avg_gpa
FROM students
GROUP BY grade_level
HAVING avg_gpa < 3.3
ORDER BY grade_level;

/* 7. Only get a select number of rows (LIMIT) */

-- only get 5 rows of data

SELECT * 
FROM students
LIMIT 5;

/* 8. Get the number of rows or columns from data (COUNT) */

 -- count the number of rows of students who get school lunch and have gpa < 3.3
 
 SELECT COUNT(*)
 FROM students
 WHERE school_lunch = 'Yes' AND gpa > 3.3;
 
 /* 9. Only get unique GPA values (DISTINCT) */
 
 -- use distinct clause to only get unique values
 
 SELECT DISTINCT gpa
 FROM students
 ORDER BY gpa DESC;
 
 /* 10. Show the final grades for each student (JOIN) */
 
 -- match up the students id columns in both tables
 
 SELECT students.id, students.student_name, 
		student_grades.class_name, student_grades.final_grade
 FROM students LEFT JOIN student_grades
	ON students.id = student_grades.student_id;
    
 
