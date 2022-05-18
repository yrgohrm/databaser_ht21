USE Northwind;
GO

CREATE PROCEDURE dbo.stockWithPriceLessThan
    @Price AS MONEY
AS
BEGIN
    SET NOCOUNT ON
    SELECT ProductID, ProductName, UnitPrice 
    FROM Products 
    WHERE UnitPrice < @Price AND UnitsInStock > 0;
END
GO

EXEC stockWithPriceLessThan 11;
GO

CREATE PROCEDURE dbo.stockWithPriceLessThan
    @Price AS MONEY
AS
BEGIN
    SET NOCOUNT ON
    SELECT ProductID, ProductName, UnitPrice 
    FROM Products 
    WHERE UnitPrice < @Price AND UnitsInStock > 0;
END
GO



CREATE PROCEDURE dbo.highestPriceLessThan
    @Price AS MONEY,
    @HighestPrice AS MONEY OUTPUT,
    @HighestID AS INT OUTPUT
AS
    SET NOCOUNT ON
    SELECT TOP(1) @HighestID = ProductID, @HighestPrice = UnitPrice 
    FROM Products 
    WHERE UnitPrice < @Price AND UnitsInStock > 0
    ORDER BY UnitPrice DESC;
GO

DECLARE @HP AS MONEY
DECLARE @HID AS INT
EXEC dbo.highestPriceLessThan 10, @HighestPrice = @HP OUTPUT, @HighestID = @HID OUTPUT;
SELECT @HID, @HP;
GO

CREATE PROCEDURE dbo.increasePrice
    @ProductID INT
AS
    DECLARE @UnitPrice AS MONEY

    SELECT @UnitPrice = UnitPrice FROM Products
    WHERE ProductID = @ProductID

    IF @UnitPrice < 50
        UPDATE Products 
        SET UnitPrice = ROUND(UnitPrice * 1.1, 1, 1)
        WHERE ProductID = @ProductID;
    ELSE
        UPDATE Products 
        SET UnitPrice = ROUND(UnitPrice * 1.03, 1, 1)
        WHERE ProductID = @ProductID;
GO

SELECT * FROM Products WHERE ProductID = 41;
EXEC increasePrice 41;
GO

-- namnet med "NoCount" är ingen indikation på hur man bör namnge 
-- lagrade procedurer i verkligheten, bara för att skilja från den
-- redan befintliga proceduren...

CREATE PROCEDURE dbo.increasePriceNoCount
    @ProductID INT
AS
    SET NOCOUNT ON
    DECLARE @UnitPrice AS MONEY

    SELECT @UnitPrice = UnitPrice FROM Products
    WHERE ProductID = @ProductID

    IF @UnitPrice < 50
        UPDATE Products 
        SET UnitPrice = ROUND(UnitPrice * 1.1, 1, 1)
        WHERE ProductID = @ProductID;
    ELSE
        UPDATE Products 
        SET UnitPrice = ROUND(UnitPrice * 1.03, 1, 1)
        WHERE ProductID = @ProductID;
GO


CREATE PROCEDURE dbo.blabla
    @ProductID INT
AS
BEGIN
    BEGIN TRANSACTION;

    -- ...
    IF ....
        ROLLBACK TRANSACTION;


    COMMIT TRANSACTION;
END



BEGIN TRANSACTION
    -- ...

    EXEC dbo.blabla;

    -- ...
COMMIT TRANSACTION;