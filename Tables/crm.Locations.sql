CREATE TABLE [crm].[Locations]
(
[ppt_hardwarelocationId] [uniqueidentifier] NOT NULL,
[ppt_AccountId] [uniqueidentifier] NULL,
[ppt_name] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ppt_primaryfeid] [uniqueidentifier] NULL,
[ppt_line1] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ppt_line2] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ppt_city] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ppt_stateorprovince] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ppt_postalcode] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ppt_country] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CalcLocationName] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ppt_line3] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [crm].[Locations] ADD CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED  ([ppt_hardwarelocationId]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AccountId] ON [crm].[Locations] ([ppt_AccountId]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_PrimaryFeId] ON [crm].[Locations] ([ppt_primaryfeid]) ON [PRIMARY]
GO
