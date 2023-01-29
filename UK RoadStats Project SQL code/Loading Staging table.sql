GO
IF NOT EXISTS(SELECT * 
				FROM RoadStatistics.INFORMATION_SCHEMA.TABLES
				WHERE TABLE_TYPE = 'BASE TABLE' and TABLE_NAME = 'TrafficStats'
			 )
exec('CREATE TABLE stg.TrafficStats (
    [Count_point_id] bigint,
    [Direction_of_travel] varchar(1),
    [Year] bigint,
    [Count_date] datetime,
    [hour] bigint,
    [Region_id] bigint,
    [Region_name] varchar(50),
    [Region_ons_code] varchar(50),
    [Local_authority_id] bigint,
    [Local_authority_name] varchar(50),
    [Local_authority_code] varchar(25),
    [Road_name] varchar(25),
    [Road_category] varchar(25),
    [Road_type] varchar(25),
    [Start_junction_road_name] varchar(255),
    [End_junction_road_name] varchar(255),
    [Easting] bigint,
    [Northing] bigint,
    [Latitude] float,
    [Longitude] float,
    [Link_length_km] float,
    [Link_length_miles] float,
    [Pedal_cycles] bigint,
    [Two_wheeled_motor_vehicles] bigint,
    [Cars_and_taxis] bigint,
    [Buses_and_coaches] bigint,
    [LGVs] bigint,
    [HGVs_2_rigid_axle] bigint,
    [HGVs_3_rigid_axle] bigint,
    [HGVs_4_or_more_rigid_axle] bigint,
    [HGVs_3_or_4_articulated_axle] bigint,
    [HGVs_5_articulated_axle] bigint,
    [HGVs_6_articulated_axle] bigint,
    [All_HGVs] bigint,
    [All_motor_vehicles] bigint
)'
);

GO
TRUNCATE TABLE stg.TrafficStats;
GO