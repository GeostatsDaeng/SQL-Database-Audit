SELECT HOLEID, PROJECTCODE, PROSPECT, ENDDATE, Hole_TypeGroup, Sample_Type_D 
FROM DCV_COLLAR_SUMMARY
WHERE Hole_TypeGroup <> Sample_Type_D
AND Hole_TypeGroup = 'GC'  --<Optional
AND Sample_Type_D = 'Historic'  --<Optional
AND CAST (ENDDATE AS DATE) < '2019-1-1'  --<Optional
AND ENDDATE IS NOT NULL
ORDER BY HOLEID, PROJECTCODE, PROSPECT