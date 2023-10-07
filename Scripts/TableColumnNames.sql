/*
Table Column Names

This script searches for schemas, tables, columns, and data types within a database.
Add the predicate logic you are searching for.
*/

--sys.schemas
--sys.tables
SELECT  @@SERVERNAME as ServerName,
        s.name AS SchemaName,
        t.name AS TableName
FROM    sys.schemas s LEFT OUTER JOIN
        sys.tables t ON s.schema_id = t.schema_id
WHERE   1=1
ORDER BY 1,2,3;

--sys.schemas
--sys.tables
--sys.columns
--sys.types
SELECT  @@SERVERNAME as ServerName,
        s.name AS SchemaName, 
        t.name AS TableName, 
        c.name AS ColumnName, 
        ty.name as DataType,
        CONCAT('SELECT * FROM ',s.name,'.',t.name,';') as QuickQuery
FROM    sys.schemas s LEFT OUTER JOIN
        sys.tables t ON s.schema_id = t.schema_id INNER JOIN
        sys.columns c ON t.object_id = c.object_id INNER JOIN
        sys.types ty ON ty.user_type_id = c.user_type_id
WHERE   1=1
ORDER BY 1,2,3,4;
