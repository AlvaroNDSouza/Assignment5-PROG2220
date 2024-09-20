SELECT '' AS 'Alvaro, de Souza';
SELECT '' AS 'Student Number : 8880494';
SELECT '' AS 'PROG2220: Section #6';
SELECT '' AS 'Assignment #5:';
SELECT SYSDATE() AS 'Current System Date';

USE swexpert;

SELECT '' AS '*** Task 2, Q1. ***';
-- Q1
SELECT 
    ROUND(AVG(score), 2) AS average_evaluation_score 
FROM evaluation e
JOIN consultant c ON e.evaluatee_id = c.c_id
WHERE CONCAT_WS(' ', c.c_first, c.c_last) = 'Janet Park';


SELECT '' AS '*** Task 2, Q2. ***';
-- Q2
SELECT 
    LPAD(project_consultant.p_id, LENGTH('project id'), ' ') AS project_id,
    LPAD(project_consultant.c_id, LENGTH('consultant id'), ' ') AS consultant_id,
    LPAD(TRUNCATE(DATEDIFF(roll_off_date, roll_on_date) / 30.4, 0), 10, ' ') AS months
FROM project_consultant;

SELECT '' AS '*** Task 2, Q3. ***';
-- Q3
SELECT 
    consultant_skill.c_id,
    LPAD(CONCAT(consultant.c_last, ', ', consultant.c_first), 20, ' ') AS consultant_full_name,
    consultant_skill.skill_id,
    CASE consultant_skill.certification 
        WHEN 'Y' THEN 'Certified'
        WHEN 'N' THEN 'Not Certified'
        ELSE 'Unknown'
    END AS certification_status
FROM consultant_skill
JOIN consultant ON consultant_skill.c_id = consultant.c_id;