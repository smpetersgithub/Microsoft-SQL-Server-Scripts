DROP TABLE IF EXISTS #databases;
DROP TABLE IF EXISTS #temp_script_parts;
DROP TABLE IF EXISTS #database_metadata;
GO

SELECT  database_id, name, CAST(NULL AS DATE) AS completeddate
INTO    #databases
FROM    sys.databases
WHERE   database_id > 4;
GO

CREATE TABLE #database_metadata (
    id INTEGER,
    database_name VARCHAR(1000),
    schema_name VARCHAR(1000),
    table_name VARCHAR(1000),
    column_name VARCHAR(1000),
    data_type VARCHAR(1000),
    definition VARCHAR(1000)
);
GO

CREATE TABLE #temp_script_parts
(
    id INT,
    script_part NVARCHAR(MAX)
);
GO

INSERT INTO #temp_script_parts (id, script_part) VALUES
    (0,  'INSERT INTO #database_metadata (database_name, schema_name, table_name, column_name, data_type, definition)'),
    (1,  'SELECT'),
    (2,  '@vdbName_qualified AS DatabaseName,'),
    (3,  'SCHEMA_NAME(o.schema_id) AS schema_name,'),
    (4,  'OBJECT_NAME(c.object_id) AS table_name,'),
    (5,  'c.name AS column_name,'),
    (6,  'TYPE_NAME(user_type_id) AS data_type,'),
    (7,  'definition'),
    (8,  'FROM'),
    (9,  '@vdbName.sys.computed_columns c'),
    (10,  'INNER JOIN'),
    (11, 'sys.objects o ON o.object_id = c.object_id;')
GO

DECLARE @DbId INT, @dbName NVARCHAR(1000), @sqlqry NVARCHAR(MAX);

SELECT  TOP 1
        @DbId = database_id,
        @dbName = name
FROM    #databases
WHERE   completeddate IS NULL;

WHILE @@ROWCOUNT > 0
BEGIN

    SELECT @sqlqry = STRING_AGG(script_part, ' ') FROM #temp_script_parts;

    SET @sqlqry = REPLACE(@sqlqry, '@vdbName_qualified', '''' + @dbName + '''');
    SET @sqlqry = REPLACE(@sqlqry, '@vdbName', @dbName);
    SET @sqlqry = REPLACE(@sqlqry, '@vDbId', CAST(@DbId AS NVARCHAR));
    PRINT @sqlqry;

    PRINT(GETDATE())
    EXEC sp_executesql @sqlqry;
    PRINT(GETDATE())

    UPDATE #databases SET completeddate = GETDATE() WHERE database_id = @DbId;

    SELECT  TOP 1
            @DbId = database_id,
            @dbName = name
    FROM #databases
    WHERE completeddate IS NULL;

END;
GO

SELECT * FROM #database_metadata;