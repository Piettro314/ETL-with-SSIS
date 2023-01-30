Select count(*) as 'Duplicate Dim_directions'
From err.dim_direction

Select count(*) as 'Duplicate dim_hour'
From [err].[dim_hour]

Select count(*) as 'Duplicate dim_localauthority'
From [err].[dim_localauthority]

Select count(*) as 'Duplicate dim_roadcategory'
From [err].[dim_roadcategory]

Select count(*) as 'Total Records'
from [f].[trafficUK]