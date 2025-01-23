-- Checking negartive assay results

SELECT SAMPLEID, HOLEID, PROJECTCODE, DespatchNo_DDD, PRIORITY,
       -- Check for Al2O3_XRF_pct
       CASE 
           WHEN [Al2O3_XRF_pct] < 0 THEN 'Negative'
           ELSE NULL 
       END AS [Al2O3_XRF_pct_Issue],

       -- Check for CaO_XRF_pct
       CASE 
           WHEN [CaO_XRF_pct] < 0 THEN 'Negative'
           ELSE NULL 
       END AS [CaO_XRF_pct_Issue],

       -- Check for Co_XRF_pct
       CASE 
           WHEN [Co_XRF_pct] < 0 THEN 'Negative'
           ELSE NULL 
       END AS [Co_XRF_pct_Issue],

       -- Check for Cr2O3_XRF_pct
       CASE 
           WHEN [Cr2O3_XRF_pct] < 0 THEN 'Negative'
           ELSE NULL 
       END AS [Cr2O3_XRF_pct_Issue],

       -- Check for Fe2O3_XRF_pct
       CASE 
           WHEN [Fe2O3_XRF_pct] < 0 THEN 'Negative'
           ELSE NULL 
       END AS [Fe2O3_XRF_pct_Issue],

       -- Check for K2O_XRF_pct
       CASE 
           WHEN [K2O_XRF_pct] < 0 THEN 'Negative'
           ELSE NULL 
       END AS [K2O_XRF_pct_Issue],

       -- Check for MgO_XRF_pct
       CASE 
           WHEN [MgO_XRF_pct] < 0 THEN 'Negative'
           ELSE NULL 
       END AS [MgO_XRF_pct_Issue],

       -- Check for MnO_XRF_pct
       CASE 
           WHEN [MnO_XRF_pct] < 0 THEN 'Negative'
           ELSE NULL 
       END AS [MnO_XRF_pct_Issue],

       -- Check for Na2O_XRF_pct
       CASE 
           WHEN [Na2O_XRF_pct] < 0 THEN 'Negative'
           ELSE NULL 
       END AS [Na2O_XRF_pct_Issue],

       -- Check for Ni_XRF_pct
       CASE 
           WHEN [Ni_XRF_pct] < 0 THEN 'Negative'
           ELSE NULL 
       END AS [Ni_XRF_pct_Issue],

       -- Check for P2O5_XRF_pct
       CASE 
           WHEN [P2O5_XRF_pct] < 0 THEN 'Negative'
           ELSE NULL 
       END AS [P2O5_XRF_pct_Issue],

       -- Check for S_XRF_pct
       CASE 
           WHEN [S_XRF_pct] < 0 THEN 'Negative'
           ELSE NULL 
       END AS [S_XRF_pct_Issue],

       -- Check for SiO2_XRF_pct
       CASE 
           WHEN [SiO2_XRF_pct] < 0 THEN 'Negative'
           ELSE NULL 
       END AS [SiO2_XRF_pct_Issue],

       -- Check for SiO2MgO_XRF_pct
       CASE 
           WHEN [SiO2MgO_XRF_pct] < 0 THEN 'Negative'
           ELSE NULL 
       END AS [SiO2MgO_XRF_pct_Issue],

       -- Check for TFe_XRF_pct
       CASE 
           WHEN [TFe_XRF_pct] < 0 THEN 'Negative'
           ELSE NULL 
       END AS [TFe_XRF_pct_Issue],

       -- Check for TiO2_XRF_pct
       CASE 
           WHEN [TiO2_XRF_pct] < 0 THEN 'Negative'
           ELSE NULL 
       END AS [TiO2_XRF_pct_Issue]

FROM [ACQ_WEDABAY].[dbo].[DASH_ASSAY]
WHERE 
    [Al2O3_XRF_pct] < 0 OR
    [CaO_XRF_pct] < 0 OR
    [Co_XRF_pct] < 0 OR
    [Cr2O3_XRF_pct] < 0 OR
    [Fe2O3_XRF_pct] < 0 OR
    [K2O_XRF_pct] < 0 OR
    [MgO_XRF_pct] < 0 OR
    [MnO_XRF_pct] < 0 OR
    [Na2O_XRF_pct] < 0 OR
    [Ni_XRF_pct] < 0 OR
    [P2O5_XRF_pct] < 0 OR
    [S_XRF_pct] < 0 OR
    [SiO2_XRF_pct] < 0 OR
    [SiO2MgO_XRF_pct] < 0 OR
    [TFe_XRF_pct] < 0 OR
    [TiO2_XRF_pct] < 0;
