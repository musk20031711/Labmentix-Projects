USE uber;
SELECT Count(*) AS total_request
FROM uber;
SELECT Pickupoint, COUNT(*) AS num_requests
FROM uber
GROUP BY Pickupoint;
SELECT Pickupoint, Status, COUNT(*) AS num_requests
FROM uber
GROUP BY Pickupoint, Status
ORDER BY Pickupoint, Status;
SELECT 
  EXTRACT(HOUR FROM STR_TO_DATE(`Request timestamp`, '%d-%m-%Y %H:%i')) AS hour_of_day,
  COUNT(*) AS num_requests
FROM uber
GROUP BY hour_of_day
ORDER BY hour_of_day;
SELECT 
  Pickupoint,
  Status,
  COUNT(*) AS num_requests
FROM uber
GROUP BY Pickupoint, Status
ORDER BY Pickupoint, Status;
SELECT 
  Pickupoint,
  EXTRACT(HOUR FROM STR_TO_DATE(`Request timestamp`, '%d-%m-%Y %H:%i')) AS hour_of_day,
  COUNT(*) AS num_requests
FROM uber
GROUP BY Pickupoint, hour_of_day
ORDER BY Pickupoint, hour_of_day;
SELECT 
  ROUND(
    100 * SUM(CASE WHEN Status = 'Cancelled' THEN 1 ELSE 0 END) / COUNT(*),
    2
  ) AS cancellation_rate_percent
FROM uber;
SELECT 
  Pickupoint,
  COUNT(*) AS total_requests,
  SUM(CASE WHEN Status = 'Cancelled' THEN 1 ELSE 0 END) AS cancelled_requests,
  ROUND(
    100 * SUM(CASE WHEN Status = 'Cancelled' THEN 1 ELSE 0 END) / COUNT(*),
    2
  ) AS cancellation_rate_percent
FROM uber
GROUP BY Pickupoint;
SELECT 
  DATE(STR_TO_DATE(`Request timestamp`, '%d-%m-%Y %H:%i')) AS request_date,
  COUNT(*) AS num_requests
FROM uber
GROUP BY request_date
ORDER BY request_date;
SELECT 
  DATE(STR_TO_DATE(`Request timestamp`, '%d-%m-%Y %H:%i')) AS request_date,
  Status,
  COUNT(*) AS num_requests
FROM uber
GROUP BY request_date, Status
ORDER BY request_date, Status;
SELECT 
  DATE(STR_TO_DATE(`Request timestamp`, '%d-%m-%Y %H:%i')) AS request_date,
  COUNT(*) AS total_requests,
  SUM(CASE WHEN Status = 'Cancelled' THEN 1 ELSE 0 END) AS cancelled_requests,
  ROUND(
    100 * SUM(CASE WHEN Status = 'Cancelled' THEN 1 ELSE 0 END) / COUNT(*),
    2
  ) AS cancellation_rate_percent
FROM uber
GROUP BY request_date
ORDER BY request_date;
SELECT 
  DATE(STR_TO_DATE(`Request timestamp`, '%d-%m-%Y %H:%i')) AS request_date,
  Status,
  COUNT(*) AS num_requests
FROM uber
GROUP BY request_date, Status
ORDER BY request_date, Status;
SELECT 
  EXTRACT(HOUR FROM STR_TO_DATE(`Request timestamp`, '%d-%m-%Y %H:%i')) AS hour_of_day,
  COUNT(*) AS num_requests
FROM uber
GROUP BY hour_of_day
ORDER BY num_requests DESC
LIMIT 5;

SELECT 
  ROUND(AVG(`Trip Duration (min)`), 2) AS avg_trip_duration_minutes
FROM uber;
SELECT 
  Pickupoint,
  ROUND(AVG(`Trip Duration (min)`), 2) AS avg_trip_duration_minutes
FROM uber
GROUP BY Pickupoint
ORDER BY avg_trip_duration_minutes DESC;
SELECT 
  Status,
  ROUND(AVG(`Trip Duration (min)`), 2) AS avg_trip_duration_minutes,
  COUNT(*) AS trip_count
FROM uber
GROUP BY Status
ORDER BY avg_trip_duration_minutes DESC;
SELECT 
  CASE 
    WHEN `Trip Duration (min)` < 10 THEN 'Short (<10min)'
    WHEN `Trip Duration (min)` BETWEEN 10 AND 20 THEN 'Medium (10-20min)'
    ELSE 'Long (>20min)'
  END AS trip_duration_category,
  COUNT(*) AS num_trips
FROM uber
GROUP BY trip_duration_category
ORDER BY num_trips DESC;
SELECT 
  EXTRACT(HOUR FROM STR_TO_DATE(`Request timestamp`, '%d-%m-%Y %H:%i')) AS hour_of_day,
  ROUND(AVG(`Trip Duration (min)`), 2) AS avg_duration_min,
  COUNT(*) AS total_trips
FROM uber
GROUP BY hour_of_day
ORDER BY hour_of_day;
SELECT 
  EXTRACT(HOUR FROM STR_TO_DATE(`Request timestamp`, '%d-%m-%Y %H:%i')) AS hour_of_day,
  ROUND(AVG(`Trip Duration (min)`), 2) AS avg_duration_min,
  COUNT(*) AS total_trips
FROM uber
GROUP BY hour_of_day
ORDER BY avg_duration_min DESC
LIMIT 5;
SELECT 
  `Request id`,
  Pickupoint,
  `Request timestamp`,
  `Drop timestamp`,
  `Trip Duration (min)`
FROM uber
ORDER BY `Trip Duration (min)` DESC
LIMIT 5;
SELECT 
  Status,
  COUNT(*) AS total_trips,
  ROUND(AVG(`Trip Duration (min)`), 2) AS avg_trip_duration
FROM uber
GROUP BY Status;






















