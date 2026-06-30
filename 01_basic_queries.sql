USE student_analytics_db;

-- Total number of students
SELECT COUNT(*) AS Total_Students
FROM studentperformancefactors;

-- Average exam score
SELECT AVG(Exam_Score) AS Average_Exam_Score
FROM studentperformancefactors;

-- Highest exam score
SELECT MAX(Exam_Score) AS Highest_Exam_Score
FROM studentperformancefactors;

-- Lowest exam score
SELECT MIN(Exam_Score) AS Lowest_Exam_Score
FROM studentperformancefactors;

-- Highest attendance
SELECT MAX(Attendance) AS Highest_Attendance
FROM studentperformancefactors;

-- Average hours studied
SELECT AVG(Hours_Studied) AS Average_Hours_Studied
FROM studentperformancefactors;

-- Students who scored above 90
SELECT *
FROM studentperformancefactors
WHERE Exam_Score > 90;

-- Students who studied more than 30 hours
SELECT *
FROM studentperformancefactors
WHERE Hours_Studied > 30;

-- Students with high parental involvement
SELECT *
FROM studentperformancefactors
WHERE Parental_Involvement = 'High';

-- Top 10 highest scoring students
SELECT *
FROM studentperformancefactors
ORDER BY Exam_Score DESC
LIMIT 10;

-- Bottom 10 students
SELECT *
FROM studentperformancefactors
ORDER BY Exam_Score ASC
LIMIT 10;

-- Top 10 students by attendance
SELECT *
FROM studentperformancefactors
ORDER BY Attendance DESC
LIMIT 10;

-- Bottom 10 students by attendance
SELECT *
FROM studentperformancefactors
ORDER BY Attendance ASC
LIMIT 10;

-- Average score by motivation level
SELECT Motivation_Level,
       AVG(Exam_Score) AS Average_Exam_Score
FROM studentperformancefactors
GROUP BY Motivation_Level;

-- Average score by parental involvement
SELECT Parental_Involvement,
       AVG(Exam_Score) AS Average_Exam_Score
FROM studentperformancefactors
GROUP BY Parental_Involvement;

-- Average score by internet access
SELECT Internet_Access,
       AVG(Exam_Score) AS Average_Exam_Score
FROM studentperformancefactors
GROUP BY Internet_Access;

-- Average score by teacher quality
SELECT Teacher_Quality,
       AVG(Exam_Score) AS Average_Exam_Score
FROM studentperformancefactors
GROUP BY Teacher_Quality;

-- Average score by school type
SELECT School_Type,
       AVG(Exam_Score) AS Average_Exam_Score
FROM studentperformancefactors
GROUP BY School_Type;

-- Average score by sleep hours
SELECT Sleep_Hours,
       AVG(Exam_Score) AS Average_Exam_Score
FROM studentperformancefactors
GROUP BY Sleep_Hours
ORDER BY Sleep_Hours;

-- Average score by gender
SELECT Gender,
       AVG(Exam_Score) AS Average_Exam_Score
FROM studentperformancefactors
GROUP BY Gender;

-- Average attendance by gender
SELECT Gender,
       AVG(Attendance) AS Average_Attendance
FROM studentperformancefactors
GROUP BY Gender;

-- Average attendance by school type
SELECT School_Type,
       AVG(Attendance) AS Average_Attendance
FROM studentperformancefactors
GROUP BY School_Type;

-- Average attendance by teacher quality
SELECT Teacher_Quality,
       AVG(Attendance) AS Average_Attendance
FROM studentperformancefactors
GROUP BY Teacher_Quality;

-- Students scoring above average
SELECT *
FROM studentperformancefactors
WHERE Exam_Score >
(
    SELECT AVG(Exam_Score)
    FROM studentperformancefactors
);

-- Students studying below average
SELECT *
FROM studentperformancefactors
WHERE Hours_Studied <
(
    SELECT AVG(Hours_Studied)
    FROM studentperformancefactors
);

-- Top 20 students by attendance
SELECT *
FROM studentperformancefactors
ORDER BY Attendance DESC
LIMIT 20;
-- Students with attendance between 80 and 90
SELECT *
FROM studentperformancefactors
WHERE Attendance BETWEEN 80 AND 90;

-- Students with exam score between 70 and 85
SELECT *
FROM studentperformancefactors
WHERE Exam_Score BETWEEN 70 AND 85;

-- Students with low or medium motivation
SELECT *
FROM studentperformancefactors
WHERE Motivation_Level IN ('Low', 'Medium');

-- Students with high motivation only
SELECT *
FROM studentperformancefactors
WHERE Motivation_Level NOT IN ('Low', 'Medium');

-- Students having internet access and high parental involvement
SELECT *
FROM studentperformancefactors
WHERE Internet_Access = 'Yes'
AND Parental_Involvement = 'High';

