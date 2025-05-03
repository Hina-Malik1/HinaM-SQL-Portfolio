-- Create the database (run this part only once)
IF DB_ID('SafetyAtWork') IS NULL
    CREATE DATABASE SafetyAtWork;
GO


--run the create table statements first

-- Addresses
CREATE TABLE Addresses (
   Address_ID INT not null primary key ,
	Address_Details  VARCHAR(50)
);

-- Locations
create table Locations (
Location_ID int not null primary key,
Address_ID int not null foreign key references Addresses,
Other_Details varchar(125) not null
);

-- Ref_Event_Types
create table Ref_Event_Types (
Event_Type_Code int not null primary key,
Event_Type_Description varchar(190) not null,
);

-- Ref_Event_Outcomes 
create table Ref_Event_Outcomes (
Event_Outcome_Code int not null primary key,
Event_Outcome_Description varchar(25) not null,
);

--Ref_service_Types
create table Ref_service_Types (
Service_Type_Code int not null primary key,
Service_Type_Description varchar(125) not null,
);

-- services
create table services (
Services_ID int not null primary key,
Service_Type_Code int not null foreign key references Ref_service_Types,
Service_name varchar(125) not null,
service_Description varchar(125) not null,
Other_Details varchar(125) not null
);

-- Occupational_Health_Regulations
CREATE TABLE Occupational_Health_Regulations (
    Occupational_Health_Regulations_ID INT NOT NULL PRIMARY KEY,
    Occupational_Health_Regulations_Details VARCHAR(125) NOT NULL,
    Regulation_Date DATE NULL
);

-- Events
Create table Events (
Event_ID int not null primary key,
Event_Outcome_Code int not null foreign key references Ref_Event_Outcomes,
Event_Type_Code int not null foreign key references Ref_Event_Types,
Location_ID int not null foreign key references Locations,
Occupational_Health_Regulations_ID int not null foreign key references Occupational_Health_Regulations,
Start_Date varchar(125) not null,
End_Date varchar(125) not null,
Other_Details varchar(125) not null,
);

-- Services_In_Events
CREATE TABLE Services_In_Events (
    Event_ID   INT NOT NULL PRIMARY KEY,
    Service_ID INT NOT NULL,
    CONSTRAINT FK_ServicesInEvents_Service
        FOREIGN KEY (Service_ID) REFERENCES Services(Services_ID)
    -- If you want to also enforce Event_ID as a foreign key, add:
    -- , CONSTRAINT FK_ServicesInEvents_Event
    --     FOREIGN KEY (Event_ID) REFERENCES Events(Event_ID)
);


-- run the insert statements 2nd

-- Addresses
insert into ADDRESSES (Address_ID, Address_Details ) values (1, '616 Little Fleur Place');
insert into ADDRESSES (Address_ID, Address_Details ) values (2, '7 Manley Way');
insert into ADDRESSES (Address_ID, Address_Details ) values (3, '06750 Delaware Junction');
insert into ADDRESSES (Address_ID, Address_Details ) values (4, '9 Jackson Terrace');
insert into ADDRESSES (Address_ID, Address_Details ) values (5, '02429 Carey Street');
insert into ADDRESSES (Address_ID, Address_Details ) values (6, '5643 Melody Center');
insert into ADDRESSES (Address_ID, Address_Details ) values (7, '5267 Debra Terrace');
insert into ADDRESSES (Address_ID, Address_Details ) values (8, '47738 Spenser Circle');
insert into ADDRESSES (Address_ID, Address_Details ) values (9, '61492 Lakeland Point');
insert into ADDRESSES (Address_ID, Address_Details ) values (10, '2319 Londonderry Hill');
insert into ADDRESSES (Address_ID, Address_Details ) values (11, '33293 Kingsford Avenue');
insert into ADDRESSES (Address_ID, Address_Details ) values (12, '063 Westport Parkway');
insert into ADDRESSES (Address_ID, Address_Details ) values (13, '52779 Northwestern Drive');
insert into ADDRESSES (Address_ID, Address_Details ) values (14, '33171 Mayer Crossing');
insert into ADDRESSES (Address_ID, Address_Details ) values (15, '5888 Pearson Point');
insert into ADDRESSES (Address_ID, Address_Details ) values (16, '7628 Gulseth Junction');
insert into ADDRESSES (Address_ID, Address_Details ) values (17, '84 Mayer Alley');
insert into ADDRESSES (Address_ID, Address_Details ) values (18, '1 Jenna Road');
insert into ADDRESSES (Address_ID, Address_Details ) values (19, '90741 Golf Place');
insert into ADDRESSES (Address_ID, Address_Details ) values (20, '442 Rieder Street');

