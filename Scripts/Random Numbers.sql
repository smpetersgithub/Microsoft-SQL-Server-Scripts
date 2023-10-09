/*
Random Numbers

The following script creates a table (#RandomNumbers) of random numbers between 1 and 10
using the function ABS(CHECKSUM(NEWID()) % 10).

The loop below produces 10,000 random numbers ranging from 1 to 10 and subsequently displays 
the percentage distribution of these numbers to illustrate their randomness.
*/
DROP TABLE IF EXISTS #RandomNumbers;
GO
CREATE TABLE #RandomNumbers
(
MyRandomNumber INTEGER NOT NULL
);
GO
DECLARE @i INTEGER = 1;
DECLARE @loops INTEGER = 100000;
WHILE @i <= @loops
BEGIN
    INSERT INTO #RandomNumbers SELECT ABS(CHECKSUM(NEWID()) % 10) + 1;
    SET @i = @i + 1;
END
GO
----------------------------------------------------------------
----------------------------------------------------------------
WITH cte_Total AS
(
SELECT COUNT(MyRandomNumber) AS MyTotal FROM #RandomNumbers
),
cte_Count AS
(
SELECT  MyRandomNumber, COUNT(*) AS MyCount
FROM    #RandomNumbers a CROSS JOIN
        cte_Total b
GROUP BY MyRandomNumber
)
SELECT  MyRandomNumber, 
        MyCount, 
        MyCount / CAST(MyTotal AS NUMERIC(10,2))
FROM    cte_Count a CROSS JOIN
        cte_Total b;
GO
