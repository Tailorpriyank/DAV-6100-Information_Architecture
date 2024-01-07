

use nyc_Crashes;
-- Delete from Crashes;


INSERT INTO Crashes (
    CollisionId, CrashDate, CrashTime, CrashHour, CrashMonth, Borough, ZipCode, 
    Latitude, Longitude, Location, NumberOfPersonsInjured, NumberOfPersonsKilled, 
    NumberOfPedestriansInjured, NumberOfPedestriansKilled, NumberOfCyclistInjured, 
    NumberOfCyclistKilled, NumberOfMotoristInjured, NumberOfMotoristKilled, 
    ContributingFactorVehicle1, VehicleTypeCode1, Categorized_VehicleType, 
    Categorized_ContributingFactor
) VALUES
(1, '2023-01-01', '08:00:00', 8, 'January', 'Manhattan', '10001', 40.7128, -74.0060, '40.7128,-74.0060', 1, 0, 0, 0, 1, 0, 0, 0, 'Unspecified', 'Sedan', 'Car', 'Human Error'),
(2, '2023-01-02', '09:30:00', 9, 'January', 'Brooklyn', '11201', 40.6782, -73.9442, '40.6782,-73.9442', 0, 0, 2, 0, 0, 0, 0, 0, 'Driver Inattention/Distraction', 'SUV', 'Car', 'Distraction'),
(3, '2023-01-03', '10:15:00', 10, 'January', 'Queens', '11354', 40.7934, -73.4151, '40.7934,-73.4151', 2, 1, 0, 1, 0, 0, 1, 0, 'Failure to Yield Right-of-Way', 'Truck', 'Heavy Vehicle', 'Negligence'),
(4, '2023-01-04', '11:00:00', 11, 'January', 'Bronx', '10453', 40.8467, -73.9093, '40.8467,-73.9093', 1, 0, 1, 0, 0, 0, 0, 0, 'Backing Unsafely', 'Motorcycle', 'Bike', 'Human Error'),
(5, '2023-01-05', '12:45:00', 12, 'January', 'Staten Island', '10301', 40.5795, -74.1502, '40.5795,-74.1502', 0, 0, 0, 0, 0, 0, 0, 0, 'Lost Consciousness', 'Bicycle', 'Bike', 'Health Issue'),
(6, '2023-01-06', '13:20:00', 13, 'January', 'Manhattan', '10002', 40.7150, -73.9843, '40.7150,-73.9843', 1, 0, 0, 0, 0, 1, 1, 0, 'Prescription Medication', 'Sedan', 'Car', 'Health Issue'),
(7, '2023-01-07', '14:00:00', 14, 'January', 'Brooklyn', '11215', 40.6620, -73.9870, '40.6620,-73.9870', 3, 0, 1, 0, 0, 0, 2, 0, 'Alcohol Involvement', 'Pickup Truck', 'Car', 'Intoxication'),
(8, '2023-01-08', '15:30:00', 15, 'January', 'Queens', '11377', 40.7467, -73.9188, '40.7467,-73.9188', 0, 0, 0, 0, 1, 0, 0, 0, 'Outside Car Distraction', 'Taxi', 'Car', 'Distraction');


INSERT INTO People (
    UniqueId, CollisionId, CrashDate, CrashTime, PersonId, PersonType, 
    PersonInjury, VehicleId, PersonAge, PedRole, PersonSex
) VALUES
(101, 1, '2023-01-01', '08:00:00', 101, 'Driver', 'None', 1.01, 30, 'Not Applicable', 'M'),
(102, 1, '2023-01-01', '08:00:00', 102, 'Passenger', 'Injured', 1.01, 25, 'Not Applicable', 'F'),
(103, 2, '2023-01-02', '09:30:00', 103, 'Pedestrian', 'Injured', 2.02, 40, 'Crosswalk', 'F'),
(104, 3, '2023-01-03', '10:15:00', 104, 'Cyclist', 'Killed', 3.03, 22, 'Bike Lane', 'M'),
(105, 4, '2023-01-04', '11:00:00', 105, 'Driver', 'None', 4.04, 45, 'Not Applicable', 'M'),
(106, 5, '2023-01-05', '12:45:00', 106, 'Pedestrian', 'None', 5.05, 50, 'Sidewalk', 'F'),
(107, 6, '2023-01-06', '13:20:00', 107, 'Driver', 'Injured', 6.06, 35, 'Not Applicable', 'F'),
(108, 7, '2023-01-07', '14:00:00', 108, 'Passenger', 'None', 7.07, 28, 'Not Applicable', 'M'),
(109, 8, '2023-01-08', '15:30:00', 109, 'Cyclist', 'Injured', 8.08, 32, 'Bike Lane', 'F'),
(110, 9, '2023-01-09', '16:45:00', 110, 'Pedestrian', 'None', 9.09, 21, 'Crosswalk', 'M');