-- Check sample chain of custody enrtered before drilling finished.

  SELECT 
        HOLEID,
        PROJECTCODE,
        Contractor_Drilling,
        CAST(ENDDATE AS DATE) AS ENDDATE,
        CAST(Con_Sent_WBN_Date AS DATE) AS Con_Sent_WBN_Date,
        CAST(At_Sample_House_Date AS DATE) AS At_Sample_House_Date
    FROM (
        SELECT TOP 100 PERCENT *
        FROM (
            SELECT TOP 100 PERCENT *
            FROM (
                SELECT 
                    [HOLELOCATION].[HOLEID], 
                    [HOLELOCATION].[PROJECTCODE], 
                    [HOLELOCATION].[HOLETYPE], 
                    [HOLEDETAILS].[Contractor_Drilling], 
                    [HOLELOCATION].[ENDDATE], 
                    [HOLEDETAILS].[Con_Sent_WBN_Date], 
                    [HOLEDETAILS].[At_Sample_House_Date], 
                    [HOLEDETAILS].[Con_Sample_Status]
                FROM [HOLELOCATION]
                INNER JOIN (
                    SELECT * FROM [HOLELOCATION]
                ) AS [CollarWSF]
                ON [CollarWSF].[HOLEID] = [HOLELOCATION].[HOLEID] 
                    AND [CollarWSF].[PROJECTCODE] = [HOLELOCATION].[PROJECTCODE]
                LEFT JOIN (
                    SELECT 
                        [HOLEDETAILS].[HOLEID], 
                        [HOLEDETAILS].[PROJECTCODE], 
                        MIN(CASE WHEN [HOLEDETAILS].[NAME] = 'Contractor_Drilling' THEN [HOLEDETAILS].[VALUE] ELSE NULL END) AS [Contractor_Drilling], 
                        MIN(CASE WHEN [HOLEDETAILS].[NAME] = 'Con_Sent_WBN_Date' THEN [HOLEDETAILS].[VALUE] ELSE NULL END) AS [Con_Sent_WBN_Date], 
                        MIN(CASE WHEN [HOLEDETAILS].[NAME] = 'At_Sample_House_Date' THEN [HOLEDETAILS].[VALUE] ELSE NULL END) AS [At_Sample_House_Date], 
                        MIN(CASE WHEN [HOLEDETAILS].[NAME] = 'Con_Sample_Status' THEN [HOLEDETAILS].[VALUE] ELSE NULL END) AS [Con_Sample_Status]
                    FROM [HOLEDETAILS]
                    WHERE [HOLEDETAILS].[NAME] IN ('Contractor_Drilling', 'Con_Sent_WBN_Date', 'At_Sample_House_Date', 'Con_Sample_Status')
                    GROUP BY [HOLEDETAILS].[PROJECTCODE], [HOLEDETAILS].[HOLEID]
                ) [HOLEDETAILS]
                ON [HOLELOCATION].[PROJECTCODE] = [HOLEDETAILS].[PROJECTCODE] 
                    AND [HOLELOCATION].[HOLEID] = [HOLEDETAILS].[HOLEID]
            ) [ACQTMP]
        ) AS [TMPVIEW4]
    ) AS SourceData
    WHERE 
        CAST(ENDDATE AS DATE) >= '2024-01-01'      --<<<<<<< SET THE SPESIFIC DATE HERE <<<<<<<--
        AND ENDDATE IS NOT NULL
        AND Con_Sent_WBN_Date IS NOT NULL
        AND At_Sample_House_Date IS NOT NULL
        AND (CAST(ENDDATE AS DATE) > CAST(Con_Sent_WBN_Date AS DATE)
        OR CAST(ENDDATE AS DATE) > CAST(At_Sample_House_Date AS DATE)
        OR CAST(Con_Sent_WBN_Date AS DATE) > CAST(At_Sample_House_Date AS DATE))