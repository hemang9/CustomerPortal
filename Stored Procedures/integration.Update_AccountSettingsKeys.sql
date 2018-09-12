SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



/*
MOD HISTORY
----
HJB  3/7/2018   Update the Account Keys throughout the customer protal db
-----
EXEC stmt
 exec [dbo].[Update_AccountKeys]
**/

CREATE PROC [integration].[Update_AccountSettingsKeys]

AS

BEGIN


			/*
			   CREATE TABLE [portal].[AccountSettings](
				[AccountId] [uniqueidentifier] NOT NULL,
				[AccountNumber] [nvarchar](20) NOT NULL,

				[AccountKey] [INT]    NULL,
			*/
		MERGE INTO [portal].[AccountSettings] AS t
		USING
		crm.Accounts
		 AS source
		ON (t.AccountId = source.AccountId)
		WHEN MATCHED THEN
			UPDATE SET 
				AccountId = source.AccountId;

END


GO
