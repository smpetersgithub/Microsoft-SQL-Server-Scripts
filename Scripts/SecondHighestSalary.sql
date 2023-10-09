/*
Different SQL statements to determine second highest salary.
*/

DROP TABLE IF EXISTS #Employees;
GO

CREATE TABLE #Employees (
EmployeeID INT PRIMARY KEY,
EmployeeName VARCHAR(50),
TotalPurchaseAmount MONEY
);

INSERT INTO #Employees (EmployeeID, EmployeeName, TotalPurchaseAmount)
VALUES
(1, 'Carl Friedrich Gauss', 100000.00),
(2, 'Archimedes', 250000.00),
(3, 'Albert Einstein', 150000.00),
(4, 'Leonhard Euler', 100000.00);

--------------------------------------------
--------------------------------------------
--------------------------------------------
--Version 1
--RANK
WITH cte_Rank AS
(
SELECT  RANK() OVER (ORDER BY TotalPurchaseAmount DESC) AS MyRank,
        *
FROM    #Employees
)
SELECT  *
FROM    cte_Rank
WHERE   MyRank = 2;

--Version 2
--Top 1 and Max
SELECT  TOP 1 *
FROM    #Employees
WHERE   TotalPurchaseAmount <> (SELECT MAX(TotalPurchaseAmount) FROM #Employees)
ORDER BY TotalPurchaseAmount DESC;

--Version 3
--Offset and Fetch
SELECT  *
FROM    #Employees
ORDER BY TotalPurchaseAmount DESC
OFFSET 1 ROWS
FETCH NEXT 1 ROWS ONLY;

--Version 4
--Top 1 and Top 2
SELECT  TOP 1 *
FROM    (
        SELECT  TOP 2 *
        FROM    #Employees
        ORDER BY TotalPurchaseAmount DESC
        ) a
ORDER BY TotalPurchaseAmount ASC;

--Version 5
--Min and Top 2
WITH cte_TopMin AS
(
SELECT  MIN(TotalPurchaseAmount) AS MinTotalPurchaseAmount
FROM   (
       SELECT  TOP 2 *
       FROM    #Employees
       ORDER BY TotalPurchaseAmount DESC
       ) a
)
SELECT  *
FROM    #Employees
WHERE   TotalPurchaseAmount IN (SELECT MinTotalPurchaseAmount FROM cte_TopMin);

--Version 6
--Correlated Sub-Query
SELECT  *
FROM    #Employees a
WHERE   2 = (SELECT COUNT(DISTINCT b.TotalPurchaseAmount)
             FROM #Employees b
             WHERE a.TotalPurchaseAmount <= b.TotalPurchaseAmount);

--Version 7
--Top 1 and Lag
WITH cte_LeadLag AS
(
SELECT  *,
        LAG(TotalPurchaseAmount, 1, NULL) OVER (ORDER BY TotalPurchaseAmount DESC) AS PreviousAmount
FROM    #Employees
)
SELECT  TOP 1 *
FROM    cte_LeadLag
WHERE   PreviousAmount IS NOT NULL
ORDER BY TotalPurchaseAmount DESC;
