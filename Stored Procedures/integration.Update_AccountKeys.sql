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

CREATE	 PROC [integration].[Update_AccountKeys]

AS

BEGIN


			--Step:1
			--  [crm].[Assets]
			/*
			[crm].[Assets](
				[ppt_assetId] [uniqueidentifier] NOT NULL,
				[ppt_oem_name] [nvarchar](100) NULL,
				[ppt_accountid] [uniqueidentifier] NULL,
				[AccountKey] [INT]    NULL,
			*/

			--MERGE INTO [crm].[Assets] AS t
			--USING
			--crm.Accounts
			-- AS source
			--ON (t.ppt_accountid = source.AccountId)
			--WHEN MATCHED THEN
			--	UPDATE SET 
			--		AccountKey = source.AccountKey;

			/*
			   [crm].[Contacts](
				[ContactId] [uniqueidentifier] NOT NULL,
				[FirstName] [nvarchar](50) NULL,
				[LastName] [nvarchar](50) NULL,
				[FullName] [nvarchar](160) NULL,
				[EMailAddress1] [nvarchar](100) NULL,
				[ParentCustomerId] [uniqueidentifier] NULL,
				[AccountId] [uniqueidentifier] NULL,
				[Telephone1] [nvarchar](50) NULL,
				[AccountKey] [INT]    NULL,
			*/

			--MERGE INTO [crm].[Contacts] AS t
			--USING
			--crm.Accounts
			-- AS source
			--ON (t.AccountId = source.AccountId)
			--WHEN MATCHED THEN
			--	UPDATE SET 
			--		AccountKey = source.AccountKey;
			/*
			[crm].[Contracts]

				[ppt_accountid] [uniqueidentifier] NULL,
				[ppt_enduserid] [uniqueidentifier] NULL,
   
				[AccountKey] [INT]    NULL,
				[EndUserAccountKey] [INT]    NULL,

			*/
			--MERGE INTO [crm].[Contracts] AS t
			--USING
			--crm.Accounts
			-- AS source
			--ON (t.ppt_accountid = source.AccountId)
			--WHEN MATCHED THEN
			--	UPDATE SET 
			--		AccountKey = source.AccountKey;

			--MERGE INTO [crm].[Contracts] AS t
			--USING
			--crm.Accounts
			-- AS source
			--ON (t.ppt_enduserid = source.AccountId)
			--WHEN MATCHED THEN
			--	UPDATE SET 
			--		EndUserAccountKey = source.AccountKey;
			/*
			[crm].[Locations]
				[ppt_AccountId] [uniqueidentifier] NULL, 

				[AccountKey] [INT]    NULL,


			*/
			--MERGE INTO [crm].[Locations] AS t
			--USING
			--crm.Accounts
			-- AS source
			--ON (t.ppt_AccountId = source.AccountId)
			--WHEN MATCHED THEN
			--	UPDATE SET 
			--		AccountKey = source.AccountKey;

			/*
				[fpastea].[Incidents]  
				[AccountCompanyCode] [varchar](30) NOT NULL,  this are accountNumber varchar(30) not uniqueidentifier
				[EndUserCompanyCode] [varchar](30) NOT NULL,

				needs to map to

				[AccountKey] [INT]    NULL,
				[EndUserAccountKey] [INT]    NULL,
	  
			*/
			
				update
						t
				set
						t.AccountId = a.AccountId 
				from	[fpastea].[Incidents] (nolock)  AS t 
					inner join crm.Accounts a on t.AccountCompanyCode = a.[AccountNumber]
				  WHERE t.accountId IS NULL;

				update
						t
				set
						  t.EndUserAccountId = a.AccountId
				from	[fpastea].[Incidents] (nolock)  AS t 
					inner join crm.Accounts a on t.EndUserCompanyCode = a.[AccountNumber]
					WHERE t.EndUserAccountId IS NULL;


				UPDATE i 
				  SET i.ppt_contractId= c.ppt_contractId 
				FROM fpastea.Incidents i
				left join crm.Contracts c (nolock)
					on c.ppt_name = i.ContractNumber
				left join crm.ContractAssets ca (nolock)
					on ca.ppt_contractid = c.ppt_contractId
					and cast(ca.ppt_contract_assetId as varchar(50)) = i.ContractAssetID
				WHERE i.ppt_contractId IS NULL 


				UPDATE i 
				  SET i.ppt_assetlocationid= ca.ppt_assetlocationid
				FROM fpastea.Incidents i
				left join crm.Contracts c (nolock)
					on c.ppt_name = i.ContractNumber
				left join crm.ContractAssets ca (nolock)
					on ca.ppt_contractid = c.ppt_contractId
					and cast(ca.ppt_contract_assetId as varchar(50)) = i.ContractAssetID
				WHERE i.ppt_assetlocationid IS NULL

			/*
			   CREATE TABLE [portal].[AccountSettings](
				[AccountId] [uniqueidentifier] NOT NULL,
				[AccountNumber] [nvarchar](20) NOT NULL,

				[AccountKey] [INT]    NULL,
		--	*/
		--MERGE INTO [portal].[AccountSettings] AS t
		--USING
		--crm.Accounts
		-- AS source
		--ON (t.AccountId = source.AccountId)
		--WHEN MATCHED THEN
		--	UPDATE SET 
		--		AccountKey = source.AccountKey;

		/*
			astea.TechnicalContact
		*/

		MERGE INTO astea.TechnicalContacts AS t
		USING
		crm.Accounts
		 AS source
		ON (t.[CompanyId] = source.AccountNumber)
		WHEN MATCHED THEN
			UPDATE SET 
				t.AccountId = source.AccountId;
		
		/*
			Astea.CompanySites
		*/

		/*Merge into Astea.CompanySites as t
		USING		
			crm.Accounts
			 AS source
			ON (t.GpAccountNo = source.AccountNumber)
			WHEN MATCHED THEN
				UPDATE SET 
					t.AccountKey = source.AccountKey;*/

		Update t set t.AccountId = source.AccountId
					from astea.CompanySites (nolock) AS t 
					inner join crm.Accounts (nolock) AS source
		ON (t.GpAccountNo = source.AccountNumber)
		   WHERE t.AccountId IS NULL

END



GO
