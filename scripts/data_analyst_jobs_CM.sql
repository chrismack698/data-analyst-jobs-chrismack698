-- 1. How many rows are in the data_analyst_jobs table?

SELECT COUNT (*) 
FROM data_analyst_jobs;

-- 2. Write a query to look at just the first 10 rows. 
-- What company is associated with the job posting on the 10th row?

SELECT *
FROM data_analyst_jobs
LIMIT 10;

-- 3. How many postings are in Tennessee? 
-- How many are there in either Tennessee or Kentucky?

SELECT COUNT(*)
FROM data_analyst_jobs
WHERE location = 'TN' OR location = 'KY';

-- 4. How many postings in Tennessee have a star rating above 4?

SELECT COUNT (*)
FROM data_analyst_jobs
WHERE location = 'TN' AND star_rating > 4;

-- 5. How many postings in the dataset have a review count between 500 and 1000?

SELECT COUNT (*)
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000;

-- 6. Show the average star rating for companies in each state. The output should show the state as state and the average rating for the state as avg_rating. 
-- Which state shows the highest average rating?

SELECT location AS state, ROUND(AVG(star_rating), 2) AS avg_rating
FROM data_analyst_jobs
WHERE location IS NOT NULL AND star_rating IS NOT NULL
GROUP BY state
ORDER BY avg_rating DESC;

-- 7. Select unique job titles from the data_analyst_jobs table. 

SELECT DISTINCT title
FROM data_analyst_jobs;

-- How many are there?

SELECT COUNT(DISTINCT title) AS unique_title_count
FROM data_analyst_jobs;

-- 8. How many unique job titles are there for California companies?

SELECT COUNT(DISTINCT title) AS california_distinct_title
FROM data_analyst_jobs
WHERE location = 'CA';

-- 9. Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. 

SELECT company AS name, ROUND(AVG(star_rating), 2) AS avg_rating
FROM data_analyst_jobs
WHERE review_count > 5000
GROUP BY name;

-- How many companies are there with more that 5000 reviews across all locations?
SELECT COUNT(*)
FROM data_analyst_jobs
WHERE review_count > 5000;

-- 10. Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?

SELECT company AS name, ROUND(AVG(star_rating), 2) AS avg_rating
FROM data_analyst_jobs
WHERE review_count > 5000
GROUP BY name
ORDER BY avg_rating DESC;

-- 11. Find all the job titles that contain the word 'Analyst.''

SELECT title
FROM data_analyst_jobs
WHERE title LIKE '%Analyst%';

-- How many different job titles are there?

SELECT COUNT(*)
FROM data_analyst_jobs
WHERE title LIKE '%Analyst%';

-- 12. How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’?

SELECT title
FROM data_analyst_jobs
WHERE title NOT LIKE '%Analyst%' AND title NOT LIKE '%Analytics%';

-- What word do these positions have in common?

-- 'Data.'

-- BONUS: You want to understand which jobs requiring SQL are hard to fill. Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks.

SELECT COUNT(title), domain AS industry
FROM data_analyst_jobs
WHERE days_since_posting > 21
AND skill LIKE '%SQL%'
AND domain IS NOT NULL
GROUP BY industry
ORDER BY count DESC;


