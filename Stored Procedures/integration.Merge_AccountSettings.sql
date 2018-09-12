SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/**
HJB 3/13/2018 create the merge operation for Merge_AccountSettings



**********************************************
EXEC [dbo].[Merge_AccountSettings]
**********************************************

*/

CREATE PROC [integration].[Merge_AccountSettings]
AS
BEGIN

    MERGE INTO [portal].[AccountSettings] AS t
    USING
    (
        SELECT DISTINCT
               [a].[AccountId],
               [a].[AccountNumber],
               CAST(CASE
                        WHEN a.[ChannelPartnerType] = 1 --Growth partner or Tier 1
                             OR a.[ChannelPartnerType] = 3 THEN
                            1
                        ELSE
                            0
                    END AS BIT) AS [CanViewContractsAndTickets],
               CAST(CASE
                        WHEN a.[ChannelPartnerType] = 1
                             OR a.[ChannelPartnerType] = 3 THEN
                            1
                        ELSE
                            0
                    END AS BIT) AS [CanOpenTickets],
               CAST(CASE
                        WHEN a.[ChannelPartnerType] = 1
                             OR a.[ChannelPartnerType] = 3 THEN
                            1
                        ELSE
                            0
                    END AS BIT) AS [CanParkPlaceContactCustomer],
               CAST(1 AS BIT) AS [IsDefault]
        FROM [crm].[Accounts] a (NOLOCK)
        WHERE a.[IsChannelPartner] = 1
    ) AS source
    ON (t.AccountId = source.AccountId)
    WHEN NOT MATCHED THEN
        INSERT
        (
            [AccountId],
            [AccountNumber],
            [CanViewContractsAndTickets],
            [CanOpenTickets],
            [CanParkPlaceContactCustomer],
            [IsDefault]
        )
        VALUES
        ([AccountId], [AccountNumber], [CanViewContractsAndTickets], [CanOpenTickets], [CanParkPlaceContactCustomer],
         [IsDefault]);

--WHEN MATCHED THEN
--	UPDATE SET 
--	   [IncidentType]=source.[IncidentType]
--      ,[IncidentDescription]=source.[IncidentDescription]
--      ,[Status]=source.[Status]
--      ,[EntryDateTime]=source.[EntryDateTime]
--      ,[CloseDateTime]=source.[CloseDateTime]
--      ,[EnteredByUser]=source.[EnteredByUser]
--      ,[SeverityCode]=source.[SeverityCode]
--      ,[City]=source.[City]
--      ,[State]=source.[State]
--      ,[AccountCustomerName]=source.[AccountCustomerName]
--      ,[AccountCompanyCode]=source.[AccountCompanyCode]
--      ,[EndUserCustomerName]=source.[EndUserCustomerName]
--      ,[EndUserCompanyCode]=source.[EndUserCompanyCode]
--      ,[ProductLine]=source.[ProductLine]
--      ,[ItemDescription]=source.[ItemDescription]
--      ,[SerialNumber]=source.[SerialNumber]
--      ,[ContractNumber]=source.[ContractNumber]
--      ,[ContractAssetID]=source.[ContractAssetID]
--      ,[SiteContact]=source.[SiteContact]
--      ,[AltSiteContact]=source.[AltSiteContact]
--      ,[SolutionNotes]=source.[SolutionNotes]
--      ,[ProblemNotes]=source.[ProblemNotes]
--      ,[IsActiveAsset]=source.[IsActiveAsset]
--      ,[SiteDescription]=source.[SiteDescription]
--      ,[IsOpen]=source.[IsOpen]
--      ,[SourceSystem]=source.[SourceSystem]
--      ,[LastModifiedOn]=source.[LastModifiedOn]
--      ,[ServiceOrderShipmentTracking]=source.[ServiceOrderShipmentTracking];




END;
GO
