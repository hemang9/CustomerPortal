CREATE TABLE [crm].[Accounts]
(
[AccountId] [uniqueidentifier] NOT NULL,
[AccountNumber] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AccountName] [nvarchar] (160) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PrimaryContactId] [uniqueidentifier] NULL,
[StatusCode] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address1_Line1] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address1_Line2] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address1_Line3] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address1_City] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address1_StateOrProvince] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address1_PostalCode] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address1_County] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address1_Country] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OwnerId] [uniqueidentifier] NOT NULL,
[ChannelPartnerType] [int] NULL,
[CustomerTypeCode] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OpenIncidentCount] [int] NULL,
[ClosedIncidentCount] [int] NULL,
[ContractCount] [int] NULL,
[ContractAssetCount] [int] NULL,
[ActiveContractAssetCount] [int] NULL,
[IsChannelPartner] [bit] NULL,
[CreatedOn] [datetime] NULL,
[ModifiedOn] [datetime] NULL,
[PortalAdminId] [uniqueidentifier] NULL,
[nceaccounttype] [int] NULL,
[InactiveContractAssetCount] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [crm].[Accounts] ADD CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED  ([AccountId]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_OwnerId] ON [crm].[Accounts] ([OwnerId]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_PrimaryContactId] ON [crm].[Accounts] ([PrimaryContactId]) ON [PRIMARY]
GO
