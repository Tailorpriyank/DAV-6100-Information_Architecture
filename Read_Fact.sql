
use nyc_crashes;

SELECT 
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



