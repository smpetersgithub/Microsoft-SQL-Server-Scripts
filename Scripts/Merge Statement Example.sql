SET NOCOUNT ON
GO

DROP TABLE IF EXISTS #SourceTable;
DROP TABLE IF EXISTS #TargetTable;
GO

-- Source Table
CREATE TABLE #SourceTable (
    ID INT NOT NULL,
    TableType VARCHAR(10) NOT NULL,
    EmployeeName NVARCHAR(50) NOT NULL,
    Department VARCHAR(10) NOT NULL,
    ModifiedDate DATETIME DEFAULT GETDATE()
);
GO

-- Target Table
CREATE TABLE #TargetTable (
    ID INT NOT NULL,
    TableType VARCHAR(10) NULL,
    EmployeeName VARCHAR(50) NOT NULL,
    Department VARCHAR(10) NOT NULL,
    IsMatched SMALLINT DEFAULT 0,
    IsNotMatchedByTarget SMALLINT DEFAULT 0,
    IsNotMatchedBySource SMALLINT DEFAULT 0,
    ModifiedDate DATETIME DEFAULT GETDATE()
);
GO

-- INSERT statements for TargetTable
INSERT INTO #TargetTable (ID, TableType, EmployeeName, Department) VALUES (1, 'Target', 'Tommy Target', 'Accounting');
INSERT INTO #TargetTable (ID, TableType, EmployeeName, Department) VALUES (2, 'Target', 'Toni Target', 'Marketing');
INSERT INTO #TargetTable (ID, TableType, EmployeeName, Department) VALUES (4, 'Target', 'Trisha Target', 'IT');

-- INSERT statements for SourceTable
INSERT INTO #SourceTable (ID, TableType, EmployeeName, Department) VALUES (1, 'Source', 'Sally Source', 'Accounting');
INSERT INTO #SourceTable (ID, TableType, EmployeeName, Department) VALUES (2, 'Source', 'Sheila Source', 'Marketing');
INSERT INTO #SourceTable (ID, TableType, EmployeeName, Department) VALUES (3, 'Source', 'Sammy Source', 'Finance');
GO

--------------------------------------------------------------------

MERGE #TargetTable AS trgt
USING #SourceTable AS src
ON trgt.ID = src.ID AND trgt.ID > 0 AND src.ID > 0

WHEN MATCHED THEN
    UPDATE SET trgt.IsMatched = 1

WHEN NOT MATCHED BY TARGET AND src.ID > 0 THEN
    INSERT (ID, EmployeeName, Department, IsNotMatchedByTarget)
    VALUES (src.ID, src.EmployeeName, src.Department, 1)

WHEN NOT MATCHED BY SOURCE AND trgt.ID > 0 THEN
    UPDATE SET trgt.IsNotMatchedBySource = 1;

GO

SELECT * FROM #TargetTable;
GO
