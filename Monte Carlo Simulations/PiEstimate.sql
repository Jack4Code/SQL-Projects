--TSQL Monte Carlo Simulation Estimating PI
DECLARE @Hits float = 0
DECLARE @Throws int = 10000000
DECLARE @cnt int = 0

WHILE (@cnt<@Throws)
BEGIN
	DECLARE @x float = (SELECT RAND()*(1+1)-1)
	DECLARE @y float = (SELECT RAND()*(1+1)-1)
	
	if(SQUARE(@x) + SQUARE(@y) <= 1)
	BEGIN
		SET @Hits = @Hits + 1
	END
	SET @cnt = @cnt + 1
END
PRINT((@Hits/@Throws)*4)