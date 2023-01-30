Alter table [f].[trafficUK]
Drop constraint [fk_date]
Alter table [f].[trafficUK]
Drop constraint[fk_directionoftravel]
Alter table [f].[trafficUK]
Drop constraint[fk_hour]
Alter table [f].[trafficUK]
Drop constraint[fk_localauthority]
Alter table [f].[trafficUK]
Drop constraint[fk_roadcategory]

Truncate Table [f].[trafficUK]
Truncate Table [dim].[direction]
Truncate Table [dim].[hour]
Truncate Table [dim].[localauthority]
Truncate Table [dim].[roadcategory]
Truncate Table [err].[dim_direction]
Truncate Table [err].[dim_hour]
Truncate Table [err].[dim_localauthority]
Truncate Table [err].[dim_roadcategory]






