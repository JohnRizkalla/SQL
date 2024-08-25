SELECT
    job_title_short AS job_title,
    Round(AVG(salary_year_avg),0) AS avg_salary
FROM
    job_postings_fact
GROUP BY
    job_title_short
ORDER BY
    avg_salary DESC