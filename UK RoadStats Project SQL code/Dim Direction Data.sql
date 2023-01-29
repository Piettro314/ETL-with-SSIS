SELECT Distinct (Case
			When Direction_of_travel = 'N'	Then 100
			When Direction_of_travel = 'S'	Then 200
			When Direction_of_travel = 'E'	Then 300
			When Direction_of_travel = 'W'	Then 400
			When Direction_of_travel = 'C' or  Direction_of_travel = 'J' Then 500
		End) as 'Key_direction_of_travel'
	  ,IIF(Direction_of_travel = 'J', 'C', Direction_of_travel) as 'Direction_of_travel'
	  ,(Case
			When Direction_of_travel = 'N'	Then 'North'
			When Direction_of_travel = 'S'	Then 'South'
			When Direction_of_travel = 'E'	Then 'East'
			When Direction_of_travel = 'W'	Then 'West'
			When Direction_of_travel = 'C' or  Direction_of_travel = 'J' Then 'Combined'
		End) as 'Direction_of_travel_full'
	  ,GETDATE () as 'Local'
	  ,GETUTCDATE () as 'UTC'
	  ,DATEDIFF(hh, GETUTCDATE(), GETDATE()) as 'Offset'
FROM [stg].[TrafficStats]
Group by Direction_of_travel