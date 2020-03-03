-- Get the total number of assignment submissions for each cohort.
-- MY SOLUTION:
SELECT cohorts.name AS cohort, COUNT(*) AS total_submissions
FROM cohorts 
JOIN students ON cohorts.id = cohort_id
JOIN assignment_submissions ON students.id = student_id
GROUP BY cohorts.name
ORDER BY total_submissions DESC;

-- COMPASS SOLUTION:
SELECT cohorts.name as cohort, count(assignment_submissions.*) as total_submissions
FROM assignment_submissions
JOIN students ON students.id = student_id
JOIN cohorts ON cohorts.id = cohort_id
GROUP BY cohorts.name
ORDER BY total_submissions DESC;

--* What about the order of the JOINS? Being Inner Joins it should be ok, but is there a best path logic to follow?