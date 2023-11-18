-- CREATE DATABASE EEG;
USE EEG;

-- Import data base from MySQL Workbench

SELECT *
FROM alcoholics
-- How many channels there are per pacient?

SELECT `trial number`, `sensor position`, COUNT(channel) AS channel_records, name
FROM alcoholics 
GROUP BY `trial number`, `sensor position`, `name`;


SELECT `trial number`, COUNT(DISTINCT(`sensor position`)) AS total_sensor_positions, COUNT(channel) AS total_channels
FROM alcoholics 
GROUP BY `trial number`;

-- How many channels there are per pacient?

SELECT `trial number`, `sensor position`, COUNT(channel) AS channel_records, name
FROM controls 
GROUP BY `trial number`, `sensor position`, `name`;


SELECT `trial number`, COUNT(DISTINCT(`sensor position`)) AS total_sensor_positions, COUNT(channel) AS total_channels
FROM controls 
GROUP BY `trial number`;

-- How much time is recorded in in eeg file per pacient?
SELECT `trial number`, COUNT(channel) AS total_channels, ((SUM(`time`*0.001)/ COUNT(channel)))/ COUNT(DISTINCT(`sensor position`))  AS seconds_records
FROM alcoholics 
GROUP BY `trial number`;

SELECT `trial number`, COUNT(channel) AS total_channels, ((SUM(`time`*0.001)/ COUNT(channel)))/ COUNT(DISTINCT(`sensor position`))  AS seconds_records
FROM controls 
GROUP BY `trial number`;


-- Which sensor value is the most different?
-- WITH Alcoholic_group_frequency(`trial number`, `sensor position`, `sensor value`) AS(
--     SELECT `trial number`, `sensor position`, MIN(`sensor value`) AS minimum_value, MAX(`sensor value`) AS maximal_value 
--     FROM alcoholics
--     WHERE `trial number` LIKE 30
--     GROUP BY `trial number`, `sensor position`)

--     SELECT `trial number`, `sensor position`, MIN(`sensor value`) AS minimum_value, MAX(`sensor value`) AS maximal_value 
--     FROM alcoholics
--     WHERE `trial number` LIKE 32
--     GROUP BY `trial number`, `sensor position`;

--     SELECT `trial number`, `sensor position`, MIN(`sensor value`) AS minimum_value, MAX(`sensor value`) AS maximal_value 
--     FROM alcoholics
--     WHERE `trial number` LIKE 34
--     GROUP BY `trial number`, `sensor position`;

--     SELECT `trial number`, `sensor position`, MIN(`sensor value`) AS minimum_value, MAX(`sensor value`) AS maximal_value 
--     FROM alcoholics
--     WHERE `trial number` LIKE 36
--     GROUP BY `trial number`, `sensor position`;

--     SELECT `trial number`, `sensor position`, MIN(`sensor value`) AS minimum_value, MAX(`sensor value`) AS maximal_value 
--     FROM alcoholics
--     WHERE `trial number` LIKE 38
--     GROUP BY `trial number`, `sensor position`; 

WITH Alcoholic_group_frequency AS (
    SELECT `trial number`, `sensor position`, MIN(`sensor value`) AS minimum_value, MAX(`sensor value`) AS maximal_value 
    FROM alcoholics
    GROUP BY `trial number`, `sensor position`)

SELECT  `trial number`,`sensor position`, minimum_value, maximal_value
FROM Alcoholic_group_frequency
GROUP BY `trial number`,`sensor position`
ORDER BY minimum_value;




