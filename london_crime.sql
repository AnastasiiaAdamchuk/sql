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




