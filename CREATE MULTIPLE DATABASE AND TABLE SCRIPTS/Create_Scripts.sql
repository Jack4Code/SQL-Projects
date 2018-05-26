--This script can be used to quickly create a number of databases and tables.
--You can decide how many databases you want, what the databases will be called, etc...
--I've included a fake data generator which populates as much fake data as you want.

DECLARE @databaseName varchar(20) = 'tempDatabase';
DECLARE @database int = 1;
DECLARE @dbQTY int = 10;
DECLARE @createOrDrop varchar(6) = 'create'

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

--NOW DEPLOY TABLES ACROSS HOWEVER MANY DATABASES THERE ARE



