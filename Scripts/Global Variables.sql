/*
The functions that start with @@ in SQL Server are called Global Variables or System Functions.

These functions return information that is specific to the server or a current session, like session-level settings, server configuration, or current status. 

System Functions are similar to functions but don't require parentheses when calling them.

Examples include @@VERSION, which returns the current version of SQL Server, and @@SPID, which returns the session ID for the current user process. 

These system functions are useful for diagnostic purposes, configuration checks, or to control flow within stored procedures and scripts.
*/

-----------------------------------------------------------
-----------------------------------------------------------
-----------------------------------------------------------
--System
--https://learn.microsoft.com/en-us/sql/t-sql/functions/system-functions-transact-sql?view=sql-server-ver16

SELECT 'System' AS MyFunctionType,  '@@DEF_SORTORDER_ID'  AS MyFunction, @@DEF_SORTORDER_ID AS MyValue, 'No Microsoft documentation provided. Same as SELECT SERVERPROPERTY(SqlSortOrder);' AS Description
UNION
SELECT 'System', '@@ERROR', @@ERROR, 'Returns the error number for the last Transact-SQL statement executed.'
UNION
SELECT 'System', '@@IDENTITY', @@IDENTITY, 'Is a system function that returns the last-inserted identity value.'
UNION
SELECT 'System', '@@PACK_RECEIVED', @@PACK_RECEIVED, 'Returns the number of input packets read from the network by SQL Server since it was last started.'
UNION
SELECT 'System', '@@ROWCOUNT', @@ROWCOUNT, 'Returns the number of rows affected by the last statement. If the number of rows is more than 2 billion, use ROWCOUNT_BIG function.'
UNION
SELECT 'System', '@@TRANCOUNT', @@TRANCOUNT, 'Returns the number of BEGIN TRANSACTION statements that have occurred on the current connection.'
;
-----------------------------------------------------------
-----------------------------------------------------------
-----------------------------------------------------------
--Configuration
--https://learn.microsoft.com/en-us/sql/t-sql/functions/configuration-functions-transact-sql?view=sql-server-ver16

SELECT 'Configuration' AS MyFunctionType, '@@DBTS' AS MyFunction, CAST(@@DBTS AS VARCHAR(255)) AS MyValue, 'This function returns the value of the current timestamp data type for the current database.' AS MyDescription
UNION
SELECT 'Configuration', '@@LANGID', CAST(@@LANGID AS VARCHAR(255)), 'Returns the local language identifier (ID) of the language that is currently being used.'
UNION
SELECT 'Configuration', '@@LANGUAGE', CAST(@@LANGUAGE AS VARCHAR(255)), 'Returns the name of the language currently being used.'
UNION
SELECT 'Configuration', '@@LOCK_TIMEOUT', CAST(@@LOCK_TIMEOUT AS VARCHAR(255)), 'Returns the current lock time-out setting in milliseconds for the current session.'
UNION
SELECT 'Configuration', '@@MAX_CONNECTIONS', CAST(@@MAX_CONNECTIONS AS VARCHAR(255)), 'Returns the maximum number of simultaneous user connections allowed on an instance of SQL Server.'
UNION
SELECT 'Configuration', '@@MAX_PRECISION', CAST(@@MAX_PRECISION AS VARCHAR(255)), 'Returns the precision level used by decimal and numeric data types as currently set in the server.'
UNION
SELECT 'Configuration', '@@MICROSOFTVERSION', CAST(@@MICROSOFTVERSION AS VARCHAR(255)), 'Returns Microsoft SQL Server version information.'
UNION
SELECT 'Configuration', '@@NESTLEVEL', CAST(@@NESTLEVEL AS VARCHAR(255)), 'Returns the nesting level of the current stored procedure execution on the local server.'
UNION
SELECT 'Configuration', '@@OPTIONS', CAST(@@OPTIONS AS VARCHAR(255)), 'Returns information about the current SET options.'
UNION
SELECT 'Configuration', '@@REMSERVER', CAST(@@REMSERVER AS VARCHAR(255)), 'Returns the name of the remote SQL Server database server as it appears in the login record.'
UNION
SELECT 'Configuration', '@@SERVERNAME', CAST(@@SERVERNAME AS VARCHAR(255)), 'Returns the name of the local server that is running SQL Server.'
UNION
--SELECT 'Configuration Functions', '@@SERVICENAME', CAST(@@SERVICENAME AS VARCHAR(255)), 'Returns the name of the registry key under which SQL Server is running.'
--UNION
SELECT 'Configuration', '@@SPID', CAST(@@SPID AS VARCHAR(255)), 'Returns the session ID of the current user process.'
UNION
SELECT 'Configuration', '@@TEXTSIZE', CAST(@@TEXTSIZE AS VARCHAR(255)), 'Returns the current value of the TEXTSIZE option.'
UNION
SELECT 'Configuration', '@@VERSION', CAST(@@VERSION AS VARCHAR(255)), 'Returns system and build information for the current installation of SQL Server.'
;

