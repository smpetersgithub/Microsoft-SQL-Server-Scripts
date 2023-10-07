/*
Cursor Example

A quick example of a Microsoft SQL Server cursor usage.
https://learn.microsoft.com/en-us/sql/t-sql/language-elements/declare-cursor-transact-sql?view=sql-server-ver16
*/

DECLARE @vMyVariable VARCHAR(100);
DECLARE test_cursor CURSOR FOR (SELECT 'Hello World' UNION SELECT 'Goodbye World');

OPEN test_cursor;
FETCH NEXT FROM test_cursor INTO @vMyVariable;
    WHILE @@FETCH_STATUS = 0
        BEGIN
        PRINT(CONCAT('The value is ', @vMyVariable));
        FETCH NEXT FROM test_cursor INTO @vMyVariable;
        END
CLOSE test_cursor;
DEALLOCATE test_cursor;
