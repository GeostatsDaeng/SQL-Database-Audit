-- Auditing CODE of Major and Minor on sample log.

SELECT [SAMPLEID]
      ,[HOLEID]
      ,[PROJECTCODE]
      ,[DespatchNo_DDD]
      ,[PRIORITY]
      ,[SAMPLETYPE]
      ,[SAMPFROM]
      ,[SAMPTO]
      ,[Samp_Depth]
      ,[Samp_Length]
      ,[Geo_LoggedBy]
	  ,[Geo_LoggedDate]
      ,[MajorLith]
      ,[MinorLith]
      ,[Rock_pct]
      ,[RockType]
      ,[Ore_Limit_D]
  FROM [ACQ_WEDABAY].[dbo].[AM_AUDIT_CODE]
  WHERE 
      CAST([Geo_LoggedDate] AS DATE) BETWEEN '2023-01-01' AND '2024-12-12'		--<<<<<<< SELECT SPESIFIC DATE
	  AND [SAMPLETYPE] IN ('RDP', 'GC')											--<<<<<<< SELECT SPESIFIC SAMPLETYPE


      AND ([MajorLith] NOT IN ('OB', 'LIM', 'TRP', 'FSAP', 'RSAP', 'SAP', 'BRK', 'CST') 
      OR [MinorLith] NOT IN ('OB', 'LIM', 'TRP', 'FSAP', 'RSAP', 'SAP', 'BRK', 'CST', 'RZ'))