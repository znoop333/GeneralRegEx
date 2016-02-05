--sp_configure 'show advanced options', 1;
--GO
--RECONFIGURE;
--GO
--sp_configure 'clr enabled', 1;
--GO
--RECONFIGURE;
--GO

--To create assembly
--drop ASSEMBLY GeneralRegEx
--CREATE ASSEMBLY GeneralRegEx from 'F:\MSSQL\MSSQL11.MSSQLSERVER\MSSQL\GeneralRegEx.dll'
--CREATE ASSEMBLY GeneralRegEx from 'R:\MSSQL11.MSSQLSERVER\MSSQL\GeneralRegEx.dll'
--CREATE ASSEMBLY GeneralRegEx from 'E:\MSSQL\GeneralRegEx.dll'

--GO
--To create Function
CREATE FUNCTION dbo.GeneralRegEx
(
@subject nvarchar(4000),
@pattern nvarchar(4000)
)
RETURNS bit
AS external name GeneralRegEx.UserDefinedFunctions.RegexMatch

