-- Get the names of all of the students from a single cohort.
-- Since this query needs to work with any specific cohort, just use any number for the cohort_id.
SELECT students.id, students.name 
FROM students
JOIN cohorts ON cohorts.id = students.cohort_id
ORDER BY name;

-- Get the names of all of the students from a single cohort.
SELECT id, name
FROM students
WHERE cohort_id = 1
ORDER BY name;

-- Total Students in Cohorts
-- Select the total number of students who were in the first 3 cohorts.
SELECT count(id)
FROM students
WHERE cohort_id IN (1, 2, 3);

-- Get all of the students that don't have an email or phone number.
SELECT name, id, cohort_id
FROM students
WHERE email IS NULL 
OR phone IS NULL;

-- Get all of the students without a gmail.com or phone number.
SELECT name, email, id, cohort_id
FROM students
WHERE email NOT LIKE '%gmail.com'
AND phone IS NULL;

-- Get all of the students currently enrolled ( equivalent to end date = NULL)
SELECT name, id, cohort_id
FROM students
WHERE end_date IS NULL
ORDER BY cohort_id;

-- Get all graduates without a linked Github account.
SELECT name, email, phone
FROM students
WHERE github IS NULL
AND end_date IS NOT NULL;

-- Select all rollover students (a student's start_date will differ from their cohort's start_date)
SELECT students.name AS student_name, cohorts.name AS cohort_name,
cohorts.start_date AS cohort_start_date, students.start_date AS student_start_date 
FROM students 
JOIN cohorts ON cohort_id = cohorts.id
WHERE students.start_date != cohorts.start_date
ORDER BY cohort_name;