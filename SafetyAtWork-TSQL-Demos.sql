
-- Safety At Work: TSQL Demos
-- Author: Hina Malik
-- Course: Systems Design and Databases
-- Date: 30th May 2025

/*
=========================================================
Module 3: Writing SELECT Queries with Single Table
=========================================================
*/

-- Demo A1: Writing a Simple SELECT Statement
-- As a Health and Safety Officer, I want to see all events along with their outcomes.
SELECT * FROM Events;

-- Demo A1a: Retrieve Start Date of All Events
-- As a Health and Safety Officer, I want to see the Start Date of all events.
SELECT Start_Date FROM Events;

-- Demo A2: Eliminating Duplicates with DISTINCT
-- As a Training Coordinator, I want to see all unique services provided.
SELECT DISTINCT Service_Name FROM Services;

-- Demo A2a: Retrieve Unique Location Details
-- As a facility manager, I want to retrieve a distinct list of location details.
SELECT DISTINCT Other_Details FROM Locations;

-- Demo A3: Using Column and Table Aliases
-- As a Database Analyst, I want to retrieve service names and their descriptions.
SELECT S.Service_Name AS Name, S.Service_Description AS Description
FROM Services AS S;

-- Demo A3a: Retrieve unique occupational health regulation details with alias
-- As a compliance officer, I need to review all occupational health regulations details.
SELECT DISTINCT O.Occupational_Health_Regulations_Details AS Details
FROM Occupational_Health_Regulations AS O;

-- Demo A4: Writing Simple CASE Expression
-- Example: Categorize events based on outcome

SELECT Event_ID,
       CASE 
           WHEN DATEDIFF(DAY, Start_Date, End_Date) <= 1 THEN 'Short'
           WHEN DATEDIFF(DAY, Start_Date, End_Date) BETWEEN 2 AND 5 THEN 'Medium'
           ELSE 'Long'
       END AS Event_Duration_Category
FROM Events;


-- Demo A5: Writing Aggregate Functions
-- As a Safety Manager, I want to know the total number of events.
SELECT COUNT(*) AS TotalEvents FROM Events;

-- Average duration of events
SELECT AVG (DATEDIFF (DAY, Start_Date, End_Date))
AS Average_Event_Duration FROM Events;

--Minimum event duration
SELECT MIN (CASE WHEN Start_Date <= End_Date THEN DATEDIFF (DAY, Start_Date, End_Date) ELSE NULL END)
AS Shortest_Event_Duration FROM Events;

-- Maximum event duration
SELECT MAX (DATEDIFF (DAY, Start_Date, End_Date))
AS Longest_Event_Duration FROM Events;

/*
=========================================================
Module 4: Joining and Querying Multiple Tables
=========================================================
*/

-- Demo B1: Provide data from 2 related tables with JOIN
-- List all events with their assigned service names

SELECT E.Event_ID AS "Event ID", E.Start_Date AS "Start Date", E.End_Date AS "End Date", S.Service_Name AS "Service Name", L.Other_Details AS "Location Name"
FROM Events AS E
INNER JOIN Services_In_Events AS SE ON E.Event_ID = SE.Event_ID INNER JOIN Services AS S ON SE.Service_ID = S.Services_ID INNER JOIN Locations AS L ON E.Location_ID = L.Location_ID;


-- Demo B2: Query with Subqueries
-- Events with specific services
SELECT Event_ID,Start_Date, End_Date
FROM Events 
WHERE Event_ID IN ( SELECT Event_ID FROM Services_In_Events WHERE Service_ID = 5 );

-- Demo B3: Query with Self Joins
-- Counting services in events
SELECT Event_ID, Start_Date, End_Date, (SELECT COUNT(Service_ID)
FROM Services_In_Events
WHERE Services_In_Events.Event_ID = Events.Event_ID) AS Total_Services FROM Events;


/*
=========================================================
Module 5: Sorting and Filtering Data
=========================================================
*/

-- Demo C1: Sort Data
-- List all events ordered by Start_Date
SELECT * FROM Events
ORDER BY Start_Date;

-- Demo C2: Filter with WHERE Clause (including handling NULL values)
-- Complete Address Data Filter for Event Outcomes and Services
SELECT Address_ID, Address_Details FROM Addresses
WHERE Address_ID NOT IN (SELECT Event_Outcome_Code FROM Ref_Event_Outcomes WHERE Event_Outcome_Description IS NULL)
AND Address_ID IN (SELECT Service_Type_Code 
FROM Ref_service_Types WHERE Service_Type_Description IS NOT NULL);

