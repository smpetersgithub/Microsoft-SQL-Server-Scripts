SELECT 'ServerProperty' AS MyFunctionType, 
		'BuildClrVersion' AS MyType, 
		SERVERPROPERTY('BuildClrVersion') AS PropertyValue,
		'CLR version of the instance of SQL Server' AS Description
UNION ALL
SELECT 'ServerProperty' AS MyFunctionType, 
       'Collation', 
	   SERVERPROPERTY('Collation'),
	   'Server level collation'
UNION ALL
SELECT 'ServerProperty' AS MyFunctionType, 
       'CollationID' AS MyType, 
       SERVERPROPERTY('CollationID') AS PropertyValue,
       'ID for the server level collation' AS Description
UNION ALL
SELECT 'ServerProperty' AS MyFunctionType, 
       'ComparisonStyle' AS MyType, 
       SERVERPROPERTY('ComparisonStyle') AS PropertyValue,
       'Comparison style bits of the collation' AS Description
UNION ALL
SELECT 'ServerProperty' AS MyFunctionType, 
       'ComputerNamePhysicalNetBIOS' AS MyType, 
       SERVERPROPERTY('ComputerNamePhysicalNetBIOS') AS PropertyValue,
       'NetBIOS name of the local computer that is running the instance of SQL Server' AS Description
UNION ALL
SELECT 'ServerProperty' AS MyFunctionType, 
       'Edition' AS MyType, 
       SERVERPROPERTY('Edition') AS PropertyValue,
       'Edition of the instance of SQL Server' AS Description
UNION ALL
SELECT 'ServerProperty' AS MyFunctionType, 
       'EngineEdition' AS MyType, 
       SERVERPROPERTY('EngineEdition') AS PropertyValue,
       'Edition of the engine of SQL Server' AS Description
UNION ALL
SELECT 'ServerProperty' AS MyFunctionType, 
       'FilestreamConfiguredLevel' AS MyType, 
       SERVERPROPERTY('FilestreamConfiguredLevel') AS PropertyValue,
       'Filestream configured level' AS Description
UNION ALL
SELECT 'ServerProperty' AS MyFunctionType, 
       'FilestreamEffectiveLevel' AS MyType, 
       SERVERPROPERTY('FilestreamEffectiveLevel') AS PropertyValue,
       'Filestream effective level' AS Description
UNION ALL
SELECT 'ServerProperty' AS MyFunctionType, 
       'FilestreamShareName' AS MyType, 
       SERVERPROPERTY('FilestreamShareName') AS PropertyValue,
       'Filestream share name' AS Description
UNION ALL
SELECT 'ServerProperty' AS MyFunctionType, 
       'HadrManagerStatus' AS MyType, 
       SERVERPROPERTY('HadrManagerStatus') AS PropertyValue,
       'Status of the Always On availability groups manager' AS Description
UNION ALL
SELECT 'ServerProperty' AS MyFunctionType, 
       'InstanceDefaultBackupPath' AS MyType, 
       SERVERPROPERTY('InstanceDefaultBackupPath') AS PropertyValue,
       'Default backup directory of the instance of SQL Server' AS Description
UNION ALL
SELECT 'ServerProperty' AS MyFunctionType, 
       'InstanceDefaultDataPath' AS MyType, 
       SERVERPROPERTY('InstanceDefaultDataPath') AS PropertyValue,
       'Default data directory of the instance of SQL Server' AS Description
UNION ALL
SELECT 'ServerProperty' AS MyFunctionType, 
       'InstanceDefaultLogPath' AS MyType, 
       SERVERPROPERTY('InstanceDefaultLogPath') AS PropertyValue,
       'Default log directory of the instance of SQL Server' AS Description
UNION ALL
SELECT 'ServerProperty' AS MyFunctionType, 
       'InstanceName' AS MyType, 
       SERVERPROPERTY('InstanceName') AS PropertyValue,
       'Name of the instance to which the user is connected' AS Description
UNION ALL
SELECT 'ServerProperty' AS MyFunctionType,
       'IsAdvancedAnalyticsInstalled' AS MyType,
       SERVERPROPERTY('IsAdvancedAnalyticsInstalled') AS PropertyValue,
       'Indicates if SQL Server Machine Learning Services is installed' AS Description
