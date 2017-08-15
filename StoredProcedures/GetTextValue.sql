USE SecureDataStore;
GO

IF(OBJECT_ID('GetTextValue')) is NOT NULL
    DROP PROCEDURE GetTextValue
GO

CREATE PROCEDURE GetTextValue
   @Key BIGINT,
   @Type INT
AS
    SELECT ST.[Data]
    FROM dbo.SecureText AS ST
    WHERE ST.[Key] = @Key AND ST.[Type] = @Type;
GO

--EXEC dbo.GetTextValue 10, 1
