-- CREATE DATABASE NYC_Crashes;

use NYC_Crashes;

-- SQL Script for creating table

CREATE TABLE Crashes (
    CollisionId INT,
    CrashDate DATE, -- Assuming the 'object' type for dates is formatted as 'YYYY-MM-DD'
    CrashTime TIME, -- Assuming the 'object' type for times is in 'HH:MM:SS' format
    CrashHour INT,
    CrashMonth VARCHAR(255), -- 'object' is a generic type which is usually mapped to a string in SQL
    Borough VARCHAR(255),
    ZipCode VARCHAR(255),
    Latitude FLOAT,
    Longitude FLOAT,
    Location VARCHAR(255), -- Assuming it's a string representation of a location
    NumberOfPersonsInjured INT,
    NumberOfPersonsKilled INT,
    NumberOfPedestriansInjured INT,
    NumberOfPedestriansKilled INT,
    NumberOfCyclistInjured INT,
    NumberOfCyclistKilled INT,
    NumberOfMotoristInjured INT,
    NumberOfMotoristKilled INT,
    ContributingFactorVehicle1 VARCHAR(255), -- 'object' suggests it could be a string
    VehicleTypeCode1 VARCHAR(255),
    Categorized_VehicleType VARCHAR(255),
    Categorized_ContributingFactor VARCHAR(255)
);


-- People
CREATE TABLE People (
    UniqueId INT,
    CollisionId INT,
    CrashDate VARCHAR(255), -- 'object' typically corresponds to a string; adjust size as needed
    CrashTime VARCHAR(255), -- same as above
    PersonId VARCHAR(255), -- assuming this is some kind of identifier stored as a string
    PersonType VARCHAR(255), -- categorical data, size depends on the potential values
    PersonInjury VARCHAR(255), -- same as above
    VehicleId FLOAT, -- assuming that VehicleId being a float is intentional, although it's unusual
    PersonAge FLOAT, -- age could be an INT, but if you have decimals, FLOAT is appropriate
    PedRole VARCHAR(255), -- categorical data
    PersonSex VARCHAR(255) -- categorical data
);