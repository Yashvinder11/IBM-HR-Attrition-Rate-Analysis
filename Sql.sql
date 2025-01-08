CREATE database IBM;
Use IBM;

Select * from ibmhr;


-- a) Overall Attrition Rate:

SELECT 
    (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS AttritionRate
FROM 
    ibmhr;
/* Insight: This will give the overall percentage of employees leaving the company, which is essential to know at a broad level.*/

-- b) Attrition by Job Role:
SELECT 
    JobRole, 
    (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS AttritionRate
FROM 
    ibmhr
GROUP BY 
    JobRole;

/*Insight: Identify which roles have higher attrition rates and may require attention*/

-- c) Monthly Income and Attrition:
SELECT 
    Attrition, 
    AVG(MonthlyIncome) AS AvgMonthlyIncome
FROM 
    ibmhr
GROUP BY 
    Attrition;

/*Insight: Employees with lower monthly income might have a higher attrition rate.*/

-- d) Attrition Based on OverTime:
SELECT 
    OverTime, 
    (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS AttritionRate
FROM 
    ibmhr
GROUP BY 
    OverTime;

/*Insight: Employees working overtime may have higher attrition rates due to burnout.*/

-- e) Performance Rating and Attrition:
SELECT 
    PerformanceRating, 
    (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS AttritionRate
FROM 
    ibmhr
GROUP BY 
    PerformanceRating;
    
/*Insight: Performance impacts attrition, which can suggest that high-performers or low-performers are more likely to leave.*/

