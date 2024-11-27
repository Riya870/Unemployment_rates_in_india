CREATE DATABASE Unemployment

use Unemployment
 
SELECT * FROM [dbo].[unemployment]

SELECT * FROM [dbo].[unemployment]
WHERE[Unemployment Rate]  IS NULL;


DELETE FROM [dbo].[unemployment]
where [ Date] = '1899-12-30 00:00:00.000';



SELECT [Region] ,[ Date],AVG([Unemployment Rate])AS AVG_Unemployment FROM Unemployment
GROUP BY  [Region],[ Date];


SELECT TOP 5 [Region]  , MAX([Unemployment Rate]) AS MAX_Uemployment
FROM [dbo].[unemployment]
GROUP BY Region 
ORDER BY MAX_Uemployment DESC;


SELECT COUNT(*) AS Total_Records FROM [dbo].[unemployment]

SELECT DISTINCT [Region] FROM [dbo].[unemployment];

SELECT * FROM [dbo].[unemployment] WHERE [ Date] ='2019-05-31 00:00:00.000';

SELECT [ Date],SUM([ Labour Participation Rate])AS Total_Lobour_Participation
FROM [dbo].[unemployment]
GROUP BY [ Date]

-- Get the maximum and minimum unemployment rates:
SELECT MAX([Unemployment Rate])AS Max_Rate , MIN([Unemployment Rate])
AS Min_Rate 
FROM [dbo].[unemployment];

SELECT [Region],MAX([Unemployment Rate]) AS Highest_unemployment
FROM [dbo].[unemployment]
WHERE [ Date] = '2019-12-31 00:00:00.000'
GROUP BY [Region]
ORDER BY Highest_unemployment DESC;

SELECT [Region],AVG([Unemployment Rate]) AS Avg_Rate
FROM [dbo].[unemployment]
WHERE [Region] = 'Bihar'
GROUP BY [Region]
ORDER BY [Region];

SELECT [Region],[ Date],[Unemployment Rate]
FROM [dbo].[unemployment]
WHERE [Unemployment Rate]>20;


--Rank states by unemployment rate in 2020-02-29 00:00:00.000
SELECT [Region],[ Date],[Unemployment Rate],
	RANK()OVER (PARTITION BY [ Date] ORDER BY  [Unemployment Rate] DESC) AS RANK
FROM [dbo].[unemployment]
WHERE [ Date] ='2020-02-29 00:00:00.000';

SELECT [Unemployment Rate],[ Employed]
FROM [dbo].[unemployment];

--Which state showed the most improvement in unemployment rates
WITH Change AS(
	SELECT [Region],MIN([Unemployment Rate])AS Min_Rate,MAX([Unemployment Rate])AS Max_Rate
	FROM [dbo].[unemployment]
	GROUP BY [Region]
)
SELECT [Region],(Max_Rate - Min_Rate) AS Improvement
FROM Change
ORDER BY Improvement DESC;