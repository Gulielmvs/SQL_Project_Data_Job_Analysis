/*
Question: Which skills offered the best combination of demand and salary in 2023?
- Identify skills that were both frequently requested and associated with higher average salaries for Data Engineering roles in 2023.
- Focus on job postings with non-null salary information.
- Compare skill demand with average yearly salary to identify skills that performed strongly across both measures.
- Why? Identify skills that combined strong demand with higher average salaries,
    helping job seekers make informed decisions about their skill development.
*/ /*
--CTE
WITH skill_demand AS
    (SELECT sd.skill_id,
            sd.skills AS skill_name,
            COUNT(sjd.job_id) AS demand_count
     FROM job_postings_fact jpf
     INNER JOIN skills_job_dim sjd ON jpf.job_id = sjd.job_id
     INNER JOIN skills_dim sd ON sjd.skill_id = sd.skill_id
     WHERE jpf.job_title_short = 'Data Engineer'
         AND jpf.salary_year_avg IS NOT NULL
     GROUP BY sd.skill_id),
        skill_salary AS
    (SELECT sd.skill_id,
            sd.skills AS skill_name,
            ROUND(AVG(jpf.salary_year_avg), 2) AS average_salary
     FROM job_postings_fact jpf
     INNER JOIN skills_job_dim sjd ON jpf.job_id = sjd.job_id
     INNER JOIN skills_dim sd ON sjd.skill_id = sd.skill_id
     WHERE jpf.job_title_short = 'Data Engineer'
         AND jpf.salary_year_avg IS NOT NULL
     GROUP BY sd.skill_id)
SELECT skill_demand.skill_id,
       skill_demand.skill_name,
       skill_demand.demand_count,
       skill_salary.average_salary
FROM skill_demand
INNER JOIN skill_salary ON skill_demand.skill_id = skill_salary.skill_id
WHERE skill_demand.demand_count > 10
ORDER BY skill_salary.average_salary DESC,
         skill_demand.demand_count DESC
LIMIT 25;
*/
SELECT sd.skill_id,
       sd.skills AS skill_name,
       COUNT(sjd.job_id) AS demand_count,
       ROUND(AVG(jpf.salary_year_avg), 2) AS average_salary
FROM job_postings_fact jpf
INNER JOIN skills_job_dim sjd ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim sd ON sjd.skill_id = sd.skill_id
WHERE jpf.job_title_short = 'Data Engineer'
    AND jpf.salary_year_avg IS NOT NULL
GROUP BY sd.skill_id
HAVING COUNT(sjd.job_id) > 10
ORDER BY average_salary DESC,
         demand_count DESC
LIMIT 25;