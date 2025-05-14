CREATE VIEW StudentsInfo AS (SELECT
   Students.name AS student_name,
   Students.student_id AS student_id,
   Courses.course_name AS course,
   Course_period.room AS room,
   Course_period.period AS period,
   Teachers.name AS teacher_name
FROM Students
RIGHT JOIN Rosters ON Students.student_id = Rosters.student_id
INNER JOIN Course_period ON Rosters.course_period_id = Course_period.course_period_id
INNER JOIN Teachers ON Course_period.teacher_id = Teachers.teacher_id
INNER JOIN Courses ON Course_period.course_id = Courses.course_id);

CREATE PROCEDURE GetCourses(id INTEGER)
   SELECT * FROM StudentsInfo
   WHERE student_id = id;

CREATE VIEW TeacherInfo AS (SELECT
   Teachers.name AS teacher_name,
   Teachers.teacher_id AS teacher_id,
   Courses.course_name AS course,
   Course_period.room AS room,
   Course_period.period AS period,
FROM Teachers
RIGHT JOIN Rosters ON Teachers.teacher_id = Rosters.teacher_id
INNER JOIN Course_period ON Rosters.course_period_id = Course_period.course_period_id
INNER JOIN Teachers ON Course_period.teacher_id = Teachers.teacher_id
INNER JOIN Courses ON Course_period.course_id = Courses.course_id);

CREATE PROCEDURE GetTeacherCourses(id INTEGER)
   SELECT * FROM TeacherInfo
   WHERE teacher_id = id;