UNION ALL
SELECT 'ServerProperty' AS MyFunctionType,
       'IsBigDataCluster' AS MyType,
       SERVERPROPERTY('IsBigDataCluster') AS PropertyValue,
       'Indicates if this is a Big Data cluster' AS Description
UNION ALL
SELECT 'ServerProperty' AS MyFunctionType,
       'IsClustered' AS MyType,
       SERVERPROPERTY('IsClustered') AS PropertyValue,
       'Server is a clustered instance' AS Description
UNION ALL
SELECT 'ServerProperty' AS MyFunctionType,
       'IsExternalAuthenticationOnly' AS MyType,
       SERVERPROPERTY('IsExternalAuthenticationOnly') AS PropertyValue,
       'Indicates if external authentication only is enabled' AS Description
UNION ALL
SELECT 'ServerProperty' AS MyFunctionType,
       'IsExternalGovernanceEnabled' AS MyType,
       SERVERPROPERTY('IsExternalGovernanceEnabled') AS PropertyValue,
       'Indicates if external governance is enabled' AS Description
UNION ALL
SELECT 'ServerProperty' AS MyFunctionType,
       'IsFullTextInstalled' AS MyType,
       SERVERPROPERTY('IsFullTextInstalled') AS PropertyValue,
       'Full-text and semantic indexing components are installed' AS Description
UNION ALL
SELECT 'ServerProperty' AS MyFunctionType,
       'IsHadrEnabled' AS MyType,
       SERVERPROPERTY('IsHadrEnabled') AS PropertyValue,
       'Indicates if the Always On availability groups feature is enabled' AS Description
UNION ALL
SELECT 'ServerProperty' AS MyFunctionType,
       'IsIntegratedSecurityOnly' AS MyType,
       SERVERPROPERTY('IsIntegratedSecurityOnly') AS PropertyValue,
       'Server only allows integrated authentication' AS Description
UNION ALL
SELECT 'ServerProperty' AS MyFunctionType,
       'IsLocalDB' AS MyType,
       SERVERPROPERTY('IsLocalDB') AS PropertyValue,
       'Indicates if this instance is SQL Server Express LocalDB' AS Description
UNION ALL
SELECT 'ServerProperty' AS MyFunctionType,
       'IsPolyBaseInstalled' AS MyType,
       SERVERPROPERTY('IsPolyBaseInstalled') AS PropertyValue,
       'Indicates if PolyBase feature is installed' AS Description
UNION ALL
SELECT 'ServerProperty' AS MyFunctionType,
       'IsSingleUser' AS MyType,
       SERVERPROPERTY('IsSingleUser') AS PropertyValue,
       'Server is in single-user mode' AS Description
UNION ALL
SELECT 'ServerProperty' AS MyFunctionType,
       'IsTempDbMetadataMemoryOptimized' AS MyType,
       SERVERPROPERTY('IsTempDbMetadataMemoryOptimized') AS PropertyValue,
       'Indicates if metadata of tempdb objects is memory-optimized' AS Description
UNION ALL
SELECT 'ServerProperty' AS MyFunctionType,
       'IsXTPSupported' AS MyType,
       SERVERPROPERTY('IsXTPSupported') AS PropertyValue,
       'Indicates if In-Memory OLTP is supported on this server' AS Description
UNION ALL
SELECT 'ServerProperty' AS MyFunctionType,
       'LCID' AS MyType,
       SERVERPROPERTY('LCID') AS PropertyValue,
       'Windows locale ID of the collation' AS Description
UNION ALL
SELECT 'ServerProperty' AS MyFunctionType,
       'LicenseType' AS MyType,
       SERVERPROPERTY('LicenseType') AS PropertyValue,
       'Type of licensing for the instance of SQL Server' AS Description
UNION ALL
SELECT 'ServerProperty' AS MyFunctionType,
       'MachineName' AS MyType,
       SERVERPROPERTY('MachineName') AS PropertyValue,
       'Windows computer name on which the server instance is running' AS Description
UNION ALL
SELECT 'ServerProperty' AS MyFunctionType,
       'NumLicenses' AS MyType,
       SERVERPROPERTY('NumLicenses') AS PropertyValue,
       'Number of licenses for the current instance of SQL Server' AS Description
UNION ALL
SELECT 'ServerProperty' AS MyFunctionType,
       'PathSeparator' AS MyType,
       SERVERPROPERTY('PathSeparator') AS PropertyValue,
       'Operating system-dependent network path delimiter' AS Description
