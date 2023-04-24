-- This creates the Water_Quality Database, state regulations table using the csv from this repo, and populates the table. 
-- This code is written for MS SQL Server

CREATE DATABASE Water_Quality;

CREATE TABLE state_regulations (
	contaminant VARCHAR(250) NOT NULL, 
	state_max_level FLOAT NOT NULL, 
	state_detection_limit FLOAT, 
	state_health_goal FLOAT, 
	state_health_date INT, 
	federal_max_level FLOAT,
	federal_max_level_goal FLOAT, 
	units VARCHAR(50)
);

BULK INSERT dbo.state_regulations
FROM "Water_Quality\state_regulations.csv" -- Please change this from Water_Quality to the path and folder where the file is saved
WITH 
(
	FORMAT = 'CSV',
	FIRSTROW = 2
)
GO
;

SELECT *
FROM dbo.state_regulations
;