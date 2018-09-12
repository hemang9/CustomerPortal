CREATE TABLE [crm].[Assets]
(
[ppt_assetId] [uniqueidentifier] NOT NULL,
[ppt_oem_name] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ppt_accountid] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
ALTER TABLE [crm].[Assets] ADD CONSTRAINT [PK_Assets] PRIMARY KEY CLUSTERED  ([ppt_assetId]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Assets] ON [crm].[Assets] ([ppt_accountid]) ON [PRIMARY]
GO
