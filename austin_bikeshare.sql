--joining 2 tables
SELECT 
  bt.start_station_name,
  SUM(bt.duration_minutes) AS total_duration,
  bs.address
FROM  `bigquery-public-data.austin_bikeshare.bikeshare_stations` bs 
RIGHT JOIN `bigquery-public-data.austin_bikeshare.bikeshare_trips` bt ON bs.station_id = bt.start_station_id
WHERE start_station_name = 'Pease Park'
GROUP BY 1, 3



--operations: total, avg, max, min, sum, per each station
--join columns: cs.station_id, cs.region_id, ct.start_station_id, ct.bikeid
--columns to use from cs table: cs.name, cs.region_id, SUM(cs.num_bikes_available)
--columns to use from ct table: ct.tripduration, COUNT(ct.start_station_id)
--SELECT * FROM `bigquery-public-data.new_york_citibike.citibike_stations` LIMIT 10
--SELECT * FROM `bigquery-public-data.new_york_citibike.citibike_trips` LIMIT 10

SELECT 
  cs.name AS station_name,
  cs.region_id,
  COUNT(ct.start_station_id) AS total_trips,
  SUM(ct.tripduration) AS total_trip_duration,
  AVG(ct.tripduration) AS average_trip_duration,
  MAX(ct.tripduration) AS maximum_trip_duration,
  MIN(ct.tripduration) AS minimum_trip_duration,
  AVG(cs.num_bikes_available) AS total_num_bikes_available
FROM `bigquery-public-data.new_york_citibike.citibike_stations` cs
LEFT JOIN `bigquery-public-data.new_york_citibike.citibike_trips` ct ON cs.station_id = ct.start_station_id
GROUP BY 1,2


--Show station with the biggest amount of trips

WITH bike_trips AS (
SELECT 
  cs.name AS station_name,
  cs.region_id,
  COUNT(ct.start_station_id) AS total_trips,
  SUM(ct.tripduration) AS total_trip_duration,
  AVG(ct.tripduration) AS average_trip_duration,
  MAX(ct.tripduration) AS maximum_trip_duration,
  MIN(ct.tripduration) AS minimum_trip_duration,
  AVG(cs.num_bikes_available) AS total_num_bikes_available
FROM `bigquery-public-data.new_york_citibike.citibike_stations` cs
LEFT JOIN `bigquery-public-data.new_york_citibike.citibike_trips` ct ON cs.station_id = ct.start_station_id
GROUP BY 1,2
)

SELECT 
  station_name,
  MAX(total_trips) AS maximum_total_trip
FROM bike_trips
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1  
