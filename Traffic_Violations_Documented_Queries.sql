SET GLOBAL local_infile=1;
SET SQL_SAFE_UPDATES =0;
CREATE DATABASE IF NOT EXISTS traffic;
USE traffic;

CREATE TABLE traffic_violations
(
SeqID VARCHAR(50),
Date_Of_Stop DATE,
Month_Of_stop INT,
Day_Of_Stop INT,
Year_Of_Stop INT,
Time_Of_Stop TIME,
SubAgency VARCHAR(100),
Search_Conducted VARCHAR(3),
Search_Disposition VARCHAR (30),
Search_Outcome VARCHAR(20),
Search_Reason VARCHAR(30),
Search_Reason_For_Stop VARCHAR(20),
Search_Type VARCHAR(20),
Search_Arrest_Reason VARCHAR(10),
State CHAR(2),
Vehicle_Type VARCHAR(50),
Car_Year YEAR,
Make VARCHAR(30),
Model VARCHAR(50),
Color VARCHAR(30),
Violation_Type VARCHAR(20),
Contributed_To_Accident VARCHAR(5),
Race VARCHAR(20),
Gender CHAR(1),
Driver_City VARCHAR(50),
Driver_State CHAR(2),
DL_State CHAR(2)
);
LOAD DATA LOCAL INFILE 'C:\\Users\\dutch\\Documents\\Traffic_Violations5.csv'
INTO TABLE traffic_violations
FIELDS TERMINATED BY ','
IGNORE 1 LINES
(SeqID, @Date_Of_Stop_String, Month_Of_Stop, Day_Of_Stop, Year_Of_Stop, @Time_Of_Stop_String, SubAgency, Search_Conducted, Search_Disposition, Search_Outcome, Search_Reason, Search_Reason_For_Stop, Search_Type, Search_Arrest_Reason, State, Vehicle_Type, Car_Year, Make, Model, Color, Violation_Type, Contributed_To_Accident, Race, Gender, Driver_City, Driver_State, DL_State)
SET Date_Of_Stop = STR_TO_DATE(@Date_Of_Stop_String, '%m/%d/%Y'),
	Time_Of_Stop = STR_TO_DATE(@Time_Of_Stop_String, '%H:%i:%s');
SELECT *
FROM traffic_violations;
CREATE TABLE traffic_violations_staging
LIKE traffic_violations;
SELECT *
FROM traffic_violations_staging;
INSERT traffic_violations_staging
SELECT *
FROM traffic_violations;

SELECT *,
ROW_NUMBER() OVER(PARTITION BY SeqID, Date_Of_Stop, Month_Of_Stop, Day_Of_Stop, Year_Of_Stop, Time_Of_Stop, SubAgency, Search_Conducted, Search_Disposition, Search_Outcome, Search_Reason, Search_Reason_For_Stop, Search_Type, Search_Arrest_Reason, State, Vehicle_Type, Car_Year, Make, Model, Color, Violation_Type, Contributed_To_Accident, Race, Gender, Driver_City, Driver_State, DL_State) AS row_num
FROM traffic_violations_staging;

WITH duplicate_cte AS
(SELECT *,
ROW_NUMBER() OVER(
PARTITION BY SeqID, Date_Of_Stop, Month_Of_Stop, Day_Of_Stop, Year_Of_Stop, Time_Of_Stop, SubAgency, Search_Conducted, Search_Disposition, Search_Outcome, Search_Reason, Search_Reason_For_Stop, Search_Type, Search_Arrest_Reason, State, Vehicle_Type, Car_Year, Make, Model, Color, Violation_Type, Contributed_To_Accident, Race, Gender, Driver_City, Driver_State, DL_State) AS row_num
FROM traffic_violations_staging
)
SELECT *
FROM duplicate_cte
WHERE row_num >= 1;

