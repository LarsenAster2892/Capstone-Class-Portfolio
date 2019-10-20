USE [AMCATestDB]
GO

/****** Object:  StoredProcedure [dbo].[Artist_Delete]    Script Date: 10/14/2019 7:19:30 PM ******/
SELECT 'DROP PROCEDURE [' + SCHEMA_NAME(p.schema_id) + '].[' + p.NAME + '];'
FROM sys.procedures p

