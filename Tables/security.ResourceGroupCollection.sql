CREATE TABLE [security].[ResourceGroupCollection]
(
[ResourceId] [int] NOT NULL,
[GroupCollectionId] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [security].[ResourceGroupCollection] ADD CONSTRAINT [PK_ResourceGroups] PRIMARY KEY CLUSTERED  ([ResourceId], [GroupCollectionId]) ON [PRIMARY]
GO
ALTER TABLE [security].[ResourceGroupCollection] ADD CONSTRAINT [FK_ResourceGroups_Groups] FOREIGN KEY ([GroupCollectionId]) REFERENCES [security].[RequiredGroupCollections] ([GroupCollectionId])
GO
ALTER TABLE [security].[ResourceGroupCollection] ADD CONSTRAINT [FK_ResourceGroups_Resources] FOREIGN KEY ([ResourceId]) REFERENCES [security].[Resources] ([ResourceId])
GO
