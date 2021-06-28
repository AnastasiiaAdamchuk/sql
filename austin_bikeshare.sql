--joining 2 tables
SELECT 
  bt.start_station_name,
  SUM(bt.duration_minutes) AS total_duration,
  bs.address
FROM  `bigquery-public-data.austin_bikeshare.bikeshare_stations` bs 
RIGHT JOIN `bigquery-public-data.austin_bikeshare.bikeshare_trips` bt ON bs.station_id = bt.start_station_id
WHERE start_station_name = 'Pease Park'
GROUP BY 1, 3
