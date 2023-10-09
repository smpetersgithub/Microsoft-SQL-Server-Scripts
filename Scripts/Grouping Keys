DROP TABLE IF EXISTS #Groupings;
GO

CREATE TABLE #Groupings
(
StepNumber  INTEGER PRIMARY KEY,
TestCase    VARCHAR(100) NOT NULL,
[Status]    VARCHAR(100) NOT NULL
);
GO

INSERT INTO #Groupings (StepNumber, TestCase, [Status]) VALUES
(1,'Test Case 1','Passed'),
(2,'Test Case 2','Passed'),
(3,'Test Case 3','Passed'),
(4,'Test Case 4','Passed'),
(5,'Test Case 5','Failed'),
(6,'Test Case 6','Failed'),
(7,'Test Case 7','Failed'),
(8,'Test Case 8','Failed'),
(9,'Test Case 9','Failed'),
(10,'Test Case 10','Passed'),
(11,'Test Case 11','Passed'),
(12,'Test Case 12','Passed');
GO

--Solution 1
WITH cte_Groupings AS
(
SELECT  StepNumber,
        [Status],
        StepNumber - ROW_NUMBER() OVER (PARTITION BY [Status] ORDER BY StepNumber) AS Rnk
FROM    #Groupings
)
SELECT  MIN(StepNumber) AS MinStepNumber,
        MAX(StepNumber) AS MaxStepNumber,
        [Status],
        COUNT(*) AS ConsecutiveCount,
        MAX(StepNumber) - MIN(StepNumber) + 1 AS ConsecutiveCount_MinMax
FROM    cte_Groupings
GROUP BY Rnk,
        [Status]
ORDER BY 1, 2;
GO

--Solution 2
WITH cte_Lag AS
(
SELECT  *,
        LAG([Status]) OVER(ORDER BY StepNumber) AS PreviousStatus
FROM    #Groupings
),
cte_Groupings AS
(
SELECT  *,
        SUM(CASE WHEN PreviousStatus <> [Status] THEN 1 ELSE 0 END) OVER (ORDER BY StepNumber) AS GroupNumber
FROM    cte_Lag
)
SELECT  MIN(StepNumber) AS MinStepNumber,
        MAX(StepNumber) AS MaxStepNumber,
        [Status],
        COUNT(*) AS ConsecutiveCount,
        MAX(StepNumber) - MIN(StepNumber) + 1 AS ConsecutiveCount_MinMax
FROM    cte_Groupings
GROUP BY [Status], GroupNumber
GO
