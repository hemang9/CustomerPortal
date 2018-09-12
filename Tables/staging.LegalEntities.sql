CREATE TABLE [staging].[LegalEntities]
(
[ppt_legalentityId] [uniqueidentifier] NOT NULL,
[ppt_name] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ppt_phone] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OwnerId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
