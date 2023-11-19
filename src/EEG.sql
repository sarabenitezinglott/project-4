-- CREATE DATABASE EEG;
USE EEG;

-- Import data base from MySQL Workbench

SELECT *
FROM alcoholics

-- How many channels there are per pacient?
-- Alcoholics
SELECT `trial number`, `sensor position`, COUNT(channel) AS channel_records, name
FROM alcoholics 
GROUP BY `trial number`, `sensor position`, `name`;


SELECT `trial number`, COUNT(DISTINCT(`sensor position`)) AS total_sensor_positions, COUNT(channel) AS total_channels
FROM alcoholics 
GROUP BY `trial number`;

-- Controls
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

-- Which are the highest and minumun variable for each grtoup of patients
-- Alcoholic group
WITH Alcoholic_group_MINfrequency AS (
    SELECT `trial number`, `sensor position`, MIN(`sensor value`) AS minimum_value
    FROM alcoholics
    GROUP BY `trial number`, `sensor position`)

SELECT *
FROM Alcoholic_group_MINfrequency
GROUP BY `trial number`,`sensor position`
ORDER BY minimum_value ASC
LIMIT 10;                                   -- The minimum frequency value is of: -64097 from PO7 lead.

WITH Alcoholic_group_MAXfrequency AS (
    SELECT `trial number`, `sensor position`, MAX(`sensor value`) AS maximal_value 
    FROM alcoholics
    GROUP BY `trial number`, `sensor position`)

SELECT *
FROM Alcoholic_group_MAXfrequency
GROUP BY `trial number`,`sensor position`
ORDER BY maximal_value DESC
LIMIT 10 ;                                  -- The maximal frequency value is of: 64718 from the FP2 lead.

-- Control group
WITH Controls_group_MINfrequency AS (
    SELECT `trial number`, `sensor position`, MIN(`sensor value`) AS minimum_value
    FROM controls
    GROUP BY `trial number`, `sensor position`)

SELECT *
FROM Controls_group_MINfrequency
GROUP BY `trial number`,`sensor position`
ORDER BY minimum_value ASC
LIMIT 10;                                   -- The minimum frequency value is of: -63151 from the P7 lead. 

WITH Controls_group_MAXfrequency AS (
    SELECT `trial number`, `sensor position`, MAX(`sensor value`) AS maximal_value 
    FROM controls
    GROUP BY `trial number`, `sensor position`)

SELECT *
FROM Controls_group_MAXfrequency
GROUP BY `trial number`,`sensor position`
ORDER BY maximal_value DESC
LIMIT 10;                                  -- The maximal frequency value is of: 59621 from the AF7 lead. 

-- Sample num per second? 
SELECT `trial number`,`sensor position`, SUM(`sample num`)
FROM alcoholics
GROUP BY `trial number`,`sensor position`
