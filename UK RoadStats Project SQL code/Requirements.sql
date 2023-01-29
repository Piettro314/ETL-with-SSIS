/*
PLAN FOR FACT TABLE (on 3-Day Project)
1) replace ALL nulls in your fact table with values (i.e. 0 for nulls in facts)
2) replace all text strings (Start_junction_road_name and End_junction_road_name) with 'N/A'
3) replace all Link_length_km and Link_length_miles with 0's as well Fields to Drop - don't include from stage to fact:
1) Easting
2) Northing
3) Road_name 
4) Start_junction_road_name
5) End_junction_road_name
6) Link_length_km
7) Link_length_miles 

Dimensions 5 :

1) Date / Calendar dim
2) Direction of Travel dim
3) Hour of day dim
4) Region Dim
4) Local Authority dim   (do local authority and region have a 1:n relationship? YES! if so collapse into one dim)
5) Road Category dim - see if Road Type roles up to Category (2 Level)
*) Lat and Long (do THEY roll up to a local authority? if SO move them to the Loc Auth dim - if not - leave in the fact table)
NOTE ANY NULLS need to be either N/A or 0 */

SELECT TOP (10)[Direction_of_travel]
      ,Cast([Count_date] as date) as 'Count_date'
      ,[hour]
      ,[Region_id]
      ,[Local_authority_id]
      ,rc.[Key_road_category] as 'Road_category_id'
      ,[Pedal_cycles]
      ,[Two_wheeled_motor_vehicles]
      ,[Cars_and_taxis]
      ,[Buses_and_coaches]
      ,[LGVs]
      ,[HGVs_2_rigid_axle]
      ,[HGVs_3_rigid_axle]
      ,[HGVs_4_or_more_rigid_axle]
      ,[HGVs_3_or_4_articulated_axle]
      ,[HGVs_5_articulated_axle]
      ,[HGVs_6_articulated_axle]
  FROM [RoadStatistics].[stg].[TrafficStats] t
	Inner join dim.roadcategory rc
		on t.Road_category = rc.road_category
