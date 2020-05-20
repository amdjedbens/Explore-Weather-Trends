/* This .sql file contains all the commands and processes used to extract the relevant
data from the Database provided by udacity's project portal.

I am from Algeria. I have chosen Algiers for Analysis.
*/

-- STEP 1 (To see which cities are available for "Algeria" in the given dataset)
SELECT *
	FROM city_list
    WHERE country LIKE 'Algeria'
-- So I have chosen "Algiers", the only available city in the actual moment.


-- STEP 2
/* I found from the SCHEMA that both city_data and global_data contains 
same column named 'avg_temp'. So I have changed the names of the columns respectively
in order to extract the joined table */
ALTER TABLE city_data RENAME COLUMN avg_temp to CAT;        -- CAT = City Average Temp.
ALTER TABLE global_data RENAME COLUMN avg_temp to GAT;      -- GAT = Global Avg. Temp.


-- STEP 3 (Extraction)
SELECT global_data.year, global_data.GAT, city_data.CAT
FROM global_data JOIN city_data         -- Joining the two tables
ON global_data.year = city_data.year    -- reference for joining
WHERE city LIKE 'Algiers';

-- So I got the data with 3 columns and a download as CSV file option.
-- downloaded as results.csv