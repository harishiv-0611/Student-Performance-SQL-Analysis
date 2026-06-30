USE student_analytics_db;
-- Which motivation level has the highest average exam score?
SELECT Motivation_Level,
ROUND(AVG(Exam_Score),2) AS Average_Exam_Score
FROM studentperformancefactors
GROUP BY Motivation_Level
ORDER BY Average_Exam_Score DESC;
-- Does parental involvement affect exam performance?
SELECT Parental_Involvement,
       ROUND(AVG(Exam_Score),2) AS Average_Exam_Score
FROM studentperformancefactors
GROUP BY Parental_Involvement
ORDER BY Average_Exam_Score DESC;
-- Does internet access improve exam performance?
SELECT Internet_Access,
       ROUND(AVG(Exam_Score),2) AS Average_Exam_Score
FROM studentperformancefactors
GROUP BY Internet_Access;
-- Which teacher quality produces the best average exam score?
SELECT Teacher_Quality,
       ROUND(AVG(Exam_Score),2) AS Average_Exam_Score
FROM studentperformancefactors
GROUP BY Teacher_Quality
ORDER BY Average_Exam_Score DESC;
 -- Which school type performs better?
SELECT School_Type,
       ROUND(AVG(Exam_Score),2) AS Average_Exam_Score
FROM studentperformancefactors
GROUP BY School_Type
ORDER BY Average_Exam_Score DESC;
-- Does sleep duration affect exam performance?
SELECT Sleep_Hours,
       ROUND(AVG(Exam_Score),2) AS Average_Exam_Score
FROM studentperformancefactors
GROUP BY Sleep_Hours
ORDER BY Sleep_Hours;
-- Which motivation level has the highest average attendance?
SELECT Motivation_Level,
       ROUND(AVG(Attendance),2) AS Average_Attendance
FROM studentperformancefactors
GROUP BY Motivation_Level
ORDER BY Average_Attendance DESC;
-- Which gender has the highest average exam score?
SELECT Gender,
       ROUND(AVG(Exam_Score),2) AS Average_Exam_Score
FROM studentperformancefactors
GROUP BY Gender
ORDER BY Average_Exam_Score DESC;
-- Top 10 students by exam score

SELECT *
FROM studentperformancefactors
ORDER BY Exam_Score DESC
LIMIT 10;
-- Top 10 students with highest attendance
SELECT *
FROM studentperformancefactors
ORDER BY Attendance DESC
LIMIT 10;
-- Students scoring above the overall average
SELECT *
FROM studentperformancefactors
WHERE Exam_Score >
(SELECT AVG(Exam_Score)
    FROM studentperformancefactors);
-- Students studying more than the average study hours
SELECT *
FROM studentperformancefactors
WHERE Hours_Studied >
(SELECT AVG(Hours_Studied)
    FROM studentperformancefactors);
-- Which parental involvement group has the highest average attendance?
SELECT Parental_Involvement,
       ROUND(AVG(Attendance),2) AS Average_Attendance
FROM studentperformancefactors
GROUP BY Parental_Involvement
ORDER BY Average_Attendance DESC;
-- Which school type has the highest average attendance?
SELECT School_Type,
       ROUND(AVG(Attendance),2) AS Average_Attendance
FROM studentperformancefactors
GROUP BY School_Type
ORDER BY Average_Attendance DESC;
-- How many students belong to each motivation level?
SELECT Motivation_Level,
       COUNT(*) AS Total_Students
FROM studentperformancefactors
GROUP BY Motivation_Level
ORDER BY Total_Students DESC;
-- How many students belong to each teacher quality category?
SELECT Teacher_Quality,
       COUNT(*) AS Total_Students
FROM studentperformancefactors
GROUP BY Teacher_Quality
ORDER BY Total_Students DESC;
-- What are the average study hours for each motivation level?
SELECT Motivation_Level,
       ROUND(AVG(Hours_Studied),2) AS Average_Hours_Studied
FROM studentperformancefactors
GROUP BY Motivation_Level
ORDER BY Average_Hours_Studied DESC;
-- Students eligible for Merit Scholarship
SELECT *
FROM studentperformancefactors
WHERE Exam_Score >= 90
AND Attendance >= 90;
-- Students who may need academic support
SELECT *
FROM studentperformancefactors
WHERE Attendance < 70
AND Exam_Score < 60;
-- Overall dataset summary

SELECT
    COUNT(*) AS Total_Students,
    ROUND(AVG(Exam_Score),2) AS Average_Exam_Score,
    ROUND(AVG(Attendance),2) AS Average_Attendance,
    ROUND(AVG(Hours_Studied),2) AS Average_Hours_Studied
FROM studentperformancefactors;