-- Locations
insert into Locations (Location_ID, Address_ID, Other_Details ) values (1, 13, 'headquators');
insert into Locations (Location_ID, Address_ID, Other_Details ) values (2, 7, 'factory floor');
insert into Locations (Location_ID, Address_ID, Other_Details ) values (3, 7, 'training room');
insert into Locations (Location_ID, Address_ID, Other_Details ) values (4, 9, 'medical center');
insert into Locations (Location_ID, Address_ID, Other_Details ) values (5, 5, 'conference hall');
insert into Locations (Location_ID, Address_ID, Other_Details ) values (6, 6, 'warehouse');
insert into Locations (Location_ID, Address_ID, Other_Details ) values (7, 8, 'conference hall');
insert into Locations (Location_ID, Address_ID, Other_Details ) values (8, 3, 'factory floor');
insert into Locations (Location_ID, Address_ID, Other_Details ) values (9, 10, 'training room');
insert into Locations (Location_ID, Address_ID, Other_Details ) values (10, 2, 'clinic');
insert into Locations (Location_ID, Address_ID, Other_Details ) values (11, 16, 'headquaters');
insert into Locations (Location_ID, Address_ID, Other_Details ) values (12, 8, 'training room');
insert into Locations (Location_ID, Address_ID, Other_Details ) values (13, 3, 'training room');
insert into Locations (Location_ID, Address_ID, Other_Details ) values (14, 15, 'conference hall');
insert into Locations (Location_ID, Address_ID, Other_Details ) values (15, 10, 'auditorium');
insert into Locations (Location_ID, Address_ID, Other_Details ) values (16, 5, 'factory floor');

-- Ref_Event_types
insert into Ref_Event_Types (Event_Type_Code, Event_Type_Description) values (1, 'Incident Investigation');
insert into Ref_Event_Types (Event_Type_Code, Event_Type_Description) values (2, 'Equipment Maintenance');
insert into Ref_Event_Types (Event_Type_Code, Event_Type_Description) values (3, 'Safety Training');
insert into Ref_Event_Types (Event_Type_Code, Event_Type_Description) values (4, 'Health Checkup');
insert into Ref_Event_Types (Event_Type_Code, Event_Type_Description) values (5, 'First Aid Training');
insert into Ref_Event_Types (Event_Type_Code, Event_Type_Description) values (6, 'Workplace Ergonomics Workshop');
insert into Ref_Event_Types (Event_Type_Code, Event_Type_Description) values (7, 'Equipment Maintenance');
insert into Ref_Event_Types (Event_Type_Code, Event_Type_Description) values (8, 'Health Checkup');
insert into Ref_Event_Types (Event_Type_Code, Event_Type_Description) values (9, 'Workplace Ergonomics Workshop');
insert into Ref_Event_Types (Event_Type_Code, Event_Type_Description) values (10, 'Mental Health Awareness');
insert into Ref_Event_Types (Event_Type_Code, Event_Type_Description) values (11, 'Fire Drill');
insert into Ref_Event_Types (Event_Type_Code, Event_Type_Description) values (12, 'Health Checkup');
insert into Ref_Event_Types (Event_Type_Code, Event_Type_Description) values (13, 'Hazard Assessment');
insert into Ref_Event_Types (Event_Type_Code, Event_Type_Description) values (14, 'Mental Health Awareness');
insert into Ref_Event_Types (Event_Type_Code, Event_Type_Description) values (15, 'Hazard Assessment');
insert into Ref_Event_Types (Event_Type_Code, Event_Type_Description) values (16, 'Fire Drill');