-- Demo C3: Filter Data with TOP and OFFSET-FETCH
-- Get the 5 most recent events
SELECT TOP 5 * FROM Events
ORDER BY Start_Date DESC;

-- Paginate events: Get events 11-20
SELECT * FROM Events
ORDER BY Start_Date
OFFSET 10 ROWS FETCH NEXT 10 ROWS ONLY;

-- Demo C4: Pattern Matching using LIKE
-- Identifying Training Events
SELECT Event_ID, Start_Date, End_Date,  Other_Details FROM Events
WHERE Other_Details LIKE '%Training%';



/*
=========================================================
Module 6: Working with Data Types
=========================================================
*/

-- Demo D1: Working with Conversion in a Query
-- Convert Start_Date to a string
SELECT Event_ID, CONVERT(VARCHAR(10), Start_Date, 105) AS FormattedStartDate
FROM Events;

-- Demo D2: Working with Collation in a Query
-- Case-Insensitive Search for Training Event Types
SELECT Event_Type_Description FROM Ref_Event_Types
WHERE Event_Type_Description COLLATE Latin1_General_CI_AI LIKE '%training%';

-- Demo D3: Working with Date and Time Functions
-- Get current date and time
SELECT GETDATE() AS CurrentDateTime;

-- Demo D4: Working with String Functions
--  Creating Full Location Description
SELECT Location_ID, CONCAT(Other_Details, ', ', Address_ID) AS "Full Location Description" 
FROM Locations;


/*
=========================================================
Module 7: Using DML to Modify Data
=========================================================
*/

-- Demo E1: Adding Data to Tables
-- Insert a new event
INSERT INTO Events (Event_ID, Start_Date, End_Date, Location_ID, Event_Outcome_Code, Other_Details, Event_Type_Code, Occupational_Health_Regulations_ID)
VALUES (101, '2025-04-05', '2025-04-07', 3, 1, 'Safety Training Event',2, 1);

-- Demo E2: Modifying and Removing Data
-- Update event location
UPDATE Events
SET Location_ID = 5
WHERE Event_ID = 101;

-- Delete an event
DELETE FROM Events
WHERE Event_ID = 2;

-- Demo E3: Generating Automatic Column Values
-- Add an identity column to Employees (if not exists)
-- Note: This is for demonstration; actual syntax may require table recreation
-- ALTER TABLE Employees ADD Employee_ID INT IDENTITY(1,1) PRIMARY KEY;

/*
=========================================================
Module 8: Using Built-In Functions
=========================================================
*/

-- Demo F1: Writing Queries with Built-In Functions
-- Calculating Average Event Duration
SELECT AVG (DATEDIFF (DAY, Start_Date, End_Date)) AS AverageEventDuration
FROM Events;

-- Demo F2: Using Conversion Functions
-- Converting Event IDs to Strings
SELECT Event_ID, CONVERT (VARCHAR, Event_ID) AS EventIDString
FROM Events;

-- Demo F3: Using Logical Functions
-- Use IIF to flag long events
SELECT Event_ID, IIF(Duration > 5, 'Long', 'Short') AS EventType
FROM Events;

-- Demo F4: Using Functions to Work with NULL
-- Handling NULL Values in Event Details
SELECT Event_ID, ISNULL (Other_Details, 'No Details Provided') AS Other_Details
FROM Events;

/*
=========================================================
Module 9: Grouping and Aggregating Data
=========================================================
*/

-- Demo G1: Using GROUP BY Clause and Applying Aggregation
-- Analyzing Event Distribution by Location
SELECT Location_ID, COUNT(Event_ID) AS Total_Events FROM Events
GROUP BY Location_ID;

-- Demo G2: Using the HAVING Clause
-- Regulation Dates with Long Average Details
SELECT Regulation_Date, AVG(LEN(Occupational_Health_Regulations_Details)) AS AverageDetailLength
FROM Occupational_Health_Regulations
GROUP BY Regulation_Date HAVING AVG(LEN(Occupational_Health_Regulations_Details)) > 50;

-- Demo G3: Grouping data by Multiple columns
-- Analyzing Event Outcomes by Location
SELECT Location_ID, Event_Outcome_Code, COUNT (Event_ID) AS Total_Events
FROM Events GROUP BY Location_ID, Event_Outcome_Code;

