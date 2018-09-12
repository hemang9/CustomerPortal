CREATE TABLE [staging].[ChannelPartnerTypes]
(
[Id] [int] NOT NULL,
[CrmValue] [int] NOT NULL,
[ChannelPartnerType] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [staging].[ChannelPartnerTypes] ADD CONSTRAINT [PK_ChannelPartnerTypes] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
