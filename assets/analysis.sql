-- Route 51 weekday lateness by stop and time period
WITH events AS (
    SELECT
        se.route_number,
        se.location_id,
        se.gps_latitude,
        se.gps_longitude,
        CASE
            WHEN EXTRACT(HOUR FROM se.stop_time) BETWEEN 5 AND 9 THEN 'Morning'
            WHEN EXTRACT(HOUR FROM se.stop_time) BETWEEN 10 AND 14 THEN 'Midday'
            ELSE 'Afternoon/Night'
        END AS time_period,
        EXTRACT(EPOCH FROM (se.arrive_time - se.stop_time)) / 60.0 AS late_minutes,
        COALESCE(se.ons, 0) AS ons,
        COALESCE(se.offs, 0) AS offs,
        COALESCE(se.dwell, 0) AS dwell
    FROM stopevent se
    WHERE se.route_number = 51
      AND se.service_key = 'W'
      AND se.arrive_time IS NOT NULL
      AND se.stop_time IS NOT NULL
      AND se.location_id IS NOT NULL
      AND se.location_id <> 0
      AND se.gps_latitude IS NOT NULL
      AND se.gps_longitude IS NOT NULL
      AND ABS(EXTRACT(EPOCH FROM (se.arrive_time - se.stop_time)) / 60.0) <= 60
)
SELECT
    time_period,
    location_id,
    AVG(gps_latitude) AS lat,
    AVG(gps_longitude) AS lon,
    COUNT(*) AS stop_events,
    ROUND(AVG(late_minutes)::numeric, 2) AS avg_late_minutes,
    ROUND(PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY late_minutes)::numeric, 2) AS median_late_minutes,
    SUM(ons) AS total_ons,
    SUM(offs) AS total_offs,
    ROUND(AVG(dwell)::numeric, 1) AS avg_dwell
FROM events
GROUP BY time_period, location_id
HAVING COUNT(*) >= 1
ORDER BY time_period, avg_late_minutes DESC;

-- Highest-boarding observed trip from each of five routes
WITH trip_boardings AS (
    SELECT
        se.route_number,
        se.trip_number,
        SUM(COALESCE(se.ons, 0)) AS total_ons,
        COUNT(*) AS stop_events
    FROM stopevent se
    JOIN (
        SELECT DISTINCT trip_id
        FROM breadcrumb
    ) bc ON bc.trip_id = se.trip_number
    WHERE se.route_number IS NOT NULL
      AND se.trip_number IS NOT NULL
    GROUP BY se.route_number, se.trip_number
),
best_trip_per_route AS (
    SELECT DISTINCT ON (route_number)
        route_number,
        trip_number,
        total_ons,
        stop_events
    FROM trip_boardings
    ORDER BY route_number, total_ons DESC, stop_events DESC
)
SELECT *
FROM best_trip_per_route
ORDER BY total_ons DESC
LIMIT 5;
