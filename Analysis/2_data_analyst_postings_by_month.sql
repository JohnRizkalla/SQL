SELECT 
    TO_CHAR(job_posted_date, 'Mon') AS month, 
    count(job_title_short)
FROM job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
    AND date_part('year', job_posted_date) = 2023
GROUP BY MONTH