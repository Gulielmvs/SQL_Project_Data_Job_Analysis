/*
Question: What skills were most in demand for data engineers in 2023?
- Identify the top 5 most in-demand skills among Data Engineering job postings in 2023.
- Use all Data Engineering job postings with available skill information.
- Count the number of job postings requiring each skill and rank them by demand.
- Why? Identify the skills most frequently requested in the 2023 Data Engineering job market.
*/
SELECT sd.skills AS skill_name,
       COUNT(sjd.job_id) AS demand_count
FROM job_postings_fact jpf
INNER JOIN skills_job_dim sjd ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim sd ON sjd.skill_id = sd.skill_id
WHERE jpf.job_title_short = 'Data Engineer'
GROUP BY sd.skills
ORDER BY demand_count DESC
LIMIT 5;