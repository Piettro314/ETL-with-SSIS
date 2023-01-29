GO---------------------------------------------------DIM DIRECTION-----------------1
IF NOT EXISTS(SELECT [TABLE_NAME] 
				FROM RoadStatistics.INFORMATION_SCHEMA.TABLES
				WHERE TABLE_TYPE = 'BASE TABLE' and TABLE_NAME = 'direction'
			 )
exec('CREATE TABLE dim.direction (
    [Key_direction_of_travel] int NOT NULL,
    [Direction_of_travel] varchar(1),
    [Direction_of_travel_full] varchar(8),

	CONSTRAINT PK_Direction PRIMARY KEY (Key_direction_of_travel ASC)
)'
);
GO
IF NOT EXISTS(SELECT [TABLE_NAME] 
				FROM RoadStatistics.INFORMATION_SCHEMA.TABLES
				WHERE TABLE_TYPE = 'BASE TABLE' and TABLE_NAME = 'dim_direction'
			 )
exec('CREATE TABLE err.dim_direction (
    [Key_direction_of_travel] int,
    [Direction_of_travel] varchar(1),
    [Direction_of_travel_full] varchar(8),
    [Local] datetime,
    [UTC] datetime,
    [Offset] int,
	[ErrorCode] int,
	[ErrorColumn] int,
)'
);
GO----------------------DIM HOUR----------------------------------------------------2
IF NOT EXISTS(SELECT [TABLE_NAME] 
				FROM RoadStatistics.INFORMATION_SCHEMA.TABLES
				WHERE TABLE_TYPE = 'BASE TABLE' and TABLE_NAME = 'hour'
			 )
exec('CREATE TABLE dim.hour (
    [Key_hour] bigint NOT NULL,
	[hour] bigint,
    [Time_Schedule] varchar(12),

	CONSTRAINT PK_hour PRIMARY KEY ([Key_hour] ASC)
)'
);
GO
IF NOT EXISTS(SELECT [TABLE_NAME] 
				FROM RoadStatistics.INFORMATION_SCHEMA.TABLES
				WHERE TABLE_TYPE = 'BASE TABLE' and TABLE_NAME = 'dim_hour'
			 )
exec('CREATE TABLE err.dim_hour (
    [Key_hour] bigint,
	[hour] bigint,
    [Time_Schedule] varchar(12),
    [Local] datetime,
    [UTC] datetime,
    [Offset] int,
	[ErrorCode] int,
	[ErrorColumn] int,
	
)'
);
GO--------------------------DIM LOCAL AUTHORITY---------------------------------------
IF NOT EXISTS(SELECT *
				FROM RoadStatistics.INFORMATION_SCHEMA.TABLES
				WHERE TABLE_TYPE = 'BASE TABLE' and TABLE_NAME = 'localauthority'
				)
exec('CREATE TABLE dim.localauthority (
    [key_Local_authority_id] bigint NOT NULL,
    [Local_authority_name] varchar(50),
    [Local_authority_code] varchar(25),
    [Local_authority_id] bigint,
    [Region_id] bigint,
    [Region_name] varchar(50),
    [Region_ons_code] varchar(50),

	CONSTRAINT PK_localauthorityID PRIMARY KEY (key_Local_authority_id ASC)
)'
);
GO
IF NOT EXISTS(SELECT *
				FROM RoadStatistics.INFORMATION_SCHEMA.TABLES
				WHERE TABLE_TYPE = 'BASE TABLE' and TABLE_NAME = 'dim_localauthority'
				)
exec('CREATE TABLE err.dim_localauthority (
    [key_Local_authority_id] bigint,
	[Local_authority_name] varchar(50),
    [Local_authority_code] varchar(25),
    [Local_authority_id] bigint,
    [Region_id] bigint,
    [Region_name] varchar(50),
    [Region_ons_code] varchar(50),
    [Local] datetime,
    [UTC] datetime,
    [Offset] int,
	[ErrorCode] int,
	[ErrorColumn] int
)'
);
GO ------------------------------DIM ROAD CATEGORY------------------------------------4
IF NOT EXISTS(SELECT *
				FROM RoadStatistics.INFORMATION_SCHEMA.TABLES
				WHERE TABLE_TYPE = 'BASE TABLE' and TABLE_NAME = 'roadcategory'
			)
exec('CREATE TABLE dim.roadcategory (
    [Key_road_category] int NOT NULL,
    [Key_road_type] int,
    [Road_category] varchar(25),
    [Catergory_description] varchar(33),
    [Road_type] varchar(25),


	Constraint PK_roadcategory PRIMARY KEY (Key_road_category ASC)
)'
);
GO
IF NOT EXISTS(SELECT *
				FROM RoadStatistics.INFORMATION_SCHEMA.TABLES
				WHERE TABLE_TYPE = 'BASE TABLE' and TABLE_NAME = 'dim_roadcategory'
			)
exec('CREATE TABLE err.dim_roadcategory (
    [Key_road_category] int,
    [Key_road_type] int,
    [Road_category] varchar(25),
    [Catergory_description] varchar(33),
    [Road_type] varchar(25),
	[Local] datetime,
    [UTC] datetime,
    [Offset] int,
	[ErrorCode] int,
	[ErrorColumn] int
	
)'
);
GO