/*
Missing Indexes

The following script finds missing indexes in Microsoft SQL Server.

The tables used are:
sys.dm_db_missing_index_groups
sys.dm_db_missing_index_group_stats
sys.dm_db_missing_index_details
*/
SELECT
        GETDATE() AS runtime
        ,@@Servername
        ,REPLACE(REPLACE(mid.statement,']',''),'[','') AS tablename
        ,migs.avg_total_user_cost
        ,migs.avg_user_impact
        ,migs.user_seeks
        ,migs.user_scans
        
        --Pulled from the internet.
        ,CONVERT (DECIMAL (28,1), migs.avg_total_user_cost * migs.avg_user_impact * (migs.user_seeks + migs.user_scans)) AS improvement_measure
        ----------------------------
        --Index creation syntax
        ,'CREATE INDEX missing_index_' + 'INDEX_NAME ON ' + mid.statement + ' (' + ISNULL (mid.equality_columns,'') + 
                    CASE WHEN mid.equality_columns IS NOT NULL AND mid.inequality_columns IS NOT NULL
                         THEN ','
                         ELSE ''
                         END + ISNULL (mid.inequality_columns, '') + ')' + ISNULL (' INCLUDE (' + mid.included_columns + ')', '')
        AS create_index_statement
        ----------------------------
        ,mid.database_id
        ,mid.[object_id]
FROM    sys.dm_db_missing_index_groups AS mig INNER JOIN
        sys.dm_db_missing_index_group_stats AS migs ON migs.group_handle = mig.index_group_handle INNER JOIN
        sys.dm_db_missing_index_details AS mid ON mig.index_handle = mid.index_handle
WHERE    1=1
         AND mid.statement NOT LIKE '%msdb%'
ORDER BY
        user_seeks desc,
        migs.avg_total_user_cost * migs.avg_user_impact * (migs.user_seeks + migs.user_scans) DESC;
--EXEC sp_helptext 'schecma.name'
