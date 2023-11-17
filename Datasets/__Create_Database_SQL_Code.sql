-- This creates and populates the database and 2 tables required for the tutorials using the Common_Toxins and/or state_regulations tables for queries. 
-- Please change the PATH within the FROM clause to the path where you will be locally saving the csv files.
-- The two files required are common_toxins.csv and state_regulations.csv
-- This code is written for Transact SQL



CREATE DATABASE WaterQuality;

-- DROP TABLE dbo.common_toxins;
CREATE TABLE common_toxins (
    station_id INT, 
    station_name VARCHAR(500), 
    full_station_name VARCHAR(500), 
    station_number VARCHAR(250), 
    station_type VARCHAR(250),
    latitude FLOAT,
    longitude FLOAT,
    status_ VARCHAR(250),
    county_name VARCHAR(250),
    sample_code VARCHAR(250),
    sample_date DATETIME,
    sample_depth VARCHAR(50),
    sample_depth_units VARCHAR(250),
    parameter VARCHAR(250), 
    result FLOAT,
    reporting_limit FLOAT,
    units VARCHAR(250),
    method_name VARCHAR(250)
);


BULK INSERT dbo.common_toxins
FROM "PATH\common_toxins.csv"
WITH 
(
	FORMAT = 'CSV',
	FIRSTROW = 2
)
GO
;

-- DROP TABLE dbo.state_regulations;
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
FROM "PATH\state_regulations.csv" -- Please change this to include the path and folder where the file is saved
WITH 
(
	FORMAT = 'CSV',
	FIRSTROW = 2
)
GO
;

