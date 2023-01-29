GO -------------------Fact table-------------------
IF NOT EXISTS(SELECT *
				FROM [RoadStatistics].INFORMATION_SCHEMA.TABLES
				WHERE TABLE_TYPE = 'BASE TABLE' and TABLE_NAME = 'trafficUK'
			)
exec('CREATE TABLE f.trafficUK (
    [Count_point_id] bigint,
    [kDate] int,
    [Key_hour] bigint,
    [Key_direction_of_travel] int,
    [Key_Local_authority] bigint,
    [Key_road_category] int,
    [Latitude] varchar(30),
    [Longitude] varchar(30),
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

    CONSTRAINT fk_date FOREIGN KEY (kDate)
	REFERENCES [dim].[Calendar] (kDate),
    
	CONSTRAINT fk_hour FOREIGN KEY ([Key_hour])
    REFERENCES [dim].[hour] ([Key_hour]),

	CONSTRAINT fk_directionoftravel FOREIGN KEY (key_Direction_of_travel)
    REFERENCES [dim].[direction]([Key_direction_of_travel]),

	CONSTRAINT fk_localauthority FOREIGN KEY (Key_Local_authority)
    REFERENCES [dim].[localauthority]([key_Local_authority_id]),

	CONSTRAINT fk_roadcategory FOREIGN KEY (Key_road_category)
    REFERENCES [dim].[roadcategory]([Key_road_category])
)'
);
GO
truncate table [f].[trafficUK]
GO