-- Ref_Event_Outcomes
insert into Ref_Event_Outcomes (Event_Outcome_Code, Event_Outcome_Description) values (1, 'Invalid input provided');
insert into Ref_Event_Outcomes (Event_Outcome_Code, Event_Outcome_Description) values (2, 'Invalid input provided');
insert into Ref_Event_Outcomes (Event_Outcome_Code, Event_Outcome_Description) values (3, 'Partial success');
insert into Ref_Event_Outcomes (Event_Outcome_Code, Event_Outcome_Description) values (4, 'Closed');
insert into Ref_Event_Outcomes (Event_Outcome_Code, Event_Outcome_Description) values (5, 'Postponed');
insert into Ref_Event_Outcomes (Event_Outcome_Code, Event_Outcome_Description) values (6, 'Invalid input provided');
insert into Ref_Event_Outcomes (Event_Outcome_Code, Event_Outcome_Description) values (7, 'Connection timeout');
insert into Ref_Event_Outcomes (Event_Outcome_Code, Event_Outcome_Description) values (8, 'Permission denied');
insert into Ref_Event_Outcomes (Event_Outcome_Code, Event_Outcome_Description) values (9, 'System malfunction');
insert into Ref_Event_Outcomes (Event_Outcome_Code, Event_Outcome_Description) values (10, 'Follow-up Required');
insert into Ref_Event_Outcomes (Event_Outcome_Code, Event_Outcome_Description) values (11, 'Invalid input provided');
insert into Ref_Event_Outcomes (Event_Outcome_Code, Event_Outcome_Description) values (12, 'In Progress');
insert into Ref_Event_Outcomes (Event_Outcome_Code, Event_Outcome_Description) values (13, 'Partial success');
insert into Ref_Event_Outcomes (Event_Outcome_Code, Event_Outcome_Description) values (14, 'Permission denied');
insert into Ref_Event_Outcomes (Event_Outcome_Code, Event_Outcome_Description) values (15, 'System malfunction');
insert into Ref_Event_Outcomes (Event_Outcome_Code, Event_Outcome_Description) values (16, 'Successful completion');

--Ref_service_Types
insert into Ref_Service_Types (Service_Type_Code, Service_Type_Description) values (1, 'Workplace Hazard Assessment');
insert into Ref_Service_Types (Service_Type_Code, Service_Type_Description) values (2, 'Emergency Response Planning');
insert into Ref_Service_Types (Service_Type_Code, Service_Type_Description) values (3, 'First Aid Training');
insert into Ref_Service_Types (Service_Type_Code, Service_Type_Description) values (4, 'Safety Training');
insert into Ref_Service_Types (Service_Type_Code, Service_Type_Description) values (5, 'Safety Training');
insert into Ref_Service_Types (Service_Type_Code, Service_Type_Description) values (6, 'Vaccination Drive');
insert into Ref_Service_Types (Service_Type_Code, Service_Type_Description) values (7, 'Fire Safety Inspection');
insert into Ref_Service_Types (Service_Type_Code, Service_Type_Description) values (8, 'Vaccination Drive');
insert into Ref_Service_Types (Service_Type_Code, Service_Type_Description) values (9, 'Health Checkup');
insert into Ref_Service_Types (Service_Type_Code, Service_Type_Description) values (10, 'First Aid Training');
insert into Ref_Service_Types (Service_Type_Code, Service_Type_Description) values (11, 'Emergency Response Planning');
insert into Ref_Service_Types (Service_Type_Code, Service_Type_Description) values (12, 'Emergency Response Planning');
insert into Ref_Service_Types (Service_Type_Code, Service_Type_Description) values (13, 'Emergency Response Planning');
insert into Ref_Service_Types (Service_Type_Code, Service_Type_Description) values (14, 'Health Checkup');
insert into Ref_Service_Types (Service_Type_Code, Service_Type_Description) values (15, 'Incident Investigation');
insert into Ref_Service_Types (Service_Type_Code, Service_Type_Description) values (16, 'Fire Safety Inspection');

