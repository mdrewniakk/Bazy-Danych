--zad1
CREATE FUNCTION dbo.FIBO(@n INT)
RETURNS @ciag_fib TABLE(nr_fib INT)
AS
BEGIN
	DECLARE @a INT = 0, @b INT =1, @i INT=1, @temp INT 
	INSERT INTO @ciag_fib VALUES(@a),(@b)
	WHILE (@i <= @n-2)
	BEGIN 			
		INSERT INTO @ciag_fib VALUES(@a+@b)
		SET @temp = @b
		SET @b = @b + @a
		SET @a = @temp
		SET @i += 1
	END	
	RETURN
	END;

CREATE PROCEDURE showfib
@n2 INT
AS
BEGIN
SELECT * FROM dbo.FIBO(@n2)
END;

EXEC show_fib 20
--zad2
USE AdventureWorks2019
GO
CREATE TRIGGER upper_lastname
ON Person.Person
AFTER INSERT
AS
BEGIN
UPDATE Person.Person
SET LastName = UPPER(LastName)
END
--zad3
USE AdventureWorks2019
GO
CREATE TRIGGER taxRateMonitoring
  ON Sales.SalesTaxRate
  AFTER UPDATE
AS
SELECT s.TaxRate
FROM Sales.SalesTaxRate AS s 
    INNER JOIN inserted AS i ON s.SalesTaxRateID = i.SalesTaxRateID
	WHERE i.TaxRate > 1.3*s.TaxRate OR i.TaxRate < 0.7*s.TaxRate
BEGIN 
RAISERROR('Too much of a change in TaxRate',16,1)
ROLLBACK TRANSACTION
END;

