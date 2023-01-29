SELECT Count_point_id
	  ,cal.kDate
      ,h.Key_hour
	  ,d.[Key_direction_of_travel] 
      ,la.[key_Local_authority_id] as 'Key_Local_authority'
      ,rc.[Key_road_category]
	  ,CAST(t.Latitude as varchar) as 'Latitude'
	  ,CAST(t.Longitude as varchar) as 'Longitude'
      ,[Pedal_cycles]
      ,[Two_wheeled_motor_vehicles]
      ,ISNULL([Cars_and_taxis], 0) as 'Cars_and_taxis'
      ,ISNULL([Buses_and_coaches], 0) as 'Buses_and_coaches'
      ,[LGVs]
      ,ISNULL([HGVs_2_rigid_axle], 0) as 'HGVs_2_rigid_axle'
      ,ISNULL([HGVs_3_rigid_axle], 0) as 'HGVs_3_rigid_axle'
      ,ISNULL([HGVs_4_or_more_rigid_axle], 0) as 'HGVs_4_or_more_rigid_axle'
      ,ISNULL([HGVs_3_or_4_articulated_axle], 0) as 'HGVs_3_or_4_articulated_axle'
      ,[HGVs_5_articulated_axle]
      ,ISNULL([HGVs_6_articulated_axle], 0) as 'HGVs_6_articulated_axle'
FROM [RoadStatistics].[stg].[TrafficStats] t
	Inner join dim.direction d
		on t.Direction_of_travel = d.Direction_of_travel
	Inner join dim.roadcategory rc
		on t.Road_category = rc.Road_category
	Inner join dim.localauthority la
		on t.Local_authority_id = la.key_Local_authority_id
	Inner join dim.Calendar cal
		on cal.Date = t.Count_date
	Inner join dim.hour h
		on t.hour = h.Key_hour