-- services
insert into services (Services_ID, Service_Type_Code, Service_Name, Service_Description, Other_Details) values (1, 16, 'Personal Training', 'Virtual assistant services for small businesses', 'Availability Online and in-person');
insert into Services (Services_ID, Service_Type_Code, Service_Name, Service_Description, Other_Details) values (2, 1, 'Event Planning', 'Fitness coaching and personalized workout plans', 'Offered Quarterly');
insert into services (Services_ID, Service_Type_Code, Service_Name, Service_Description, Other_Details) values (3, 10, 'Event Planning', 'Mobile car detailing and wash services', 'Offered Quarterly');
insert into Services (Services_ID, Service_Type_Code, Service_Name, Service_Description, Other_Details) values (4, 12, 'Event Planning', 'Tech support and IT consulting for individuals and businesses', 'Auto Follow-Up after completion.');
insert into Services (Services_ID, Service_Type_Code, Service_Name, Service_Description, Other_Details) values (5, 14, 'Landscaping', 'Professional cleaning services for residential properties', 'Optional for all Employees');
insert into Services (Services_ID, Service_Type_Code, Service_Name, Service_Description, Other_Details) values (6, 4, 'Pet Grooming', 'Professional cleaning services for residential properties', 'Conducted Yearly');
insert into Services (Services_ID, Service_Type_Code, Service_Name, Service_Description, Other_Details) values (7, 12, 'Home Renovation', 'Tech support and IT consulting for individuals and businesses', 'Optional for all Employees');
insert into Services (Services_ID, Service_Type_Code, Service_Name, Service_Description, Other_Details) values (8, 11, 'Home Renovation', 'Mobile car detailing and wash services', 'Requires Early Registration');
insert into Services (Services_ID, Service_Type_Code, Service_Name, Service_Description, Other_Details) values (9, 13, 'Pet Grooming', 'Graphic design and branding services for startups', 'Optional for all Employees');
insert into Services (Services_ID, Service_Type_Code, Service_Name, Service_Description, Other_Details) values (10, 6, 'Massage Therapy', 'Landscaping and lawn care maintenance', 'Optional for all Employees');
insert into Services (Services_ID, Service_Type_Code, Service_Name, Service_Description, Other_Details) values (11, 14, 'Cleaning Services', 'Professional cleaning services for residential properties', 'Conducted Yearly');
insert into Services (Services_ID, Service_Type_Code, Service_Name, Service_Description, Other_Details) values (12, 14, 'Event Planning', 'Graphic design and branding services for startups', 'Requires Early Registration');
insert into Services (Services_ID, Service_Type_Code, Service_Name, Service_Description, Other_Details) values (13, 6, 'Massage Therapy', 'Landscaping and lawn care maintenance', 'Requires Early Registration');
insert into Services (Services_ID, Service_Type_Code, Service_Name, Service_Description, Other_Details) values (14, 1, 'Graphic Design', 'Interior design consultation and home staging services', 'Availability Online and in-person');
insert into Services (Services_ID, Service_Type_Code, Service_Name, Service_Description, Other_Details) values (15, 10, 'Home Renovation', 'Fitness coaching and personalized workout plans', 'Optional for all Employees');
insert into Services (Services_ID, Service_Type_Code, Service_Name, Service_Description, Other_Details) values (16, 6, 'Event Planning', 'Virtual assistant services for small businesses', 'Conducted Yearly');

-- Occupational_Health_Regulations
INSERT INTO Occupational_Health_Regulations 
    (Occupational_Health_Regulations_ID, Occupational_Health_Regulations_Details, Regulation_Date)
