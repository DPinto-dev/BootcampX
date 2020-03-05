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

pool
  .query(
    `SELECT teachers.name AS teacher, cohorts.name AS cohort
  FROM teachers
  JOIN assistance_requests ON teachers.id = teacher_id
  JOIN students ON students.id = assistance_requests.student_id
  JOIN cohorts ON cohorts.id = students.cohort_id
  WHERE cohorts.name = '${process.argv.slice(2)[0].toUpperCase()}'
  GROUP BY teachers.name, cohorts.name
  ORDER BY teachers.name;`
  )
  .then(res => {
    res.rows.forEach(row => {
      console.log(`${row.cohort}: ${row.teacher}`);
    });
  });
