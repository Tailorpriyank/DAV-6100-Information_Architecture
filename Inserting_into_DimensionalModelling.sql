

-- Insert data into Date Dimension Table
INSERT INTO nyc_crashes.date_table (date_id, crash_date, crash_hour, crash_year, crash_month)
SELECT DISTINCT
    ROW_NUMBER() OVER (ORDER BY CrashDate) AS location_id,
    CrashDate,
    EXTRACT(HOUR FROM CrashTime) AS crash_hour,
    EXTRACT(YEAR FROM CrashDate) AS crash_year,
    EXTRACT(MONTH FROM CrashDate) AS crash_month
FROM cleaned_crashesdata;

-- select * from nyc_crashes.date_table;


-- Insert data into Contributing Factor Dimension Table
INSERT INTO nyc_crashes.contribution_factor (contribution_id, contribution_factor1, categorized_contributingfactor)
SELECT DISTINCT
    ROW_NUMBER() OVER (ORDER BY ContributingFactorVehicle1) AS contribution_id, -- Generating a unique ID
    ContributingFactorVehicle1,
    Categorized_ContributingFactor
FROM (select distinct ContributingFactorVehicle1,Categorized_ContributingFactor from cleaned_crashesdata) a;

-- select * from nyc_crashes.contribution_factor;

-- Insert data into Vehicle Dimension Table
INSERT INTO nyc_crashes.vehicle (vehicle_id, vehicle_type_code1, categorized_vehicletype)
SELECT DISTINCT
	p.VehicleId AS vehicle_id,
    c.VehicleTypeCode1,
    c.Categorized_VehicleType
FROM cleaned_peopledata p
inner join cleaned_crashesdata c on p.CollisionId  = c.CollisionId;

-- Insert data into Persons Dimension Table
INSERT INTO nyc_crashes.persons_dim (person_id, person_type, person_injury, person_age, ped_role, person_sex)
SELECT DISTINCT
    PersonId AS person_id,
    PersonType,
    PersonInjury,
    CAST(PersonAge AS unsigned), -- Assuming you convert the float to an int
    PedRole,
    PersonSex
FROM cleaned_peopledata;

-- use nyc_crashes;

-- Insert data into the Crashes Fact Table
INSERT INTO nyc_crashes.crashes_f (Crash_Fact_Id,
	collision_id, Borough,Latitude,Longitude,date_id,  person_id, contribution_id, vehicle_id, 
	number_of_persons_injured,
    number_of_persons_killed,
    number_of_pedestrians_injured,
    number_of_pedestrians_killed,
    number_of_cyclist_injured,
    number_of_cyclist_killed,
    number_of_motorist_injured,
    number_of_motorist_killed)
SELECT 
	ROW_NUMBER() OVER (ORDER BY c.CollisionId) AS Crash_Fact_Id, -- Generating a unique ID
    c.CollisionId,
    c.Borough,
    c.Latitude,
    c.Longitude,
    d.date_id,
    p.PersonId,
    cf.contribution_id,
    v.vehicle_id,
    c.NumberOfPersonsInjured,
    c.NumberOfPersonsKilled,
    c.NumberOfPedestriansInjured,
    c.NumberOfPedestriansKilled,
    c.NumberOfCyclistInjured,
    c.NumberOfCyclistKilled,
    c.NumberOfMotoristInjured,
    c.NumberOfMotoristKilled

FROM 
    cleaned_crashesdata c
INNER JOIN 
    nyc_crashes.date_table d ON c.CrashDate = d.crash_date
INNER JOIN 
    nyc_crashes.cleaned_peopledata p ON c.CollisionId = p.CollisionId
INNER JOIN  
		nyc_crashes.contribution_factor cf ON c.ContributingFactorVehicle1 = cf.contribution_factor1
INNER JOIN 
    nyc_crashes.vehicle v ON c.VehicleTypeCode1 = v.vehicle_type_code1
limit 10;


