CREATE TABLE [security].[GroupTypes]
(
[Id] [uniqueidentifier] NOT NULL CONSTRAINT [DF_GroupTypes_Id] DEFAULT (newsequentialid()),
[GroupTypeName] [nvarchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [security].[GroupTypes] ADD CONSTRAINT [PK_GroupTypes] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
