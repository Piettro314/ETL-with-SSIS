Select distinct (case
			when Road_category = 'MB' then 2000
			when Road_category = 'MCU' then 3000
			when Road_category = 'PA' then 4000
			when Road_category = 'PM' then 5000
			when Road_category = 'TA' then 6000			
			when Road_category = 'TM' then 7000		end) as 'Key_road_category'
		,(case 
				When Road_type = 'Major' then 1
				When Road_type = 'Minor' then 0
			end) as 'Key_road_type'
		,Road_category
		,(case
			when Road_category = 'MB' then 'Class B road'
			when Road_category = 'MCU' then 'Class C road or Unclassified road'
			when Road_category = 'PA' then 'Class A Principal road'
			when Road_category = 'PM' then 'M or Class A Principal Motorway'
			when Road_category = 'TA' then 'Class A Trunk road'
			when Road_category = 'TM' then 'M or Class A Trunk Motorway'
		end) as 'Catergory_description'
	  ,Road_type
	  ,GETDATE () as 'Local'
	  ,GETUTCDATE () as 'UTC'
	  ,DATEDIFF(hh, GETUTCDATE(), GETDATE()) as 'Offset'
From [stg].[TrafficStats]
Order by 1