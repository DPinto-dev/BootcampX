SELECT COUNT(*) AS total_assistances, name
FROM assistance_requests 
JOIN teachers ON teachers.id = teacher_id 
WHERE teachers.name = 'Waylon Boehm'
GROUP BY name;

-- COMPASS ANSWER (should we add table name always?)
SELECT count(assistance_requests.*) as total_assistances, teachers.name
FROM assistance_requests
JOIN teachers ON teachers.id = teacher_id
WHERE name = 'Waylon Boehm'
GROUP BY teachers.name;