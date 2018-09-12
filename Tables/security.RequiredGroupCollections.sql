CREATE TABLE [security].[RequiredGroupCollections]
(
[GroupCollectionId] [int] NOT NULL IDENTITY(1, 1),
[GroupCollectionName] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [security].[RequiredGroupCollections] ADD CONSTRAINT [PK_RequiredGroupCollection] PRIMARY KEY CLUSTERED  ([GroupCollectionId]) ON [PRIMARY]
GO
