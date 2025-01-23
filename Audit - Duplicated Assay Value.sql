WITH
ConcatCheck AS (
    SELECT 
        [HOLEID],
		[SAMPLEID],
        [PROJECTCODE],
        [DespatchNo_DDD],
        [PRIORITY],
        [Al2O3_XRF_pct],
        [Fe2O3_XRF_pct],
        [MgO_XRF_pct],
        [SiO2_XRF_pct],
        CONCAT(
            CAST([Al2O3_XRF_pct] AS NVARCHAR), '|',
            CAST([Fe2O3_XRF_pct] AS NVARCHAR), '|',
            CAST([MgO_XRF_pct] AS NVARCHAR), '|',
            CAST([SiO2_XRF_pct] AS NVARCHAR)
        ) AS CONCATELEMENT
    FROM [ACQ_WEDABAY].[dbo].[DASH_ASSAY]
),

DuplicateConcat AS (
    SELECT 
        CONCATELEMENT,
        COUNT(*) AS DuplicateCount
    FROM ConcatCheck
    GROUP BY CONCATELEMENT
    HAVING COUNT(*) > 1
)

SELECT 
    CC.[HOLEID],
	CC.[SAMPLEID],
    CC.[PROJECTCODE],
    CC.[DespatchNo_DDD] DESPATCHNO,
    DR.LABJOBNO,
    CC.[PRIORITY],
    CC.[Al2O3_XRF_pct],
    CC.[Fe2O3_XRF_pct],
    CC.[MgO_XRF_pct],
    CC.[SiO2_XRF_pct],
    CC.CONCATELEMENT,
    CAST(DR.RETURNDATE AS DATE) RETURNDATE,
    DR.COMMENTS
FROM ConcatCheck CC
INNER JOIN DuplicateConcat DC
    ON CC.CONCATELEMENT = DC.CONCATELEMENT
LEFT JOIN DESPATCHRETURN DR
    ON CC.DespatchNo_DDD = DR.DESPATCHNO

-- CHANGE THE DATE TO SHOW SPECIFIC TIME
WHERE CAST(DR.RETURNDATE AS DATE) >= '2024-01-01'  --<<<<<<< CHANGE THE DATE TO SHOW SPECIFIC TIME <<<<<<<--

ORDER BY CC.CONCATELEMENT, CC.[HOLEID];
