CREATE TABLE [staging].[Assets]
(
[ppt_assetId] [uniqueidentifier] NOT NULL,
[ppt_oem_name] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ppt_accountid] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
