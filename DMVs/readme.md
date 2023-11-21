### Exact Numerics
| Data Type               | Range                                                          | Storage    |
|-------------------------|----------------------------------------------------------------|------------|
| bigint                  | -9,223,372,036,854,775,808 to 9,223,372,036,854,775,807        | 8 Bytes    |
| int                     | -2,147,483,648 to 2,147,483,647                                | 4 Bytes    |
| smallint                | -32,768 to 32,767                                              | 2 Bytes    |
| tinyint                 | 0 to 255                                                       | 1 Byte     |
| bit                     | 0 to 1                                                         | 1/8 Bytes  |
| decimal / numeric (p,s) | Precision = Number of digits; Scale = Number of decimal places | 5-17 Bytes |
| money                   | -922,337,203,685,477.5808 to 922,337,203,685,477.5807          | 8 Bytes    |
| smallmoney              | -214,748.3648 to 214,748.3647                                  | 4 Bytes    |

-----

### Approximate Numerics
| Data Type  | Range             | Storage   |
|------------|-------------------|-----------|
| float([n]) | See documentation | 4-8 Bytes |
| real       | See documentation | 4 Bytes   |

------

### Date and Time
| Data Type         | Time Precision                                                                           | Range                                                       | Storage   |
|-------------------|------------------------------------------------------------------------------------------|-------------------------------------------------------------|-----------|
| date              | None                                                                                     | Year 1 to 9999                                              | 3 Bytes   |
| datetime          | To a 1/300th of a second (0.003)                                                          | Year 1753 to 9999                                           | 8 Bytes   |
| datetime2(n)      | Up to 7 decimal places (0.0000001 seconds)                                               | Year 1 to 9999                                              | 6-8 Bytes |
| datetimeoffset(n) | Up to 7 decimal places (0.0000001 seconds), with offset between -12:59 to +14:00         | Year 1 to 9999                                              | 8-10 Bytes|
| smalldatetime     | To the nearest minute                                                                    | Year 1900 to 2079                                           | 4 Bytes   |
| time(n)           | Up to 7 decimal places (0.0000001 seconds)                                               | None                                                        | 3-5 Bytes |

---------------
### Character Strings

| Data Type    | Characters                        | Storage       | Note                          |
|--------------|-----------------------------------|---------------|-------------------------------|
| char(n)      | UTF-8; 1-8000 characters         | n Bytes       |                               |
| varchar(n)   | UTF-8; 1-8000 characters         | Char+2 Bytes  |                               |
| text         | UTF-8; 1-2,147,483,647 characters| Variable      | Deprecated, use varchar       |
| varchar(max) | UTF-8; 1-2,147,483,647 characters| Variable      |                               |

-----------

### Unicode Character Strings

| Data Type    | Characters                              | Storage       | Note                         |
|--------------|-----------------------------------------|---------------|------------------------------|
| nchar(n)     | Unicode; 1-4000 characters              | 2n Bytes      |                              |
| nvarchar(n)  | Unicode; 1-4000 characters              | 2Char+2 Bytes |                              |
| ntext        | Unicode; 1-1,073,741,823 characters    | 2Char Bytes   | Deprecated                   |
| nvarchar(max)| Unicode; 1-1,073,741,823 characters    | 2Char Bytes   |                              |

----------

### Binary Strings
| Data Type      | Use When               |
|----------------|------------------------|
| binary         | Sizes are consistent   |
| varbinary      | Sizes vary considerably|
| varbinary(max) | More than 8000 bytes   |

--------------------

### Other Data Types
| Data Type        | Note                                      |
|------------------|-------------------------------------------|
| cursor           |                                           |
| geography        |                                           |
| geometry         |                                           |
| hierarchyid      |                                           |
| rowversion       |                                           |
| sql_variant      |                                           |
| table            |                                           |
| uniqueidentifier | Unique value using NEWID or NEWSEQUENTIALID|
| XML              |                                           |
