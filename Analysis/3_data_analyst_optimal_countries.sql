SELECT
    job_country AS country,
    count(*) AS country_count,
    round(AVG(salary_year_avg),0) AS avg_salary
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
    AND (salary_year_avg, job_country) IS NOT NULL
GROUP BY
    country
HAVING
    count(*) > 9
ORDER BY
    country_count DESC