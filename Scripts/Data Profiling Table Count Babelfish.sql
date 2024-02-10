--SET NOCOUNT ON;

DROP TABLE IF EXISTS #DataProfiling;
DROP TABLE IF EXISTS #DataProfilingSQL;
DROP TABLE IF EXISTS #DataProfilingObjects;
DROP TABLE IF EXISTS #DatabaseNames;
GO

----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

CREATE TABLE #DataProfilingSQL
(
DataProfilingType INTEGER NOT NULL,
OrderID           INTEGER NOT NULL,
SQLLine           VARCHAR(100) NOT NULL,
PRIMARY KEY (DataProfilingType, OrderID)
);
GO

CREATE TABLE #DataProfilingObjects
(
    RowNumber INT IDENTITY (1,1) PRIMARY KEY, -- Assuming RowNumber should be an auto-incrementing primary key
    ServerName SYSNAME,
    DB_NAME SYSNAME,
    SchemaName SYSNAME,
    TableName SYSNAME,
    RecordCount INTEGER,
    SQLString VARCHAR(5000)
);
GO

SELECT  *,
        0 AS IsCompleted
INTO    #DatabaseNames
--FROM    (VALUES('mydb1'),('mydb2')) AS db(DatabaseName);
--FROM    (VALUES('mydb1')) AS db(DatabaseName);
FROM    (VALUES('mydb2')) AS db(DatabaseName);
GO

-----------------------------------------------------------------------------
-----------------------------------------------------------------------------

--This SQL statement determines the record count of the column
INSERT INTO #DataProfilingSQL (DataProfilingType, OrderID, SQLLine) VALUES
(1,1,'UPDATE #DataProfilingObjects SET RecordCount ='),
(1,2,'('),
(1,3,'SELECT COUNT(*)'),
(1,4,'FROM DatabaseName.SchemaName.TableName'),
(1,5,')'),
(1,6,'WHERE RowNumber = vRowNumber');
GO

INSERT INTO #DataProfilingSQL (DataProfilingType, OrderID, SQLLine) VALUES
(2,1, 'INSERT INTO #DataProfilingObjects (ServerName, DB_NAME, SchemaName, TableName, SQLString)'),
(2,2, 'SELECT '),
(2,3, '@@SERVERNAME AS ServerName, '),
(2,4, 'DatabaseNameString AS DB_NAME, '),
(2,5, 's.[Name] AS SchemaName, '),
(2,6, 't.[Name] AS TableName,'),
(2,7, 'NULL AS SQLString'),
(2,8, 'FROM DatabaseName.sys.Schemas s INNER JOIN '),
(2,9,'DatabaseName.sys.Tables t ON s.Schema_id = t.Schema_id')
GO

------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------

DECLARE @vDatabaseName NVARCHAR(1000);
DECLARE @vSQLStatement NVARCHAR(1000);
DECLARE @vSQLStatementObjects NVARCHAR(1000);

SELECT TOP 1 @vDatabaseName = DatabaseName FROM #DatabaseNames WHERE IsCompleted = 0;

WHILE @@ROWCOUNT > 0
BEGIN

	SET @vSQLStatement = (SELECT STRING_AGG(SQLLine,' ') FROM #DataProfilingSQL WHERE DataProfilingType = 1); --default is 1
	SET @vSQLStatementObjects  = (SELECT STRING_AGG(SQLLine,' ') FROM #DataProfilingSQL WHERE DataProfilingType = 2); --default is 1
	
	
	SET @vSQLStatementObjects = REPLACE(@vSQLStatementObjects, 'DatabaseNameString', '''' + @vDatabaseName + '''');
	SET @vSQLStatementObjects = REPLACE(@vSQLStatementObjects,'DatabaseName',@vDatabaseName);
	PRINT('TEST');
	PRINT(@vSQLStatementObjects)
	EXEC (@vSQLStatementObjects);

    UPDATE #DataProfilingObjects SET SQLString = @vSQLStatement;
    UPDATE #DatabaseNames SET IsCompleted = 1 WHERE DatabaseName = @vDatabaseName;


SELECT TOP 1 @vDatabaseName = DatabaseName FROM #DatabaseNames WHERE IsCompleted = 0;
END;

-----------------------------------------------------------------
-----------------------------------------------------------------


DECLARE @vRowNumber INTEGER;
DECLARE @vdbName VARCHAR(8000);
DECLARE @vSchemaName VARCHAR(8000);
DECLARE @vTableName VARCHAR(8000);
DECLARE @vSQLStatement2 VARCHAR(8000);

DECLARE mycursor CURSOR FOR (SELECT RowNumber, DB_NAME, SchemaName, TableName, SQLString FROM #DataProfilingObjects);
OPEN mycursor;

FETCH NEXT FROM mycursor INTO @vRowNumber, @vdbName, @vSchemaName, @vTableName, @vSQLStatement2;
    WHILE @@FETCH_STATUS = 0
        BEGIN
        SET @vSQLStatement2 = REPLACE(@vSQLStatement2,'vRowNumber',@vRowNumber)
        SET @vSQLStatement2 = REPLACE(@vSQLStatement2,'DatabaseName',@vdbName)
        SET @vSQLStatement2 = REPLACE(@vSQLStatement2,'SchemaName',@vSchemaName)
        SET @vSQLStatement2 = REPLACE(@vSQLStatement2,'TableName',@vTableName)
		PRINT(@vSQLStatement2);
        EXEC (@vSQLStatement2);
        FETCH NEXT FROM mycursor INTO @vRowNumber, @vdbName, @vSchemaName, @vTableName, @vSQLStatement2;
        END;
CLOSE mycursor;
DEALLOCATE mycursor;

GO

SELECT * FROM #DataProfilingObjects ORDER BY RecordCount DESC, TableName;

--DROP TABLE IF EXISTS #DataProfiling;
--DROP TABLE IF EXISTS #DataProfilingSQL;
--DROP TABLE IF EXISTS #DataProfilingObjects;
--DROP TABLE IF EXISTS #DatabaseNames;
