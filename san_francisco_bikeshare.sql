SELECT  FROM `bigquery-public-data.san_francisco_bikeshare.bikeshare_regions` LIMIT 10
SELECT  FROM `bigquery-public-data.san_francisco_bikeshare.bikeshare_station_info` LIMIT 10
SELECT  FROM `bigquery-public-data.san_francisco_bikeshare.bikeshare_trips` LIMIT 10
-- AVG, MIN, MAX, SUM(bt.duration_sec), COUNT(bt.trip_id) 
-- br `bigquery-public-data.san_francisco_bikeshare.bikeshare_regions` --> br.region_id, br.name AS region_name
-- bsi `bigquery-public-data.san_francisco_bikeshare.bikeshare_station_info` --> bsi.station_id, bsi.name AS station_name, bsi.region_id, bsi.lat, bsi.lon
-- bt `bigquery-public-data.san_francisco_bikeshare.bikeshare_trips` --> bt.start_station_id, bt.duration_sec, bt.trip_id, bt.subscriber_type
