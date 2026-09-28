/*
Question: Which skills were associated with higher salaries in 2023?
- Calculate the average yearly salary associated with each skill across Data Engineering job postings in 2023.
- Focus on job postings with non-null salary information.
- Order skills by their average yearly salary.
- Why? Identify which skills were associated with higher average salaries in the 2023 Data Engineering job market,
    helping job seekers understand which skills appeared more frequently in higher-paying opportunities.
*/
SELECT sd.skills AS skill_name,
       ROUND(AVG(jpf.salary_year_avg), 2) AS average_salary
FROM job_postings_fact jpf
INNER JOIN skills_job_dim sjd ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim sd ON sjd.skill_id = sd.skill_id
WHERE jpf.job_title_short = 'Data Engineer'
    AND jpf.salary_year_avg IS NOT NULL
GROUP BY sd.skills
ORDER BY average_salary DESC
LIMIT 25;