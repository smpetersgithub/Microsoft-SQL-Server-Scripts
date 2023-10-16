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

