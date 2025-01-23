-- Hole canceled but drilled at the same time. Need to be validated by Operational Geologist.


SELECT [HOLEID]
      ,[PROJECTCODE]
      ,[PROSPECT]
      ,[HOLETYPE]
      ,[Hole_TypeGroup]
      ,[Drill_Space]
      ,[WGS8452N_Plan_X]
      ,[WGS8452N_Plan_Y]
      ,[WGS8452N_Plan_Z]
      ,[WGS8452N_Stakeout_X]
      ,[WGS8452N_Stakeout_Y]
      ,[WGS8452N_Stakeout_Z]
      ,[Deviation_Stakeout_Plan_m]
      ,[WGS8452N_Surv_X]
      ,[WGS8452N_Surv_Y]
      ,[WGS8452N_Surv_Z]
      ,[Deviation_Pickup_Plan_m]
      ,[Contractor_Stakeout]
      ,[Stakeout_Tool]
      ,[CoordDate_Stakeout]
      ,[Surveyor_Stakeout]
      ,[Stakeout_Comments]
      ,[Contractor_Pickup]
      ,[Pickup_Tool]
      ,[CoordDate_Pickup]
      ,[Surveyor_Pickup]
      ,[Pickup_Comments]
      ,[Cancel_Date]
      ,[Cancel_GeosWBN]
      ,[Cancel_GeoContractor]
      ,[Cancel_Comments]
      ,[ENDDATE]
      ,[DEPTH]
      ,[Sample_Type_D]
      ,[Contractor_Drilling]
      ,[Validation_Status]
  FROM [ACQ_WEDABAY].[dbo].[DASH_COLLAR]

  WHERE 
  ([Cancel_Date]  IS NOT NULL
  OR [Cancel_GeosWBN]  IS NOT NULL
  OR [Cancel_GeoContractor] IS NOT NULL
  OR [Cancel_Comments] IS NOT NULL)
  AND 
  ([ENDDATE] IS NOT NULL
  OR DEPTH IS NOT NULL)
