/*
Drop Database

Script template for dropping a database in Microsoft SQL Server.
https://learn.microsoft.com/en-us/sql/t-sql/statements/drop-database-transact-sql?view=sql-server-ver16
*/  
USE MASTER;
GO
ALTER DATABASE <name> SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
DROP DATABASE <name>;
