--tables:
--SELECT  FROM `bigquery-public-data.san_francisco_bikeshare.bikeshare_regions` LIMIT 10
--SELECT  FROM `bigquery-public-data.san_francisco_bikeshare.bikeshare_station_info` LIMIT 10
--SELECT  FROM `bigquery-public-data.san_francisco_bikeshare.bikeshare_trips` LIMIT 10

-- measures and dimentions:
-- AVG, MIN, MAX, SUM(bt.duration_sec), COUNT(bt.trip_id) 
-- br `bigquery-public-data.san_francisco_bikeshare.bikeshare_regions` --> br.region_id, br.name AS region_name
-- bsi `bigquery-public-data.san_francisco_bikeshare.bikeshare_station_info` --> bsi.station_id, bsi.name AS station_name, bsi.region_id, bsi.lat, bsi.lon
-- bt `bigquery-public-data.san_francisco_bikeshare.bikeshare_trips` --> bt.start_station_id, bt.duration_sec, bt.trip_id, bt.subscriber_type

SELECT 
  bsi.name AS station_name,
  br.name AS region_name,
  bsi.lat,
  bsi.lon,
  bt.subscriber_type,
  COUNT(bt.trip_id) AS total_trips,
  SUM(bt.duration_sec) AS total_trip_duration,
  AVG(bt.duration_sec) AS average_trip_duration,
  MIN(bt.duration_sec) AS minimum_trip_duration,
  MAX(bt.duration_sec) AS maximum_trip_duration
FROM `bigquery-public-data.san_francisco_bikeshare.bikeshare_trips` bt 
  LEFT JOIN `bigquery-public-data.san_francisco_bikeshare.bikeshare_station_info` bsi ON bt.start_station_id = bsi.station_id
  LEFT JOIN `bigquery-public-data.san_francisco_bikeshare.bikeshare_regions` br ON br.region_id = bsi.region_id
GROUP BY 1, 2, 3, 4, 5
