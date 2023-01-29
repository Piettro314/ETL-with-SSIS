Select count(*) as '[dim].[direction]'
From [dim].[direction]

Select count(*) as 'dim].[hour]'
From [dim].[hour]

Select count(*) as '[dim].[localauthority]'
From [dim].[localauthority]

Select count(*) as '[dim].[roadcategory]'
From [dim].[roadcategory]

Select count(*) as 'Duplicate Dim_directions'
From err.dim_direction

Select count(*) as 'Duplicate dim_hour'
From [err].[dim_hour]

Select count(*) as 'Duplicate dim_localauthority'
From [err].[dim_localauthority]

Select count(*) as 'Duplicate dim_roadcategory'
From [err].[dim_roadcategory]

Select count(*) as 'Fact_Table'
From [f].[trafficUK]
