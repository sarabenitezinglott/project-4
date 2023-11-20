-- CREATE DATABASE EEG;
USE EEG;

SELECT * 
FROM alcoholics;

-- Import data base from MySQL Workbench

SELECT a.`sensor position`, b.`sensor position`
FROM alcoholic1 a
JOIN alcoholic2 b ON a.`sensor position` = b.`sensor position`
GROUP BY a.`sensor position`;                           -- 61 leads for each group in total 

SELECT c.`sensor position`, d.`sensor position`
FROM control1 c
JOIN control2 d ON c.`sensor position` = d.`sensor position`
GROUP BY c.`sensor position`;   

-- How many channels there are per pacient?
-- Alcoholics
SELECT `trial number`, `sensor position`, COUNT(channel) AS channel_records, name
FROM alcoholic1 
GROUP BY `trial number`, `sensor position`, `name`;

SELECT `trial number`, `sensor position`, COUNT(channel) AS channel_records, name
FROM alcoholic2
GROUP BY `trial number`, `sensor position`, `name`;


SELECT `trial number`, COUNT(DISTINCT(`sensor position`)) AS total_sensor_positions, COUNT(channel) AS total_channels
FROM alcoholic1
GROUP BY `trial number`;

SELECT `trial number`, COUNT(DISTINCT(`sensor position`)) AS total_sensor_positions, COUNT(channel) AS total_channels
FROM alcoholic2
GROUP BY `trial number`;

-- Controls
SELECT `trial number`, `sensor position`, COUNT(channel) AS channel_records, name
FROM control1 
GROUP BY `trial number`, `sensor position`, `name`;

SELECT `trial number`, `sensor position`, COUNT(channel) AS channel_records, name
FROM control2
GROUP BY `trial number`, `sensor position`, `name`;

SELECT `trial number`, COUNT(DISTINCT(`sensor position`)) AS total_sensor_positions, COUNT(channel) AS total_channels
FROM control1 
GROUP BY `trial number`;

SELECT `trial number`, COUNT(DISTINCT(`sensor position`)) AS total_sensor_positions, COUNT(channel) AS total_channels
FROM control2
GROUP BY `trial number`;

-- How much time is recorded in in eeg file per pacient?
SELECT `trial number`, COUNT(channel) AS total_channels, ((SUM(`time`*0.001)/ COUNT(channel)))/ COUNT(DISTINCT(`sensor position`))  AS seconds_records
FROM alcoholic1
GROUP BY `trial number`;

SELECT `trial number`, COUNT(channel) AS total_channels, ((SUM(`time`*0.001)/ COUNT(channel)))/ COUNT(DISTINCT(`sensor position`))  AS seconds_records
FROM alcoholic2
GROUP BY `trial number`;

SELECT `trial number`, COUNT(channel) AS total_channels, ((SUM(`time`*0.001)/ COUNT(channel)))/ COUNT(DISTINCT(`sensor position`))  AS seconds_records
FROM control1
GROUP BY `trial number`;

SELECT `trial number`, COUNT(channel) AS total_channels, ((SUM(`time`*0.001)/ COUNT(channel)))/ COUNT(DISTINCT(`sensor position`))  AS seconds_records
FROM control2
GROUP BY `trial number`;

-- Which are the highest and minumun variable for each group of patients?
-- Alcoholic group
WITH Alcoholic1_group_MINfrequency AS (
    SELECT `trial number`, `sensor position`, MIN(`sensor value`) AS minimum_value
    FROM alcoholic1
    GROUP BY `trial number`, `sensor position`)

SELECT *
FROM Alcoholic1_group_MINfrequency
GROUP BY `trial number`,`sensor position`
ORDER BY minimum_value ASC
LIMIT 10;                                   -- The minimum frequency value is of: -64097 from PO7 lead.


WITH Alcoholic1_group_MAXfrequency AS (
    SELECT `trial number`, `sensor position`, MAX(`sensor value`) AS maximal_value 
    FROM alcoholic1
    GROUP BY `trial number`, `sensor position`)

SELECT *
FROM Alcoholic1_group_MAXfrequency
GROUP BY `trial number`,`sensor position`
ORDER BY maximal_value DESC
LIMIT 10 ;                                  -- The maximal frequency value is of: 64718 from the FP2 lead.


WITH Alcoholic2_group_MINfrequency AS (
    SELECT `trial number`, `sensor position`, MIN(`sensor value`) AS minimum_value
    FROM alcoholic2
    GROUP BY `trial number`, `sensor position`)

