/*
SQL Server Agent Job Steps

This SQL script prints out Microsoft SQL Server Agent job steps.

dbo.sysjobsstep
Contains the information for each step in a job to be 
executed by SQL Server Agent. This table is stored in the msdb database.

dbo.sysjobs
Stores the information for each scheduled job to be executed by SQL Server Agent. 
This table is stored in the msdb database.
*/

SELECT  @@SERVERNAME AS ServerName,
        s.step_id AS 'StepID',
        j.[name] AS 'SQLAgentJobName',
        s.[database_name] AS 'DBName',
        s.command AS 'Command'
FROM    msdb.dbo.sysjobsteps s INNER JOIN 
        msdb.dbo.sysjobs AS j ON s.job_id = j.job_id
WHERE   1=1 
        AND s.command LIKE '%example_command%';
