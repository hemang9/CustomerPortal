SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


/*

HJB: 3/26/2018 Commenting out Accounts and TechnicalContacts

*/
CREATE PROC [integration].[Truncate_AllStagingTables]

AS

TRUNCATE TABLE staging.Accounts
TRUNCATE TABLE staging.Assets
TRUNCATE TABLE staging.AsteaAssets
TRUNCATE TABLE staging.CompanySites
TRUNCATE TABLE staging.Contacts
TRUNCATE TABLE staging.ContractAssets
TRUNCATE TABLE staging.Contracts
TRUNCATE TABLE staging.Incidents
TRUNCATE TABLE [staging].[IncidentsInteractions]
TRUNCATE TABLE [staging].[TechnicalContacts]
TRUNCATE TABLE [staging].[IncidentsPartShipmentTracking] 
TRUNCATE TABLE [staging].IncidentsActivities


TRUNCATE TABLE staging.LegalEntities
TRUNCATE TABLE staging.Locations
TRUNCATE TABLE staging.SystemUsers
TRUNCATE TABLE [staging].[ChannelPartnerTypes]




GO
