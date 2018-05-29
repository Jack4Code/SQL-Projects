--This script can be used to quickly create any number of databases and tables.
--You can decide how many databases you want, what the databases will be called, etc...
--I've included a fake data generator which populates as much fake data as you want.

DECLARE @databaseName varchar(20) = 'testDatabase'; --decide the database prefix name
DECLARE @database int = 1; --first one
DECLARE @dbQTY int = 5; --decide how many you want
DECLARE @createOrDrop varchar(6) = 'create' -- 'create' them or 'drop' them.
PRINT(UPPER(@createOrDrop) + ' script is being run.')
if(UPPER(@createOrDrop) = 'CREATE')
BEGIN
	WHILE(@database <= @dbQTY)
	BEGIN
	    DECLARE @dropIfExitsStm nvarchar(64) = ('DROP DATABASE IF EXISTS ' + CAST(@databaseName as varchar(max)) + CAST(@database as varchar(max)))
		EXECUTE sp_executesql @dropIfExitsStm
		DECLARE @createStm nvarchar(64) = ('CREATE DATABASE ' + CAST(@databaseName as varchar(max)) + CAST(@database as varchar(max)))
		EXECUTE sp_executesql @createStm
		SET @database = @database + 1
	END
END
if(UPPER(@createOrDrop) = 'DROP')
BEGIN
	WHILE(@database <= @dbQTY)
	BEGIN
		DECLARE @dropStm nvarchar(64) = ('DROP DATABASE IF EXISTS ' + CAST(@databaseName as varchar(max)) + CAST(@database as varchar(max)))
		EXECUTE sp_executesql @dropStm
		SET @database = @database + 1
	END
END
PRINT(UPPER(@createOrDrop) + ' script has run.')
if(UPPER(@createOrDrop) = 'CREATE')
BEGIN
	PRINT(CAST(@dbQTY as varchar(4)) + ' databases were created.')
END
ELSE
BEGIN
	PRINT(CAST(@dbQTY as varchar(4)) + ' databases were droped.')
END
--NOW DEPLOY TABLES ACROSS HOWEVER MANY DATABASES THERE ARE




















