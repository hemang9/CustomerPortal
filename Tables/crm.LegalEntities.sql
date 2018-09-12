CREATE TABLE [crm].[LegalEntities]
(
[ppt_legalentityId] [uniqueidentifier] NOT NULL,
[ppt_name] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ppt_phone] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OwnerId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [crm].[LegalEntities] ADD CONSTRAINT [PK_LegalEntities] PRIMARY KEY CLUSTERED  ([ppt_legalentityId]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_OwnerId] ON [crm].[LegalEntities] ([OwnerId]) ON [PRIMARY]
GO