VALUES
    (1,  'Regular breaks must be taken every 2 hours',                   '2024-06-01'),
    (2,  'Training on hazardous materials handling must be provided to all employees', '2024-07-01'),
    (3,  'First aid kits must be fully stocked and easily accessible',   '2024-08-01'),
    (4,  'Fire drills must be conducted every quarter',                  '2024-09-01'),
    (5,  'Regular ergonomic assessments must be conducted for all employees', '2024-10-01'),
    (6,  'Proper ventilation must be maintained in work areas',          '2024-11-01'),
    (7,  'Employees must undergo annual health screenings',              '2024-12-01'),
    (8,  'Regular ergonomic assessments must be conducted for all employees', '2025-01-01'),
    (9,  'First aid kits must be fully stocked and easily accessible',   '2025-02-01'),
    (10, 'Proper lifting techniques must be followed to prevent injuries', '2025-03-01'),
    (11, 'Employees must wear safety goggles at all times in designated areas', '2025-04-01'),
    (12, 'Emergency exits must be clearly marked and accessible',        '2025-05-01'),
    (13, 'Employees must wear safety goggles at all times in designated areas', '2025-06-01'),
    (14, 'Training on hazardous materials handling must be provided to all employees', '2025-07-01'),
    (15, 'Proper lifting techniques must be followed to prevent injuries', '2025-08-01'),
    (16, 'Employees must wear safety goggles at all times in designated areas', '2025-09-01');

	--Events
