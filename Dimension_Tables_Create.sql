
use nyc_crashes;
/*
DROP TABLE date_table;
DROP TABLE contribution_factor;
DROP TABLE vehicle;
DROP TABLE persons_dim;
DROP TABLE crashes_f;
*/

CREATE  TABLE nyc_crashes.date_table ( 
	date_id INT  NOT NULL     PRIMARY KEY,
	crash_date DATE  NOT NULL,
	crash_hour INT,
	crash_year INT,
	crash_month INT       
 );
 

 CREATE  TABLE nyc_crashes.contribution_factor ( 
	contribution_id      INT  NOT NULL     PRIMARY KEY,
	contribution_factor1 CHAR(100)       ,
	categorized_contributingfactor CHAR(50)       
 );
 
 
 CREATE  TABLE nyc_crashes.vehicle ( 
	vehicle_id INT  NOT NULL PRIMARY KEY references nyc_crashes.People(VehicleId),
	vehicle_type_code1   CHAR(100)       ,
	categorized_vehicletype CHAR(50)       
 ) ;



-- DROP TABLE persons_dim;
-- persons_dim

CREATE  TABLE nyc_crashes.persons_dim ( 
	person_id            CHAR(100)  NOT NULL     PRIMARY KEY references nyc_crashes.People(person_id),
	person_type          CHAR(50)       ,
	person_injury        CHAR(50)       ,
	person_age           INT       ,
	ped_role             CHAR(50)       ,
	person_sex           CHAR(1)       
 );

-- Fact Table Crashes
-- DROP TABLE nyc_crashes.crashes_f;
CREATE  TABLE nyc_crashes.crashes_f ( 
	Crash_Fact_Id INT NOT NULL PRIMARY KEY ,
	collision_id         INT  NOT NULL references nyc_crashes.crashes(CollisionId),
	date_id              INT  NOT NULL references nyc_crashes.date_table(date_id),
	Borough CHAR (100),
    Latitude CHAR(100),
    Longitude CHAR(100),
	person_id            CHAR(100)  NOT NULL references nyc_crashes.persons(person_id),
	contribution_id      INT  NOT NULL references nyc_crashes.contribution_factor(contribution_id),
	vehicle_id           INT  NOT NULL references nyc_crashes.vehicle(vehicle_id),
	number_of_persons_injured INT       ,
	number_of_persons_killed INT       ,
	number_of_pedestrians_injured INT       ,
	number_of_pedestrians_killed INT       ,
	number_of_cyclist_injured INT       ,
	number_of_cyclist_killed INT       ,
	number_of_motorist_injured INT       ,
	number_of_motorist_killed INT       
 );

 