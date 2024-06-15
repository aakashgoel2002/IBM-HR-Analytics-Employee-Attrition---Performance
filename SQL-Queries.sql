-- Q.1 Overall Attrition Rate
select Attrition, (COUNT(*)*100/(SELECT COUNT(*) FROM Employee)) AS 'AttritionRate(in %)'  from employee Group by Attrition;

-- Q.2 Attrition Rate By Age Group
SElECT 
CASE
	WHEN Age BETWEEN 10 AND 20 THEN '10-20'
    WHEN Age BETWEEN 21 AND 30 THEN '21-30'
    WHEN Age BETWEEN 31 AND 40 THEN '31-40'
    WHEN Age BETWEEN 41 AND 50 THEN '41-50'
    WHEN Age BETWEEN 51 AND 60 THEN '51-60'
END AS AgeGroup, 
Attrition, 
(Count(*)*100 / (SELECT COUNT(*) from Employee)) AS 'AttritionRate(in %)' from employee
GROUP BY CASE
    WHEN Age BETWEEN 10 AND 20 THEN '10-20'
    WHEN Age BETWEEN 21 AND 30 THEN '21-30'
    WHEN Age BETWEEN 31 AND 40 THEN '31-40'
    WHEN Age BETWEEN 41 AND 50 THEN '41-50'
    WHEN Age BETWEEN 51 AND 60 THEN '51-60'
END, Attrition
ORDER BY AgeGroup ASC, Attrition DESC;

-- Q.3 Attrition By Gender
SELECT Gender,Attrition,(COUNT(*)*100/(SELECT COUNT(*) From employee)) AS 'AttritionRate(in %)' from employee GROUP BY Gender, Attrition Order By Gender DESC, Attrition DESC;

-- Q.4 Attrition By Job Role
SELECT JobRole, Attrition, (COUNT(*)*100/(SELECT COUNT(*) from employee)) AS AttritionRate from employee group by JobRole, Attrition order by AttritionRate desc, JobRole asc;

-- Q.5 Average Monthly Income by Education and Attrition
SELECT Education, Attrition, AVG(MonthlyIncome) from employee GROUP BY Education, Attrition order by Education asc, Attrition desc;

-- Q.6 Distance from Home by Job Role and Attrition
SELECT DistanceFromHome, JobRole, Attrition from employee GROUP BY DistanceFromHome, JobRole, Attrition order by DistanceFromHome desc, Attrition desc;

-- Q.7 Correlation between Performance Rating and Attrition
SELECT PerformanceRating, Attrition, (COUNT(*)*100/(SELECT COUNT(*) FROM Employee)) AS 'Attrition Rate(in %)'from employee GROUP BY PerformanceRating, Attrition order by PerformanceRating asc, Attrition desc;

-- Q.8 Job Satisfaction Impact on Attrition
SELECT EnvironmentSatisfaction, Attrition, (COUNT(*)*100/(SELECT COUNT(*) FROM Employee)) AS 'Attrition Rate(in %)'from employee GROUP BY EnvironmentSatisfaction, Attrition order by EnvironmentSatisfaction asc, Attrition desc;

-- Q.9 Work-Life Balance Impact on Attrition
SELECT WorkLifeBalance, Attrition, (COUNT(*)*100/(SELECT COUNT(*) FROM Employee)) AS 'Attrition Rate(in %)'from employee GROUP BY WorkLifeBalance, Attrition order by WorkLifeBalance asc, Attrition desc;

-- Q.10 Average Years at Company for Employees who Left vs. Stayed
SELECT Attrition, AVG(YearsAtCompany) from employee group by Attrition;

-- Q.11 Analyze the environment satisfaction levels among employees who left versus those who stayed.
SELECT EnvironmentSatisfaction, Attrition, (count(*)*100/(Select COUNT(*) from employee)) As attritionRate from employee group by EnvironmentSatisfaction, Attrition;

-- Q.12 Is there a difference in training participation between employees who left and those who stayed?
SELECT Attrition, avg(TrainingTimesLastYear) from employee group by Attrition;
