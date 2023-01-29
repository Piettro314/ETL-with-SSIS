Select [hour] as 'Key_hour'
	  ,[hour]
	  ,(Case
			When [hour] = 0 Then  '12am to 1am'
			When [hour] = 1 Then  '1am to 2am'
			When [hour] = 3 Then  '3am to 4am'
			When [hour] = 4 Then  '4am to 5am'
			When [hour] = 5 Then  '5am to 6am'
			When [hour] = 7 Then  '7am to 8am'
			When [hour] = 8 Then  '8am to 9am'
			When [hour] = 9 Then  '9am to 10am'
			When [hour] = 10 Then '10am to 11am'
			When [hour] = 11 Then '11am to 12pm'
			When [hour] = 12 Then '12pm to 1pm'
			When [hour] = 13 Then '1pm to 2pm'
			When [hour] = 14 Then '2pm to 3pm'
			When [hour] = 15 Then '3pm to 4pm'
			When [hour] = 16 Then '4pm to 5pm'
			When [hour] = 17 Then '5pm to 6pm'
			When [hour] = 18 Then '6pm to 7pm'
		End) as 'Time_Schedule'
	  ,GETDATE () as 'Local'
	  ,GETUTCDATE () as 'UTC'
	  ,DATEDIFF(hh, GETUTCDATE(), GETDATE()) as 'Offset'
From [stg].[TrafficStats]
Group by hour
Order by 1

