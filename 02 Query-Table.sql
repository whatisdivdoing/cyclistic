
/* COUNTING the rides in 2023
 * 			1. Non-Zero Rides
 * 			2. Rides where duration >1 grouped by memeber_casual
 * 			3. Rides grouped by month
 * 			4. 
 */
-- count all rides
	SELECT 
		COUNT(ride_id) 
	FROM 
		divvy.year2023;
	-- non-zero rides
	SELECT 
		COUNT(ride_id) 
	FROM 
		divvy.year2023
	WHERE duration > 0;
	-- rides less than 1, grouped by member_casual
	SELECT 
		member_casual ,
		COUNT(ride_id) 
	FROM 
		divvy.year2023
	WHERE duration < 1
	GROUP BY member_casual;
	-- grouped by the month 
SELECT 
	MONTH(started_at),	
	COUNT(ride_id) AS rides_per_month
FROM divvy.year2023 y
GROUP BY MONTH(started_at);
	-- grouped by member casual and month
	SELECT 
		member_casual ,
		MONTH(started_at),	
		COUNT(ride_id) AS rides_per_month
	FROM divvy.year2023
	GROUP BY member_casual, MONTH(started_at);
	-- grouped by day of the week
	SELECT
		member_casual ,
		day_of_week,
		COUNT(ride_id) AS rides_by_weekday 
	FROM divvy.year2023
	GROUP BY
		member_casual , day_of_week ;
	-- grouped by the start time of the ride - HOURS and MINUTES
		SELECT 
			member_casual ,
			TIME_FORMAT(started_at,'%H:%i') AS start_time,
			COUNT(ride_id) AS rides_by_hour_mins
		FROM divvy.year2023 
		GROUP BY
			member_casual, start_time;
	-- grouped by the start time of the ride - Only HOURS
		SELECT 
			member_casual ,
			HOUR(started_at) AS start_hour,
			COUNT(ride_id) AS num_rides
		FROM divvy.year2023 y 
		GROUP BY
			member_casual , start_hour;
	-- grouped by type of bike
		SELECT
			member_casual,
			rideable_type,
			COUNT(ride_id)
		FROM divvy.year2023 y
		GROUP BY
			member_casual,rideable_type;
	-- TOP 20 stations {Start/End},{member/Casual}
		SELECT DISTINCT 
			COUNT(ride_id) AS freq,	
			start_station_name
		FROM divvy.year2023 
		WHERE member_casual = "casual"
		GROUP BY start_station_name
		ORDER BY freq DESC 
		LIMIT 20;
		
-- ...............................................................


/* SUM OF : 
 * 		1. ride time, grouped by rider_type, excluding the rides where duration is negative
 * 		2.  	
 */ 
	-- sum of ride time, by member/casual in seconds
	SELECT
		member_casual ,
		SUM(duration)
	FROM divvy.year2023 y 
	WHERE duration > 0
	GROUP BY member_casual ;



/* AVERAGE OF : 
* 		1. RIDE TIME by memeber_casual
*/
	
	-- AVERAGE/MEAN ride duration by member_casual
	SELECT 
			member_casual ,
			AVG(duration)
	FROM divvy.year2023 y 
	WHERE duration > 0
	GROUP BY member_casual ;
-- AVERAGE/MEAN ride duration across the months Grouped by member_casual
	SELECT 
			member_casual ,
			MONTH(started_at) AS mon,
			AVG(duration)/60 AS avg_trip_duration_mins
	FROM divvy.year2023 y 
	WHERE duration > 0 AND rideable_type <> "docked_bike"
	GROUP BY member_casual, mon;
	-- Mean ride duration grouped by ride_able type
		SELECT 
		member_casual,
		rideable_type ,
		AVG(duration) AS avg_in_sec,
		AVG(duration)/60 AS avg_in_min
		FROM divvy.year2023 y 
		GROUP BY 
			rideable_type, member_casual ; 
-- AVERAGE/MEAN ride duration across the WEEKDAYS Grouped by member_casual
	SELECT 
			member_casual ,
			day_of_week,
			AVG(duration)/60 AS avg_trip_duration_mins
	FROM divvy.year2023 y 
	WHERE duration > 0 AND rideable_type <> "docked_bike"
	GROUP BY member_casual, day_of_week ;
	
-- Extra Queries
	
	-- grouped by member_casual and day_of_week
		SELECT 
		member_casual ,
		MONTH(started_at),	
		day_of_week,
		COUNT(ride_id) AS rides_per_month
		FROM divvy.year2023 y
		GROUP BY member_casual, MONTH(started_at), day_of_week ;
	