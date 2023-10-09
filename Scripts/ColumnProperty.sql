/*
Determines the size of a data type
*/
SELECT COLUMNPROPERTY( OBJECT_ID('dbo.mytable'),'mycolumn','PRECISION') AS 'ColumnLength';