UNION ALL
SELECT 'ServerProperty' AS MyFunctionType,
       'ProcessID' AS MyType,
       SERVERPROPERTY('ProcessID') AS PropertyValue,
       'Operating system process ID of the SQL Server service' AS Description
UNION ALL
SELECT 'ServerProperty' AS MyFunctionType,
       'ProductBuild' AS MyType,
       SERVERPROPERTY('ProductBuild') AS PropertyValue,
       'Build number of the product' AS Description
UNION ALL
SELECT 'ServerProperty' AS MyFunctionType,
       'ProductBuildType' AS MyType,
       SERVERPROPERTY('ProductBuildType') AS PropertyValue,
       'Type of build of the product' AS Description
UNION ALL
SELECT 'ServerProperty' AS MyFunctionType,
       'ProductLevel' AS MyType,
       SERVERPROPERTY('ProductLevel') AS PropertyValue,
       'Level of the version of the instance of SQL Server' AS Description
UNION ALL
SELECT 'ServerProperty' AS MyFunctionType,
       'ProductMajorVersion' AS MyType,
       SERVERPROPERTY('ProductMajorVersion') AS PropertyValue,
       'Major version of the instance of SQL Server' AS Description
UNION ALL
SELECT 'ServerProperty' AS MyFunctionType,
       'ProductMinorVersion' AS MyType,
       SERVERPROPERTY('ProductMinorVersion') AS PropertyValue,
       'Minor version of the instance of SQL Server' AS Description
UNION ALL
SELECT 'ServerProperty' AS MyFunctionType,
       'ProductUpdateLevel' AS MyType,
       SERVERPROPERTY('ProductUpdateLevel') AS PropertyValue,
       'Update level of the product' AS Description
UNION ALL
SELECT 'ServerProperty' AS MyFunctionType,
       'ProductUpdateReference' AS MyType,
       SERVERPROPERTY('ProductUpdateReference') AS PropertyValue,
       'Reference for the product update' AS Description
UNION ALL
SELECT 'ServerProperty' AS MyFunctionType,
       'ProductVersion' AS MyType,
       SERVERPROPERTY('ProductVersion') AS PropertyValue,
       'Version of the instance of SQL Server' AS Description
UNION ALL
SELECT 'ServerProperty' AS MyFunctionType,
       'ResourceLastUpdateDateTime' AS MyType,
       SERVERPROPERTY('ResourceLastUpdateDateTime') AS PropertyValue,
       'Date and time that the resource database was last updated' AS Description
UNION ALL
SELECT 'ServerProperty' AS MyFunctionType,
       'ResourceVersion' AS MyType,
       SERVERPROPERTY('ResourceVersion') AS PropertyValue,
       'Database version of the resource' AS Description
UNION ALL
SELECT 'ServerProperty' AS MyFunctionType,
       'ServerName' AS MyType,
       SERVERPROPERTY('ServerName') AS PropertyValue,
       'Name of the instance of SQL Server' AS Description
UNION ALL
SELECT 'ServerProperty' AS MyFunctionType,
       'SqlCharSet' AS MyType,
       SERVERPROPERTY('SqlCharSet') AS PropertyValue,
       'SQL character set ID of the server' AS Description
UNION ALL
SELECT 'ServerProperty' AS MyFunctionType,
       'SqlCharSetName' AS MyType,
       SERVERPROPERTY('SqlCharSetName') AS PropertyValue,
       'SQL character set name of the server' AS Description
UNION ALL
SELECT 'ServerProperty' AS MyFunctionType,
       'SqlSortOrder' AS MyType,
       SERVERPROPERTY('SqlSortOrder') AS PropertyValue,
       'SQL sort order ID of the server' AS Description
UNION ALL
SELECT 'ServerProperty' AS MyFunctionType,
       'SqlSortOrderName' AS MyType,
       SERVERPROPERTY('SqlSortOrderName') AS PropertyValue,
       'SQL sort order name of the server' AS Description
UNION ALL
SELECT 'ServerProperty' AS MyFunctionType,
       'SuspendedDatabaseCount' AS MyType,
       SERVERPROPERTY('SuspendedDatabaseCount') AS PropertyValue,
       'Number of suspended databases on the server instance' AS Description