SELECT *
FROM Alcoholic2_group_MINfrequency
GROUP BY `trial number`,`sensor position`
ORDER BY minimum_value ASC
LIMIT 10;    

WITH Alcoholic2_group_MAXfrequency AS (
    SELECT `trial number`, `sensor position`, MAX(`sensor value`) AS maximal_value 
    FROM alcoholic2
    GROUP BY `trial number`, `sensor position`)

SELECT *
FROM Alcoholic2_group_MAXfrequency
GROUP BY `trial number`,`sensor position`
ORDER BY maximal_value DESC
LIMIT 10 ; 

-- Control group
WITH Control1_group_MINfrequency AS (
    SELECT `trial number`, `sensor position`, MIN(`sensor value`) AS minimum_value
    FROM control1
    GROUP BY `trial number`, `sensor position`)

SELECT *
FROM Control1_group_MINfrequency
GROUP BY `trial number`,`sensor position`
ORDER BY minimum_value ASC
LIMIT 10;                                   -- The minimum frequency value is of: -63151 from the P7 lead. 

WITH Control1_group_MAXfrequency AS (
    SELECT `trial number`, `sensor position`, MAX(`sensor value`) AS maximal_value 
    FROM control1
    GROUP BY `trial number`, `sensor position`)

SELECT *
FROM Control1_group_MAXfrequency
GROUP BY `trial number`,`sensor position`
ORDER BY maximal_value DESC
LIMIT 10;                                  -- The maximal frequency value is of: 59621 from the AF7 lead. 


WITH Control2_group_MINfrequency AS (
    SELECT `trial number`, `sensor position`, MIN(`sensor value`) AS minimum_value
    FROM control2
    GROUP BY `trial number`, `sensor position`)

SELECT *
FROM Control2_group_MINfrequency
GROUP BY `trial number`,`sensor position`
ORDER BY minimum_value ASC
LIMIT 10;                                    

WITH Control2_group_MAXfrequency AS (
    SELECT `trial number`, `sensor position`, MAX(`sensor value`) AS maximal_value 
    FROM control2
    GROUP BY `trial number`, `sensor position`)

SELECT *
FROM Control2_group_MAXfrequency
GROUP BY `trial number`,`sensor position`
ORDER BY maximal_value DESC
LIMIT 10; 

-- Sample num per second? 
-- Alcoholics
SELECT `trial number`, `sensor position`, COUNT(`sample num`) AS `total sample number`
FROM alcoholic1
WHERE `matching condition` LIKE 'S1 obj'
GROUP BY `trial number`, `sensor position`; -- There are 256 samples per second

SELECT `trial number`, `sensor position`, COUNT(`sample num`) AS `total sample number`
FROM alcoholic1
WHERE `matching condition` LIKE 'S2 match'
GROUP BY `trial number`, `sensor position`;  -- There are no S2 match in alcoholics

SELECT `trial number`, `sensor position`, COUNT(`sample num`) AS `total sample number`
FROM alcoholic2
WHERE `matching condition` LIKE 'S1 obj'
GROUP BY `trial number`, `sensor position`; 

SELECT `trial number`, `sensor position`, COUNT(`sample num`) AS `total sample number`
FROM alcoholic2
WHERE `matching condition` LIKE 'S2 match'
GROUP BY `trial number`, `sensor position`;

-- Controls
SELECT `trial number`, `sensor position`, COUNT(`sample num`) AS `total sample number`
FROM control1
WHERE `matching condition` LIKE 'S1 obj'
GROUP BY `trial number`, `sensor position`; -- There are no S1 obj stimuli

SELECT `trial number`, `sensor position`, COUNT(`sample num`) AS `total sample number`
FROM control1
WHERE `matching condition` LIKE 'S2 match'
GROUP BY `trial number`, `sensor position`;  -- There are 256 samples per second

SELECT `trial number`, `sensor position`, COUNT(`sample num`) AS `total sample number`
FROM control2
WHERE `matching condition` LIKE 'S1 obj'
GROUP BY `trial number`, `sensor position`; -- There are no S1 obj stimuli

SELECT `trial number`, `sensor position`, COUNT(`sample num`) AS `total sample number`
FROM control2
WHERE `matching condition` LIKE 'S2 match'
GROUP BY `trial number`, `sensor position`;  