-- Students with high motivation or high teacher quality
SELECT *
FROM studentperformancefactors
WHERE Motivation_Level = 'High'
OR Teacher_Quality = 'High';

-- Students whose school type starts with 'P'
SELECT *
FROM studentperformancefactors
WHERE School_Type LIKE 'P%';

-- Students whose school type ends with 'e'
SELECT *
FROM studentperformancefactors
WHERE School_Type LIKE '%e';

-- Distinct school types
SELECT DISTINCT School_Type
FROM studentperformancefactors;

-- Distinct motivation levels
SELECT DISTINCT Motivation_Level
FROM studentperformancefactors;



-- Motivation levels with average score above 67
SELECT Motivation_Level,
       AVG(Exam_Score) AS Average_Exam_Score
FROM studentperformancefactors
GROUP BY Motivation_Level
HAVING AVG(Exam_Score) > 67;

-- Teacher quality with average attendance above 80
SELECT Teacher_Quality,
       AVG(Attendance) AS Average_Attendance
FROM studentperformancefactors
GROUP BY Teacher_Quality
HAVING AVG(Attendance) > 80;

-- School types with more than 3000 students
SELECT School_Type,
       COUNT(*) AS Total_Students
FROM studentperformancefactors
GROUP BY School_Type
HAVING COUNT(*) > 3000;



-- Performance category based on exam score
SELECT Exam_Score,
CASE
    WHEN Exam_Score >= 90 THEN 'Excellent'
    WHEN Exam_Score >= 75 THEN 'Good'
    WHEN Exam_Score >= 60 THEN 'Average'
    ELSE 'Needs Improvement'
END AS Performance
FROM studentperformancefactors;

-- Attendance category
SELECT Attendance,
CASE
    WHEN Attendance >= 90 THEN 'Excellent'
    WHEN Attendance >= 80 THEN 'Good'
    ELSE 'Low'
END AS Attendance_Category
FROM studentperformancefactors;



-- Convert gender to uppercase
SELECT UPPER(Gender) AS Gender_Uppercase
FROM studentperformancefactors;

-- Convert motivation level to lowercase
SELECT LOWER(Motivation_Level) AS Motivation_Lowercase
FROM studentperformancefactors;

-- Length of school type
SELECT School_Type,
       LENGTH(School_Type) AS Name_Length
FROM studentperformancefactors;

-- Combine gender and school type
SELECT CONCAT(Gender,' - ',School_Type) AS Student_Category
FROM studentperformancefactors;



-- Rounded average exam score
SELECT ROUND(AVG(Exam_Score),2) AS Average_Exam_Score
FROM studentperformancefactors;

-- Rounded average attendance
SELECT ROUND(AVG(Attendance),2) AS Average_Attendance
FROM studentperformancefactors;

-- Ceiling of average study hours
SELECT CEIL(AVG(Hours_Studied)) AS Rounded_Up_Hours
FROM studentperformancefactors;

-- Floor of average study hours
SELECT FLOOR(AVG(Hours_Studied)) AS Rounded_Down_Hours
FROM studentperformancefactors;



-- Students scoring above average with high attendance
SELECT *
FROM studentperformancefactors
WHERE Exam_Score >
(
    SELECT AVG(Exam_Score)
    FROM studentperformancefactors
)
AND Attendance > 90;

-- Average score by internet access
SELECT Internet_Access,
       ROUND(AVG(Exam_Score),2) AS Average_Exam_Score
FROM studentperformancefactors
GROUP BY Internet_Access
ORDER BY Average_Exam_Score DESC;

-- Average score by teacher quality
SELECT Teacher_Quality,
       ROUND(AVG(Exam_Score),2) AS Average_Exam_Score
FROM studentperformancefactors
GROUP BY Teacher_Quality
ORDER BY Average_Exam_Score DESC;

-- Top 5 students by exam score
SELECT *
FROM studentperformancefactors
ORDER BY Exam_Score DESC
LIMIT 5;

-- Bottom 5 students by exam score
SELECT *
FROM studentperformancefactors
ORDER BY Exam_Score ASC
LIMIT 5;
SELECT
    ROUND(AVG(Exam_Score),2) AS Average_Exam_Score,
    MAX(Exam_Score) AS Highest_Exam_Score,
    MIN(Exam_Score) AS Lowest_Exam_Score,
    ROUND(AVG(Attendance),2) AS Average_Attendance
FROM studentperformancefactors;
SHOW COLUMNS
FROM studentperformancefactors;
SELECT *
FROM studentperformancefactors
ORDER BY Exam_Score DESC
LIMIT 10;
SELECT
Exam_Score,
CASE
    WHEN Exam_Score >=90 THEN 'Excellent'
    WHEN Exam_Score >=75 THEN 'Good'
    WHEN Exam_Score >=60 THEN 'Average'
    ELSE 'Needs Improvement'
END AS Performance
FROM studentperformancefactors;