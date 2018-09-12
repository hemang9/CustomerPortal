CREATE TABLE [security].[RequiredGroupCollectionGroups]
(
[GroupCollectionId] [int] NOT NULL,
[GroupId] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [security].[RequiredGroupCollectionGroups] ADD CONSTRAINT [PK_RequiredGroupCollectionGroups] PRIMARY KEY CLUSTERED  ([GroupCollectionId], [GroupId]) ON [PRIMARY]
GO
ALTER TABLE [security].[RequiredGroupCollectionGroups] ADD CONSTRAINT [FK_RequiredGroupCollectionGroups_Groups] FOREIGN KEY ([GroupId]) REFERENCES [security].[Groups] ([GroupId])
GO
ALTER TABLE [security].[RequiredGroupCollectionGroups] ADD CONSTRAINT [FK_RequiredGroupCollectionGroups_RequiredGroupCollection] FOREIGN KEY ([GroupCollectionId]) REFERENCES [security].[RequiredGroupCollections] ([GroupCollectionId])
GO
