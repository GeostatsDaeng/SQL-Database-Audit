Select HOLEID, CoordDate_Pickup, STARTDATE, ENDDATE, Contractor_Pickup, Surveyor_Pickup, Contractor_Drilling
FROM dbo.DCV_COLLAR_SUMMARY 
WHERE CAST (CoordDate_Pickup AS DATE) < CAST (STARTDATE AS DATE)
AND CAST (ENDDATE AS DATE) > '2024-01-01'

--Put contractor name here
--AND Contractor_Pickup = 'WBN'
