/*
Question: What were the top-paying data engineering jobs in 2023?
- Identify the 10 highest-paying Data Engineering job postings from 2023.
- Focus on job postings with non-null salary information.
- Order the postings by average yearly salary, from highest to lowest.
- Why? Highlight the highest-paying opportunities for Data Engineers
    and provide insights into the salary landscape of the 2023 job market.
*/
SELECT jpf.job_id,
       jpf.job_title,
       cd.name AS company_name,
       jpf.job_location,
       jpf.job_schedule_type,
       jpf.salary_year_avg,
       jpf.job_posted_date
FROM job_postings_fact jpf
LEFT JOIN company_dim cd ON jpf.company_id = cd.company_id
WHERE jpf.job_title_short = 'Data Engineer'
    AND jpf.salary_year_avg IS NOT NULL
ORDER BY jpf.salary_year_avg DESC,
         jpf.job_id
LIMIT 10;