/* 
SQL Analysis on City bike trips
Dataset:  bigquery-public-data.new_york_citibike.citibike_trips
*/

--How many trips do we have in total?
SELECT 
    COUNT(start_station_id) AS total_trips  
FROM `bigquery-public-data.new_york_citibike.citibike_trips`
 
 
--How many trips do we have per user type subscriber?
SELECT 
    COUNT(start_station_id) AS total_trips
FROM `bigquery-public-data.new_york_citibike.citibike_trips` 
WHERE usertype = 'Subscriber'


--Show TOP 10 trips per station from largest to smallest.
SELECT 
    start_station_name,
    COUNT(start_station_id) as total_trips
FROM `bigquery-public-data.new_york_citibike.citibike_trips` 
GROUP BY 1
ORDER BY 2 DESC 
LIMIT 10


--How many trips started from Lexington Ave & E 29 St station?
SELECT 
    COUNT(start_station_name) AS total_trips  
FROM `bigquery-public-data.new_york_citibike.citibike_trips` 
WHERE start_station_name = 'Lexington Ave & E 29 St'
 

--Who made more trips male or female in total?
SELECT 
    gender,
    COUNT(start_station_id) AS total_trips,      
FROM `bigquery-public-data.new_york_citibike.citibike_trips` 
WHERE gender IN ('male', 'female')  
GROUP BY 1


--How many trips were started by people who were born in 1997? 
SELECT 
    COUNT(start_station_id) 
FROM `bigquery-public-data.new_york_citibike.citibike_trips` 
WHERE birth_year = 1997


--Show total trip duration for all stations. Order results from largest to smallest.
SELECT 
    start_station_name,
    SUM(tripduration) AS total_trip_duration,     
FROM `bigquery-public-data.new_york_citibike.citibike_trips` 
GROUP BY 1
ORDER BY 1 DESC


--Show total trips and total trip duration for the following stations: Washington Pl & Broadway AND W 42 St 8 Ave AND Pershing Square N.
SELECT start_station_name,
       COUNT(start_station_id) AS total_trips,
       SUM(tripduration) AS total_trip_duration
FROM `bigquery-public-data.new_york_citibike.citibike_trips` 
WHERE start_station_name IN ('Washington Pl & Broadway', 'W 42 St & 8 Ave', 'Pershing Square N')
GROUP BY start_station_name
