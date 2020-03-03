-- Get the total amount of time that a student has spent on all assignments.
-- This should work for any student but use 'Ibrahim Schimmel' for now.
-- Select only the total amount of time as a single column.
SELECT SUM(assignment_submissions.duration) AS total_duration, students.name AS student_name
FROM assignment_submissions 
JOIN students ON assignment_submissions.student_id = students.id
WHERE students.name = 'Ibrahim Schimmel'
GROUP BY student_name;



SELECT students.name as student, count(assignment_submissions.*) as total_submissions
FROM assignment_submissions
JOIN students ON students.id = student_id
WHERE students.end_date IS NULL
GROUP BY students.name
HAVING count(assignment_submissions.*) < 100;