CREATE TABLE Parent
(
ParentID INT IDENTITY(1,1) PRIMARY KEY CLUSTERED
);
GO

CREATE TABLE Child
(
ChildID INT PRIMARY KEY CLUSTERED,
ParentID INT FOREIGN KEY REFERENCES Parent(ParentID),
ChildName VARCHAR(100) UNIQUE NOT NULL,
DefaultColumn INT DEFAULT 10,
ComputedColumn AS (DefaultColumn / 2)  -- This is a computed column
);
GO

CREATE VIEW vwTest AS
SELECT  b.ParentID,
        b.ChildID,
		b.ChildName
FROM    Parent a INNER JOIN
        Child b ON a.ParentID = b.ParentID;
GO

CREATE VIEW vwTest2 WITH SCHEMABINDING AS
SELECT  b.ParentID,
        b.ChildID,
		b.ChildName
FROM    Parent a INNER JOIN
        Child b ON a.ParentID = b.ParentID;
GO

CREATE PROCEDURE prTest1 AS
(
SELECT 'Hello World'
);
GO

CREATE FUNCTION fnScalar()
RETURNS INT
AS
BEGIN
    RETURN 1
END;
GO

CREATE FUNCTION fnTable()
RETURNS @ResultTable TABLE (Number INT, Text VARCHAR(100))
AS
BEGIN
INSERT INTO @ResultTable (Number, Text) VALUES (1, 'Example');
RETURN;
END;

CREATE TYPE dbo.TypeTest FROM INTEGER NOT NULL;
GO

CREATE TYPE dbo.TypeTableTest AS TABLE
(
myValue  INT,
myValue2 INT
);
GO

--CREATE A SEQUENCE

select * from sys.indexes;