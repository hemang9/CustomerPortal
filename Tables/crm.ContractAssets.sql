CREATE TABLE [crm].[ContractAssets]
(
[ppt_contract_assetId] [uniqueidentifier] NOT NULL,
[ppt_asset_sla] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ppt_inactivation_date] [datetime] NULL,
[ppt_contractid] [uniqueidentifier] NULL,
[ppt_name] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ppt_description] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ppt_serialnumber] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ppt_assetlocationidName] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ppt_assetlocationid] [uniqueidentifier] NULL,
[ppt_purchase_order] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ppt_remote_monitoring] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ppt_billing_start_date] [datetime] NULL,
[ppt_billing_end_date] [datetime] NULL,
[ppt_fc_start_date] [datetime] NULL,
[ppt_fc_end_date] [datetime] NULL,
[ppt_inactivation_reasoncode] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ppt_assetid] [uniqueidentifier] NULL,
[ppt_parentid] [uniqueidentifier] NULL,
[ppt_hostname] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ppt_activation_date] [datetime] NULL,
[ContractStartDate] [datetime] NULL,
[ContractEndDate] [datetime] NULL,
[ContractCoverageStartDate] [datetime] NULL,
[Status] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AsteaSiteID] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsActive] [bit] NOT NULL CONSTRAINT [DF_ContractAssets_IsActive] DEFAULT ((0)),
[CalcContractAssetStartDate] [datetimeoffset] NULL,
[CalcContractAssetEndDate] [datetimeoffset] NULL
) ON [PRIMARY]
GO
ALTER TABLE [crm].[ContractAssets] ADD CONSTRAINT [PK_ContractAssets] PRIMARY KEY CLUSTERED  ([ppt_contract_assetId]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AssetId] ON [crm].[ContractAssets] ([ppt_assetid]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ContractId] ON [crm].[ContractAssets] ([ppt_contractid]) ON [PRIMARY]
GO
