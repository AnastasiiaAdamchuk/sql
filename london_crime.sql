--What categories of crimes do we have?

SELECT 
  DISTINCT major_category AS categories
FROM `bigquery-public-data.london_crime.crime_by_lsoa` 