CREATE TABLE `traffic_violations_staging2` (
  `SeqID` varchar(50) DEFAULT NULL,
  `Date_Of_Stop` date DEFAULT NULL,
  `Month_Of_Stop` INT DEFAULT NULL,
  `Day_Of_Stop` INT DEFAULT NULL,
  `Year_Of_Stop` INT DEFAULT NULL,
  `Time_Of_Stop` time DEFAULT NULL,
  `SubAgency` varchar(100) DEFAULT NULL,
  `Search_Conducted` varchar(3) DEFAULT NULL,
  `Search_Disposition` varchar(30) DEFAULT NULL,
  `Search_Outcome` varchar(20) DEFAULT NULL,
  `Search_Reason` varchar(30) DEFAULT NULL,
  `Search_Reason_For_Stop` varchar(20) DEFAULT NULL,
  `Search_Type` varchar(20) DEFAULT NULL,
  `Search_Arrest_Reason` varchar(10) DEFAULT NULL,
  `State` char(2) DEFAULT NULL,
  `Vehicle_Type` varchar(50) DEFAULT NULL,
  `Car_Year` year DEFAULT NULL,
  `Make` varchar(30) DEFAULT NULL,
  `Model` varchar(50) DEFAULT NULL,
  `Color` varchar(30) DEFAULT NULL,
  `Violation_Type` varchar(20) DEFAULT NULL,
  `Contributed_To_Accident` varchar(5) DEFAULT NULL,
  `Race` varchar(20) DEFAULT NULL,
  `Gender` char(1) DEFAULT NULL,
  `Driver_City` varchar(50) DEFAULT NULL,
  `Driver_State` char(2) DEFAULT NULL,
  `DL_State` char(2) DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SELECT *
FROM traffic_violations_staging2
WHERE row_num > 1;

INSERT INTO traffic_violations_staging2
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY SeqID, Date_Of_Stop, Month_Of_Stop, Day_Of_Stop, Year_Of_Stop, Time_Of_Stop, SubAgency, Search_Conducted, Search_Disposition, Search_Outcome, Search_Reason, Search_Reason_For_Stop, Search_Type, Search_Arrest_Reason, State, Vehicle_Type, Car_Year, Make, Model, Color, Violation_Type, Contributed_To_Accident, Race, Gender, Driver_City, Driver_State, DL_State) AS row_num
FROM traffic_violations_staging;
DELETE
FROM traffic_violations_staging2
WHERE row_num > 1;
SELECT *
FROM traffic_violations_staging2;

-- STANDARDIZING THE DATA

UPDATE traffic_violations_staging2
SET 
    SeqID = TRIM(SeqID),
    Date_Of_Stop = TRIM(Date_Of_Stop),
    Month_Of_Stop = TRIM(Month_Of_Stop),
    Day_Of_Stop = TRIM(Day_Of_Stop),
    Year_Of_Stop = TRIM(Year_Of_Stop),
    Time_Of_Stop = TRIM(Time_Of_Stop),
    SubAgency = TRIM(SubAgency),
    Search_Conducted = TRIM(Search_Conducted),
    Search_Disposition = TRIM(Search_Disposition),
    Search_Outcome = TRIM(Search_Outcome),
    Search_Reason = TRIM(Search_Reason),
    Search_Reason_For_Stop = TRIM(Search_Reason_For_Stop),
    Search_Type = TRIM(Search_Type),
    Search_Arrest_Reason = TRIM(Search_Arrest_Reason),
    State = TRIM(State),
    Vehicle_Type = TRIM(Vehicle_Type),
    Car_Year = TRIM(Car_Year),
    Make = TRIM(Make),
    Model = TRIM(Model),
    Color = TRIM(Color),
    Violation_Type = TRIM(Violation_Type),
    Contributed_To_Accident = TRIM(Contributed_To_Accident),
    Race = TRIM(Race),
    Gender = TRIM(Gender),
    Driver_City = TRIM(Driver_City),
    Driver_State = TRIM(Driver_State),
    DL_State = TRIM(DL_State);
    
SELECT DISTINCT Search_Arrest_Reason
FROM traffic_violations_staging2
ORDER BY 1;

SELECT *
FROM traffic_violations_staging2
WHERE Search_Arrest_Reason LIKE 'Mari%';

UPDATE traffic_violations_staging2
SET Search_Arrest_Reason = 'Marijuana'
WHERE Search_Arrest_Reason LIKE 'Mari%';

SELECT *
FROM traffic_violations_staging2;

UPDATE traffic_violations_staging2
SET Car_Year = NULL 
WHERE Car_Year = 0 
	OR Car_Year >= 2026 
	OR Car_Year <= 1910
    OR (Car_Year = 1932 and Make = 'HONDA');
    
SELECT DISTINCT COLOR
FROM traffic_violations_staging2
ORDER BY 1;


UPDATE traffic_violations_staging2
SET COLOR = CASE
	WHEN COLOR LIKE 'BLUE%' THEN 'BLUE'
    WHEN COLOR LIKE 'GREEN%' THEN 'GREEN'
    ELSE COLOR
END;

-- NULL VALUES

