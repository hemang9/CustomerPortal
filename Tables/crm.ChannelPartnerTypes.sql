CREATE TABLE [crm].[ChannelPartnerTypes]
(
[Id] [int] NOT NULL,
[CrmValue] [int] NOT NULL,
[ChannelPartnerType] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [crm].[ChannelPartnerTypes] ADD CONSTRAINT [PK_ChannelPartnerTypes] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_CrmValue] ON [crm].[ChannelPartnerTypes] ([CrmValue]) ON [PRIMARY]
GO