insert into Events (Event_ID, Event_Outcome_Code, Event_Type_Code, Location_ID, Occupational_Health_Regulations_ID, Start_Date, End_Date, Other_Details) values (1, 3, 11, 15, 1, '2024-07-26', 'error: Field ''this'' not found', 'Includes Hands-On training Session');
insert into Events (Event_ID, Event_Outcome_Code, Event_Type_Code, Location_ID, Occupational_Health_Regulations_ID, Start_Date, End_Date, Other_Details) values (2, 3, 7, 4, 7, '2024-04-18', 'error: Field ''this'' not found', 'On-Session at Main Office');
insert into Events (Event_ID, Event_Outcome_Code, Event_Type_Code, Location_ID, Occupational_Health_Regulations_ID, Start_Date, End_Date, Other_Details) values (3, 6, 6, 10, 5, '2024-08-22', 'error: Field ''this'' not found', 'Mandatory for all Employees');
insert into Events (Event_ID, Event_Outcome_Code, Event_Type_Code, Location_ID, Occupational_Health_Regulations_ID, Start_Date, End_Date, Other_Details) values (4, 16, 8, 1, 3, '2025-01-11', 'error: Field ''this'' not found', 'Includes Hands-On training Session');
insert into Events (Event_ID, Event_Outcome_Code, Event_Type_Code, Location_ID, Occupational_Health_Regulations_ID, Start_Date, End_Date, Other_Details) values (5, 13, 6, 6, 14, '2024-12-23', 'error: Field ''this'' not found', 'Includes Hands-On training Session');
insert into Events (Event_ID, Event_Outcome_Code, Event_Type_Code, Location_ID, Occupational_Health_Regulations_ID, Start_Date, End_Date, Other_Details) values (6, 3, 2, 11, 13, '2025-03-14', 'error: Field ''this'' not found', 'Follow-Up Required after Completion');
insert into Events (Event_ID, Event_Outcome_Code, Event_Type_Code, Location_ID, Occupational_Health_Regulations_ID, Start_Date, End_Date, Other_Details) values (7, 9, 14, 5, 5, '2024-05-11', 'error: Field ''this'' not found', 'Mandatory for all Employees');
insert into Events (Event_ID, Event_Outcome_Code, Event_Type_Code, Location_ID, Occupational_Health_Regulations_ID, Start_Date, End_Date, Other_Details) values (8, 1, 13, 12, 16, '2024-07-11', 'error: Field ''this'' not found', 'Held Virtually Via Teams');
insert into Events (Event_ID, Event_Outcome_Code, Event_Type_Code, Location_ID, Occupational_Health_Regulations_ID, Start_Date, End_Date, Other_Details) values (9, 11, 8, 3, 4, '2025-01-20', 'error: Field ''this'' not found', 'Mandatory for all Employees');
insert into Events (Event_ID, Event_Outcome_Code, Event_Type_Code, Location_ID, Occupational_Health_Regulations_ID, Start_Date, End_Date, Other_Details) values (10, 14, 15, 15, 5, '2024-05-03', 'error: Field ''this'' not found', 'Includes Hands-On training Session');
insert into Events (Event_ID, Event_Outcome_Code, Event_Type_Code, Location_ID, Occupational_Health_Regulations_ID, Start_Date, End_Date, Other_Details) values (11, 13, 13, 6, 8, '2024-08-31', 'error: Field ''this'' not found', 'Follow-Up Required after Completion');
insert into Events (Event_ID, Event_Outcome_Code, Event_Type_Code, Location_ID, Occupational_Health_Regulations_ID, Start_Date, End_Date, Other_Details) values (12, 14, 5, 6, 13, '2024-12-25', 'error: Field ''this'' not found', 'Follow-Up Required after Completion');
insert into Events (Event_ID, Event_Outcome_Code, Event_Type_Code, Location_ID, Occupational_Health_Regulations_ID, Start_Date, End_Date, Other_Details) values (13, 6, 14, 11, 1, '2024-08-01', 'error: Field ''this'' not found', 'Includes Hands-On training Session');
insert into Events (Event_ID, Event_Outcome_Code, Event_Type_Code, Location_ID, Occupational_Health_Regulations_ID, Start_Date, End_Date, Other_Details) values (14, 2, 6, 14, 11, '2024-06-02', 'error: Field ''this'' not found', 'Mandatory for all Employees');
insert into Events (Event_ID, Event_Outcome_Code, Event_Type_Code, Location_ID, Occupational_Health_Regulations_ID, Start_Date, End_Date, Other_Details) values (15, 14, 13, 5, 10, '2024-10-17', 'error: Field ''this'' not found', 'Held Virtually Via Teams');
insert into Events (Event_ID, Event_Outcome_Code, Event_Type_Code, Location_ID, Occupational_Health_Regulations_ID, Start_Date, End_Date, Other_Details) values (16, 9, 10, 14, 7, '2024-11-12', 'error: Field ''this'' not found', 'On-Session at Main Office');

-- Services_In_Events
INSERT INTO Services_In_Events (Event_ID, Service_ID) VALUES (2, 3);
INSERT INTO Services_In_Events (Event_ID, Service_ID) VALUES (10, 6);
INSERT INTO Services_In_Events (Event_ID, Service_ID) VALUES (13, 2);
INSERT INTO Services_In_Events (Event_ID, Service_ID) VALUES (8, 5);
INSERT INTO Services_In_Events (Event_ID, Service_ID) VALUES (3, 4);
INSERT INTO Services_In_Events (Event_ID, Service_ID) VALUES (15, 14);
INSERT INTO Services_In_Events (Event_ID, Service_ID) VALUES (4, 7);
INSERT INTO Services_In_Events (Event_ID, Service_ID) VALUES (16, 2);
INSERT INTO Services_In_Events (Event_ID, Service_ID) VALUES (14, 2);
INSERT INTO Services_In_Events (Event_ID, Service_ID) VALUES (12, 9);
INSERT INTO Services_In_Events (Event_ID, Service_ID) VALUES (5, 8);
INSERT INTO Services_In_Events (Event_ID, Service_ID) VALUES (6, 12);
INSERT INTO Services_In_Events (Event_ID, Service_ID) VALUES (9, 6);
INSERT INTO Services_In_Events (Event_ID, Service_ID) VALUES (1, 1);
INSERT INTO Services_In_Events (Event_ID, Service_ID) VALUES (11, 8);
