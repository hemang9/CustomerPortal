CREATE TABLE [crm].[Contracts]
(
[ppt_contractId] [uniqueidentifier] NOT NULL,
[ppt_accountid] [uniqueidentifier] NULL,
[ppt_enduserid] [uniqueidentifier] NULL,
[ppt_enduseridName] [nvarchar] (160) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ppt_accountidName] [nvarchar] (160) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ppt_primarycontactid] [uniqueidentifier] NULL,
[ppt_contractnumber] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ppt_name] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ppt_contractsource] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[statuscode] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsActive] [bit] NULL,
[OwnerId] [uniqueidentifier] NOT NULL,
[ppt_purchase_order] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ppt_term_start_date] [datetime] NULL,
[ppt_term_end_date] [datetime] NULL,
[ppt_coveragestartdate] [datetime] NULL,
[ppt_poexpirydate] [datetime] NULL,
[ppt_billto_address_line1] [nvarchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ppt_billto_address_line2] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ppt_billto_address_city] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ppt_billto_address_stateorprovince] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ppt_billto_address_country] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ppt_billto_address_postalcode] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ppt_billto_emailaddress] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ppt_billing_frequency] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ppt_billingmethod] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ppt_payment_terms] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ppt_customerscontract] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ppt_acquisitionoriginatingcontractnumber] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ppt_origination_date] [datetime] NULL,
[AssetCount] [int] NULL,
[ActiveContractAssetCount] [int] NULL,
[InactiveContractAssetCount] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [crm].[Contracts] ADD CONSTRAINT [PK_Contracts] PRIMARY KEY CLUSTERED  ([ppt_contractId]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_OwnerId] ON [crm].[Contracts] ([OwnerId]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AccountId] ON [crm].[Contracts] ([ppt_accountid]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_PrimaryContactId] ON [crm].[Contracts] ([ppt_primarycontactid]) ON [PRIMARY]
GO