SELECT *
FROM traffic_violations_staging2
WHERE Driver_State IS NULL;

UPDATE traffic_violations_staging2
SET Driver_State = CASE
	WHEN Driver_City = 'SILVER SPRING' THEN 'MD'
    WHEN Driver_City IN ('WASHINGTON DC', 'MADRID') THEN 'DC'
    ELSE Driver_State
END
WHERE Driver_State IS NULL 
AND Driver_City IN ('SILVER SPRING', 'WASHINGTON DC', 'MADRID');

-- REMOVING COLUMNS AND ROWS

SELECT *
FROM traffic_violations_staging2
WHERE Search_Conducted IS NULL
AND Search_Outcome IS NULL; 

DELETE
FROM traffic_violations_staging2
WHERE Search_Conducted IS NULL
AND Search_Outcome IS NULL; 

SELECT *
FROM traffic_violations_staging2;

SELECT COUNT(*)
FROM traffic_violations_staging2;

ALTER TABLE traffic_violations_staging2
DROP COLUMN Search_Disposition,
DROP COLUMN Search_Reason,
DROP COLUMN Search_Reason_For_Stop,
DROP COLUMN Search_Type,
DROP COLUMN Search_Arrest_Reason,
DROP COLUMN Make,
DROP COLUMN Driver_City,
DROP COLUMN Model,
DROP COLUMN row_num;

SELECT *
FROM traffic_violations_staging2;

-- EXPLOATORY ANALYSIS

SELECT 'Race' AS Category, Race AS Value, COUNT(*) AS Count
FROM traffic_violations_staging2
GROUP BY Race
UNION ALL
SELECT 'Gender' AS Category, Gender AS Value, COUNT(*) AS Count
FROM traffic_violations_staging2
GROUP BY Gender
UNION ALL
SELECT 'Search_Conducted' AS Category, Search_Conducted AS Value, COUNT(*) AS Count
FROM traffic_violations_staging2
GROUP BY Search_Conducted
UNION ALL
SELECT 'Search_Outcome' AS Category, Search_Outcome AS Value, COUNT(*) AS Count
FROM traffic_violations_staging2
GROUP BY Search_Outcome;

SELECT
	CASE
		WHEN TIME(Time_Of_Stop) BETWEEN '05:00:00' AND '11:59:59' THEN 'Morning'
        WHEN TIME(Time_Of_Stop) BETWEEN '12:00:00' AND '17:59:59' THEN 'Afternoon'
        ELSE 'Night'
	END AS time_category,
    COUNT(*) AS number_of_stops,
    COUNT(CASE WHEN Search_Outcome = 'Arrest' THEN 1 END) AS number_of_arrests
FROM traffic_violations_staging2
GROUP BY time_category
ORDER BY number_of_stops DESC;

SELECT DISTINCT Year_Of_Stop
FROM traffic_violations_staging2
ORDER BY Year_Of_Stop ASC;

UPDATE traffic_violations_staging2
SET Search_Conducted = CASE
    WHEN Search_Conducted = 'Yes' THEN 1
    ELSE 0
END;

UPDATE traffic_violations_staging2
SET Search_Outcome = CASE
    WHEN Search_Outcome = 'Arrest' THEN 1
    ELSE 0
END;

SELECT DISTINCT Year_Of_Stop, COUNT(Search_Conducted)
FROM traffic_violations_staging2
GROUP BY Year_Of_Stop
ORDER BY Year_Of_Stop ASC;

SELECT DISTINCT Month_Of_Stop, COUNT(Search_Conducted)
FROM traffic_violations_staging2
GROUP BY Month_Of_Stop
ORDER BY Month_Of_Stop ASC;

SELECT
	Race,
	COUNT(Search_Conducted) AS Total_Searches,
	COUNT(CASE WHEN Search_Outcome = 'Arrest' THEN 1 END) AS Arrest_Outcomes
FROM traffic_violations_staging2
GROUP BY
	Race
ORDER BY
	Race ASC;

SELECT
	Gender,
	COUNT(Search_Conducted) AS Total_Searches,
	COUNT(CASE WHEN Search_Outcome = 'Arrest' THEN 1 END) AS Arrest_Outcomes
FROM traffic_violations_staging2
GROUP BY
	Gender
ORDER BY
	Gender ASC;

SELECT *
FROM traffic_violations_staging2;

SELECT COUNT(*)
FROM traffic_violations_staging2;

SELECT 
	*
FROM 
	traffic_violations_staging2
INTO OUTFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\outputtraffic.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';








