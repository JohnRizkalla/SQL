# Overview

For SQL queries click here: [SQL queries](/Analysis/)

For SQl course click her [SQL Course](https://lukebarousse.com/sql)


# Tools I Used

- **SQL :**
- **PostgreSQL :**
- **Visual Studio Code :**
- **GitHub :**
- **Looker :**

# The Analysis

### 1. Data Jobs Avg. Salary

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


![](Images\1_Data_Jobs_Avg_Salary.png)

### 2. Data Analyst Postings by Month
### 3. Data Analyst Optimal Countries
### 4. Data Analyst Optimal Skills


# Insights
