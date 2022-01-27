
/* method1*/
SELECT GROUP_CONCAT(NUMB SEPARATOR '&')
FROM (
    SELECT @num:=@num+1 as NUMB FROM
    information_schema.tables t1,
    information_schema.tables t2,
    (SELECT @num:=1) tmp
) tempNum

WHERE NUMB<=1000 AND NOT EXISTS(
    SELECT * FROM (
        SELECT @nu:=@nu+1 as NUMA FROM
            information_schema.tables t1,
            information_schema.tables t2,
            (SELECT @nu:=1) tmp1
            LIMIT 1000
        ) tatata
    WHERE FLOOR(NUMB/NUMA)=(NUMB/NUMA) AND NUMA<NUMB AND NUMA>1
)


/* method2 somehow dont work ----
https://www.youtube.com/watch?v=d_NRSj0rIHg


DECLARE @table TABLE (PrimeNumber INT)

DECLARE @final AS VARCHAR(1500)
SET @final = ''

DECLARE @counter INT
SET @counter = 2

WHILE @counter <= 1000
BEGIN
    IF NOT EXISTS (
            SELECT PrimeNumber
            FROM @table
            WHERE @counter % PrimeNumber = 0)
        BEGIN 
            INSERT INTO @table SELECT @counter
            SET @final = @final + CAST(@counter AS VARCHAR(20))+'&' 
        END
    SET @counter = @counter + 1
END
*/