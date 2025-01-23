SELECT HOLEID, COUNT(HOLEID) AS TOTAL
FROM DCV_COLLAR_SUMMARY
GROUP BY HOLEID
HAVING COUNT(HOLEID) > 1