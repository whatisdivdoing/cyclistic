/* Code for creating the column "ride_length" in the year2023 table
 * ride_length stores the duration of the rides in "TIME" dataype with the HH:MM:SS format
 * It happens in 2 steps : 
 * 		1. Adding a column using ALTER TABLE
 * 		2. Populating the column using TIMEDIFF function
 */
	-- Creating the column using "ADD" keyword
	ALTER TABLE divvy.year2023 
	ADD COLUMN ride_length TIME AFTER ended_at
	-- Populating the column using "UPDATE" and "SET" commands
	UPDATE IGNORE divvy.year2023 
	SET ride_length = TIMEDIFF(ended_at,started_at);
-- ..................................................................................................................

/* Code for creating the column "duration" in the year2023 table
 * duration stores the duration of the rides in seconds as "BIGINT" dataype */

	-- Creating the column using "ADD" keyword
	ALTER TABLE divvy.year2023 
	ADD COLUMN duration BIGINT AFTER ride_length
/* Setting the duration column for the year table
 * Since MySQL treats warnings as Errors, it won't populate the table unless the "IGNORE" keyword is used. 
 * */
UPDATE IGNORE divvy.year2023 
SET duration = TIME_TO_SEC(TIMEDIFF(ended_at, started_at)); 
-- ..................................................................................................................


/* Code for creating the COLUMN "day_of_week" which stores the day of the week
 * Data type would be VARCHAR(16)
 */
-- Creating the column
ALTER TABLE divvy.year2023 
ADD COLUMN day_of_week VARCHAR(10) AFTER duration
-- Populating the column
UPDATE divvy.year2023 
SET day_of_week = DAYNAME(started_at);  
-- ..................................................................................................................
