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
  ct.bikeid,
  COUNT(ct.start_station_id) AS total_trips,
  SUM(ct.tripduration) AS total_trip_duration,
  AVG(ct.tripduration) AS average_trip_duration,
  MAX(ct.tripduration) AS maximum_trip_duration,
  MIN(ct.tripduration) AS minimum_trip_duration,
  SUM(cs.num_bikes_available) AS total_num_bikes_available,
FROM `bigquery-public-data.new_york_citibike.citibike_stations`
