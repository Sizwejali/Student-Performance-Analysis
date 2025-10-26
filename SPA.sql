use test_db;
CREATE TABLE student_scores (
    student_id VARCHAR(10) PRIMARY KEY,
    hours_studied DECIMAL(5,2),
    sleep_hours DECIMAL(5,2),
    attendance_percent DECIMAL(5,2),
    previous_scores INT,
    exam_score DECIMAL(5,2)
);
---------------------------------------------------------------
select * from student_scores;
---------------------------------------------------------------
-- Top 5 students by exam score
Select Student_id, exam_score
from student_scores
order by exam_score desc
limit 5;
---------------------------------------------------------------
-- Bottom 5 exam scores
SELECT student_id, exam_score
FROM student_scores
ORDER BY exam_score ASC
LIMIT 5;
---------------------------------------------------------------
-- Sleep Hours vs Exam Score
Select
   Round(sleep_hours) as sleep_group,
   avg(exam_score) as avg_exam_score,
   count(*) as student_count
from student_scores
group by sleep_group
order by sleep_group desc;
---------------------------------------------------------------
Select
    case
       when attendance_percent >= 90 then '90+'
       when attendance_percent >= 75 then '75-89'
       else 'Below 75'
	end as attendance_group,
    avg(exam_score) as avg_exam_score,
    count(*) as student_count
from student_scores
group by attendance_group
order by attendance_group desc;

----------------------------------------------------------------
-- Hours Studied vs Exam Score

Select student_id, hours_studied, exam_score
from student_scores
order by hours_studied desc;

