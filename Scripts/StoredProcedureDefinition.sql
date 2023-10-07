/*
Stored Procedure Definition

The following script prints out the body of a stored procedure.
See also sp_helptext.
*/

SELECT  o.name, o.type_desc, o.create_date, o.modify_date, m.*
FROM    sys.sql_modules m LEFT OUTER JOIN
        sys.all_objects o on m.object_id = o.object_id
WHERE   m.definition like  '%myText%';
