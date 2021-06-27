--What major and minor categories of crimes do we have?

SELECT 
  major_category,
  minor_category
FROM `bigquery-public-data.london_crime.crime_by_lsoa` 
GROUP BY 1, 2


--Show total number of crimes (major and minor) by year from largest to smallest.

SELECT
  major_category,
  minor_category,
  year,
  SUM(value) AS total_number_of_crimes
FROM `bigquery-public-data.london_crime.crime_by_lsoa` 
GROUP BY 1, 2, 3
ORDER BY 3 DESC


--When did we have the biggest amount of harassment?

--group number of crimes by category by year
WITH categories AS (
SELECT
  major_category,
  minor_category,
  year,
  SUM(value) AS total_number_of_crimes
FROM `bigquery-public-data.london_crime.crime_by_lsoa` 
GROUP BY 1, 2, 3
ORDER BY 3 DESC
)

--bigest amount of harassment
SELECT
  minor_category,
  year,
  total_number_of_crimes
FROM categories
WHERE minor_category = 'Harassment'
ORDER BY 3 DESC
LIMIT 1


--Show the year with smallest amount of crimes.

WITH categories AS (
SELECT
  major_category,
  minor_category,
  year,
  SUM(value) AS total_number_of_crimes
FROM `bigquery-public-data.london_crime.crime_by_lsoa` 
GROUP BY 1, 2, 3
ORDER BY 3 DESC
)

SELECT
  year,
  major_category,
  minor_category,
  total_number_of_crimes
FROM categories
ORDER BY 4 ASC
LIMIT 1



