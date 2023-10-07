/*
sp_helptext Example.

sp_helptext displays the definition that is used to create an object in multiple rows. 
Each row contains 255 characters of the Transact-SQL definition. 
The definition resides in the definition column in the sys.sql_modules catalog view.
https://learn.microsoft.com/en-us/sql/relational-databases/system-stored-procedures/sp-helptext-transact-sql?view=sql-server-ver16
*/

DECLARE @vTableVariable TABLE(SpText VARCHAR(MAX));
DECLARE @vStoredProcedureName VARCHAR(255) = 'spTest';
INSERT INTO @vTableVariable
EXEC sp_helptext @vStoredProcedureName;
SELECT * FROM @vTableVariable;

