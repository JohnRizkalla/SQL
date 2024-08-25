# Overview

An Analysis made on data jobs and focused on Data Analyst role.

For SQL queries click here: [SQL queries](/Analysis/).

For data source & data load code click her [SQL CSVs](https://drive.google.com/drive/folders/1moeWYoUtUklJO6NJdWo9OV8zWjRn0rjN).

 If you want a recap on SQL queries or you are a beginner I highly recommend you to check this 4 hours course [SQL Course](https://lukebarousse.com/sql) prepared by [Luke Barousse](https://www.linkedin.com/in/luke-b/) & [Kelly Adams](https://www.linkedin.com/in/kellyjianadams/)


# Tools I Used

- **PostgreSQL :** For creating the database
- **Visual Studio Code :** Code editor and queries execution
- **GitHub :** Sharing the code & the analysis
- **Looker :** Data visualization

# The Analysis

### 1. Data Jobs Avg. Salary

An overview of all titles avg. year salary to know what is the Data Analyst rank.

```sql
SELECT 
    job_title_short AS job_title,
    Round(AVG(salary_year_avg),0) AS avg_salary
FROM 
    job_postings_fact
GROUP BY 
    job_title_short
ORDER BY 
    avg_salary DESC
```


![](Images/1_Data_Jobs_Avg_Salary.png)

### 2. Data Analyst Postings by Month

An overview of Data Analyst job postings across year 2023 to determine the trend and which months have the most postings.

```sql
SELECT
    TO_CHAR(job_posted_date, 'Mon') AS month,
    count(job_title_short)
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
    AND date_part('year', job_posted_date) = 2023
GROUP BY
    MONTH
```


![](Images/2_Data_Analyst_Postings_by_Month.png)


### 3. Data Analyst Optimal Countries

A query done for the count of job postings & the avg. year salary both per country to determine which counties have the highest job postings and having a relatively high salary.

```sql
SELECT
    job_country AS country,
    count(*) AS country_count,
    round(AVG(salary_year_avg),0) AS avg_salary
FROM job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
    AND (salary_year_avg, job_country) IS NOT NULL
GROUP BY
    country
HAVING
    count(*) > 9
ORDER BY
    country_count DESC
```


![](Images/3_Data_Analyst_Optimal_Countries.png)


### 4. Data Analyst Optimal Skills

A query done for the count of skills & the avg. year salary both for Data Analyst to determine which skills have the highest demand and having a relatively high salary.

```sql
SELECT
    skills,
    count(*) AS skill_count,
    round(avg(salary_year_avg), 0) AS avg_salary
FROM
    job_postings_fact
INNER JOIN
    skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_schedule_type Like '%Full%'
GROUP BY
    skills
HAVING
    count(*) > 99
ORDER BY
    skill_count DESC
```


![](Images/4_Data_Analyst_Optimal_Skills.png)


# Insights

#### 1. Sr. Data Analyst salaries ranked almost at the center for data jobs which is good but if you want more salary you might consider Data Scientist or Data Engineer roles.
#### 2. January won the jackpot for acquiring the highest postings for Data Analyst jobs so you need to focus on its postings just a little more than other months.
#### 3. In the United States you have a very high chance of acquiring a Data Analyst job with a relatively high salary as it has the highest Data Analyst postings, next to it you can search in Sudan, India & UK on the other hand you got Thailand, Greece & South Korea with the highest salaries but low job postings.
#### 4. SQL, Python, Excel, Tableau, R & Power BI are the most demanded skills and having relatively high salaries so those are must to learn if you want a successful career as a Data Analyst.
