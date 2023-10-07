/*
Returns the ASCII values of a string

This script loops through a string and displays
all the ASCII characters in the string.
*/
DECLARE @vMyString VARCHAR(100) = 'Hello World';
DECLARE @vLength INTEGER = LEN(@vMyString);
DECLARE @vPosition INTEGER = 0;
DECLARE @vAscii VARCHAR(MAX) = '';

--Begin Loop
WHILE @vLength >= @vPosition
BEGIN
  SELECT @vAscii = @vAscii + CONCAT(ASCII(SUBSTRING(@vMyString,@vPosition,1)),',');
  SELECT @vPosition = @vPosition + 1;
END;

--Removes beginning and ending commas
SET @vAscii = SUBSTRING(@vAscii,2,LEN(@vAscii)-2);

SELECT @vAscii AS AsciiCodes;
