/*
   Monday, May 13, 201912:53:19 AM
   User: sa
   Server: DESKTOP-L5BRUUB\SQLEXPRESS
   Database: OnlineStoreDB
   Application: 
*/

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.ProductImages ADD
	Contents varbinary(MAX) NULL,
	ContentType nvarchar(MAX) NULL
GO
ALTER TABLE dbo.ProductImages SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
