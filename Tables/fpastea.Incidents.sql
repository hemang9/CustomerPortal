CREATE TABLE [fpastea].[Incidents]
(
[IncidentNumber] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[IncidentType] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IncidentDescription] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Status] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EntryDateTime] [datetimeoffset] NOT NULL,
[CloseDateTime] [datetimeoffset] NULL,
[EnteredByUser] [varchar] (90) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SeverityCode] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[City] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[State] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AccountCustomerName] [varchar] (160) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[AccountCompanyCode] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[EndUserCustomerName] [varchar] (120) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[EndUserCompanyCode] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ProductLine] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ItemDescription] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SerialNumber] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ContractNumber] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ContractAssetID] [uniqueidentifier] NULL,
[SiteContact] [varchar] (120) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AltSiteContact] [varchar] (120) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SolutionNotes] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ProblemNotes] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsActiveAsset] [bit] NOT NULL CONSTRAINT [DF_Incidents_IsActiveAsset] DEFAULT ((0)),
[SiteDescription] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsOpen] [bit] NOT NULL CONSTRAINT [DF_Incidents_IsOpen] DEFAULT ((0)),
[SourceSystem] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[LastModifiedOn] [datetimeoffset] NOT NULL,
[ServiceOrderShipmentTracking] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SiteName] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AccountId] [uniqueidentifier] NULL,
[EndUserAccountId] [uniqueidentifier] NULL,
[ppt_contractId] [uniqueidentifier] NULL,
[ppt_assetlocationid] [uniqueidentifier] NULL,
[ETADateTime] [datetimeoffset] NULL
) ON [PRIMARY]
GO
ALTER TABLE [fpastea].[Incidents] ADD CONSTRAINT [PK_Incidents] PRIMARY KEY CLUSTERED  ([IncidentNumber]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AccountCompanyCode] ON [fpastea].[Incidents] ([AccountCompanyCode]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AccountId] ON [fpastea].[Incidents] ([AccountId]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ContractAssetID] ON [fpastea].[Incidents] ([ContractAssetID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ContractNumber] ON [fpastea].[Incidents] ([ContractNumber]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_EndUserAccountId] ON [fpastea].[Incidents] ([EndUserAccountId]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_EndUserCompanyCode] ON [fpastea].[Incidents] ([EndUserCompanyCode]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ppt_assetlocationid] ON [fpastea].[Incidents] ([ppt_assetlocationid]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ppt_contractId] ON [fpastea].[Incidents] ([ppt_contractId]) ON [PRIMARY]
GO
