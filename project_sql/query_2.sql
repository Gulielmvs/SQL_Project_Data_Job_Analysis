/*
Question: What skills were required for the top-paying data engineering jobs in 2023?
- Use the 10 highest-paying Data Engineering job postings identified in the previous query (query_1).
- Identify the specific skills required for each of these job postings.
- Why? Provide a detailed view of the skills required by the highest-paying Data Engineering positions,
    helping aspiring Data Engineers understand which skills were associated with higher salaries in 2023.
*/ WITH top_paying_jobs AS
    (SELECT jpf.job_id,
            jpf.job_title,
            cd.name AS company_name,
            jpf.salary_year_avg,
            jpf.job_posted_date
     FROM job_postings_fact jpf
     LEFT JOIN company_dim cd ON jpf.company_id = cd.company_id
     WHERE jpf.job_title_short = 'Data Engineer'
         AND jpf.salary_year_avg IS NOT NULL
     ORDER BY jpf.salary_year_avg DESC,
              jpf.job_id
     LIMIT 10)
SELECT top_paying_jobs.*,
       sd.skills AS skill_name
FROM top_paying_jobs
INNER JOIN skills_job_dim sjd ON top_paying_jobs.job_id = sjd.job_id
INNER JOIN skills_dim sd ON sjd.skill_id = sd.skill_id
ORDER BY top_paying_jobs.salary_year_avg DESC;