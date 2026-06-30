CREATE DATABASE student_analytics_db;
USE student_analytics_db;
SELECT COUNT(*)
FROM studentperformancefactors;
SELECT AVG(Exam_Score)
FROM studentperformancefactors;
SELECT Parental_Involvement,
       AVG(Exam_Score)
FROM studentperformancefactors
GROUP BY Parental_Involvement;
SELECT MAX(Exam_Score)
FROM studentperformancefactors;
SELECT MIN(Exam_Score)
FROM studentperformancefactors;
SELECT MAX(Attendance)
FROM studentperformancefactors;
SELECT *FROM studentperformancefactors
WHERE Exam_Score > 90;
SELECT *
FROM studentperformancefactors
WHERE Parental_Involvement = 'High';
SELECT *
FROM studentperformancefactors
WHERE Hours_Studied > 30;
SELECT *FROM studentperformancefactors
ORDER BY Exam_Score DESC
LIMIT 10;
SELECT Motivation_Level,
AVG(Exam_Score)
FROM studentperformancefactors
GROUP BY Motivation_Level;