-----------------------------------------------------------
-----------------------------------------------------------
-----------------------------------------------------------
--System Statistical
--https://learn.microsoft.com/en-us/sql/t-sql/functions/system-statistical-functions-transact-sql?view=sql-server-ver16

SELECT 'Statistical' AS MyFunctionType, '@@CONNECTIONS' AS MyFunction, @@CONNECTIONS AS MyValue, 'This function returns the number of attempted connections - both successful and unsuccessful - since SQL Server was last started.' AS MyDescription
UNION 
SELECT 'Statistical', '@@CPU_BUSY', @@CPU_BUSY, 'This function returns the amount of time that SQL Server has spent in active operation since its latest start. @@CPU_BUSY returns a result measured in CPU time increments, or "ticks." This value is cumulative for all CPUs, so it may exceed the actual elapsed time. To convert to microseconds, multiply by @@TIMETICKS.'
UNION
SELECT 'Statistical', '@@IDLE', @@IDLE, 'Returns the time that SQL Server has been idle since it was last started. The result is in CPU time increments, or "ticks," and is cumulative for all CPUs, so it may exceed the actual elapsed time. Multiply by @@TIMETICKS to convert to microseconds.'
UNION
SELECT 'Statistical', '@@IO_BUSY', @@IO_BUSY, 'Returns the time that SQL Server has spent performing input and output operations since SQL Server was last started. The result is in CPU time increments ("ticks"), and is cumulative for all CPUs, so it may exceed the actual elapsed time. Multiply by @@TIMETICKS to convert to microseconds.'
UNION
SELECT 'Statistical', '@@PACK_SENT', @@PACK_SENT, 'Returns the number of output packets written to the network by SQL Server since it was last started.'
UNION
SELECT 'Statistical', '@@PACKET_ERRORS', @@PACKET_ERRORS, 'Returns the number of network packet errors that have occurred on SQL Server connections since SQL Server was last started.'
UNION
SELECT 'Statistical', '@@TIMETICKS', @@TIMETICKS, 'Returns the number of microseconds per tick.'
UNION
SELECT 'Statistical', '@@TOTAL_ERRORS', @@TOTAL_ERRORS, 'Returns the number of disk write errors encountered by SQL Server since SQL Server last started.'
UNION
SELECT 'Statistical', '@@TOTAL_READ', @@TOTAL_READ, 'Returns the number of disk reads, not cache reads, by SQL Server since SQL Server was last started.'
UNION
SELECT 'Statistical', '@@TOTAL_WRITE', @@TOTAL_WRITE, 'Returns the number of disk writes by SQL Server since SQL Server was last started.'
;

-----------------------------------------------------------
-----------------------------------------------------------
-----------------------------------------------------------
--Other
--See individual links.  These functions I have categorized as "Other"

--https://learn.microsoft.com/en-us/sql/t-sql/functions/cursor-functions-transact-sql?view=sql-server-ver16
SELECT 'Cursor' AS MyFunctionType, '@@CURSOR_ROWS' AS MyFunction, @@CURSOR_ROWS AS MyValue, 'This returns the number of qualifying rows currently in the last cursor opened on the connection. To improve performance, SQL Server can populate large keyset and static cursors asynchronously. @@CURSOR_ROWS can be called to determine that the number of the rows that qualify for a cursor are retrieved at the time of the @@CURSOR_ROWS call.' AS MyDescription
UNION
--https://learn.microsoft.com/en-us/sql/t-sql/functions/cursor-functions-transact-sql?view=sql-server-ver16
SELECT 'Cursor', '@@FETCH_STATUS', @@FETCH_STATUS, 'This function returns the status of the last cursor FETCH statement issued against any cursor currently opened by the connection.'
UNION
--https://learn.microsoft.com/en-us/sql/t-sql/functions/metadata-functions-transact-sql?view=sql-server-ver16
SELECT 'MetaData', '@@PROCID', @@PROCID, 'Returns the object identifier (ID) of the current Transact-SQL module. A Transact-SQL module can be a stored procedure, user-defined function, or trigger. @@PROCID cannot be specified in CLR modules or the in-process data access provider.'
UNION
--https://learn.microsoft.com/en-us/sql/t-sql/functions/date-and-time-data-types-and-functions-transact-sql?view=sql-server-ver16
SELECT 'Date and Time', '@@DATEFIRST', @@DATEFIRST, 'This function returns the current value of SET DATEFIRST, for a specific session.'
;
