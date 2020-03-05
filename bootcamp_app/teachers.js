const { Pool } = require("pg");

const pool = new Pool(
  {
    user: "vagrant",
    password: "123",
    host: "localhost",
    database: "bootcampx"
  },
  console.log("Connected")
);

const queryString = `SELECT teachers.name AS teacher, cohorts.name AS cohort
FROM teachers
JOIN assistance_requests ON teachers.id = teacher_id
JOIN students ON students.id = assistance_requests.student_id
JOIN cohorts ON cohorts.id = students.cohort_id
WHERE cohorts.name = $1
GROUP BY teachers.name, cohorts.name
ORDER BY teachers.name;`;

const cohortName = process.argv[2] || "FEB12";
const values = [cohortName];

pool.query(queryString, values).then(res => {
  res.rows.forEach(row => {
    console.log(`${row.cohort}: ${row.teacher}`);
  });
});
