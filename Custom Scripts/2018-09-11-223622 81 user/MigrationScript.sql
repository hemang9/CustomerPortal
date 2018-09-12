/*
This migration script replaces uncommitted changes made to these objects:
Assets
IncidentsActivities
Merge_Accounts

Use this script to make necessary schema and data changes for these objects only. Schema changes to any other objects won't be deployed.

Schema changes and migration scripts are deployed in the order they're committed.

Migration scripts must not reference static data. When you deploy migration scripts alongside static data 
changes, the migration scripts will run first. This can cause the deployment to fail. 
Read more at https://documentation.red-gate.com/display/SOC6/Static+data+and+migrations.
*/

SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
PRINT N'Altering [integration].[Merge_Accounts]'
GO

/*
  HJB 9/11/2018 Refactoring entire sproc
*/
ALTER PROC [integration].[Merge_Accounts]
AS
BEGIN

    MERGE INTO crm.Accounts AS t
    USING
    (
        SELECT AccountId,
               AccountNumber,
               AccountName,
               PrimaryContactId,
               StatusCode,
               Address1_Line1,
               NULLIF(Address1_Line2, '') AS Address1_Line2,
               NULLIF(Address1_Line3, '') AS Address1_Line3,
               Address1_City,
               Address1_StateOrProvince,
               Address1_PostalCode,
               Address1_County,
               Address1_Country,
               OwnerId,
               [ChannelPartnerType],
               CustomerTypeCode,
               OpenIncidentCount,
               ClosedIncidentCount,
               ContractCount,
               ContractAssetCount,
               ActiveContractAssetCount,
               [IsChannelPartner],
               [CreatedOn],
               [ModifiedOn],
               InactiveContractAssetCount,
			   nceaccounttype
        FROM staging.Accounts
    ) AS source
    ON (t.AccountId = source.AccountId)
    WHEN NOT MATCHED THEN
        INSERT
        (
            AccountId,
            AccountNumber,
            AccountName,
            PrimaryContactId,
            StatusCode,
            Address1_Line1,
            Address1_Line2,
            Address1_Line3,
            Address1_City,
            Address1_StateOrProvince,
            Address1_PostalCode,
            Address1_County,
            Address1_Country,
            OwnerId,
            [ChannelPartnerType],
            CustomerTypeCode,
            OpenIncidentCount,
            ClosedIncidentCount,
            ContractCount,
            ContractAssetCount,
            ActiveContractAssetCount,
            [IsChannelPartner],
            [CreatedOn],
            [ModifiedOn],
            InactiveContractAssetCount,
			nceaccounttype
        )
        VALUES
        (source.AccountId, source.AccountNumber, source.AccountName, source.PrimaryContactId, source.StatusCode,
         source.Address1_Line1, source.Address1_Line2, source.Address1_Line3, source.Address1_City,
         source.Address1_StateOrProvince, source.Address1_PostalCode, source.Address1_County, source.Address1_Country,
         source.OwnerId, source.[ChannelPartnerType], source.CustomerTypeCode, source.OpenIncidentCount,
         source.ClosedIncidentCount, source.ContractCount, source.ContractAssetCount, source.ActiveContractAssetCount,
         source.[IsChannelPartner], source.CreatedOn, source.ModifiedOn, source.InactiveContractAssetCount, source.nceaccounttype)
    WHEN MATCHED THEN
        UPDATE SET AccountNumber = source.AccountNumber,
                   AccountName = source.AccountName,
                   PrimaryContactId = source.PrimaryContactId,
                   StatusCode = source.StatusCode,
                   Address1_Line1 = source.Address1_Line1,
                   Address1_Line2 = source.Address1_Line2,
                   Address1_Line3 = source.Address1_Line3,
                   Address1_City = source.Address1_City,
                   Address1_StateOrProvince = source.Address1_StateOrProvince,
                   Address1_PostalCode = source.Address1_PostalCode,
                   Address1_County = source.Address1_County,
                   Address1_Country = source.Address1_Country,
                   OwnerId = source.OwnerId,
                   t.ChannelPartnerType = source.[ChannelPartnerType],
                   CustomerTypeCode = source.CustomerTypeCode,
                   OpenIncidentCount = source.OpenIncidentCount,
                   ClosedIncidentCount = source.ClosedIncidentCount,
                   ContractCount = source.ContractCount,
                   ContractAssetCount = source.ContractAssetCount,
                   ActiveContractAssetCount = source.ActiveContractAssetCount,
                   t.IsChannelPartner = source.[IsChannelPartner],
                   CreatedOn = source.CreatedOn,
                   ModifiedOn = source.ModifiedOn,
                   InactiveContractAssetCount = source.InactiveContractAssetCount,
				   nceaccounttype = source.nceaccounttype;

END;
GO
PRINT N'Altering [astea].[Assets]'
GO
ALTER TABLE [astea].[Assets] ADD
[NEWCOLUMN1] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
GO
PRINT N'Altering [astea].[IncidentsActivities]'
GO
ALTER TABLE [astea].[IncidentsActivities] ADD
[NEWCOLUMN2] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
GO

