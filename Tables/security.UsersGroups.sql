CREATE TABLE [security].[UsersGroups]
(
[UserId] [uniqueidentifier] NOT NULL,
[GroupId] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [security].[UsersGroups] ADD CONSTRAINT [PK_UsersGroups] PRIMARY KEY CLUSTERED  ([UserId], [GroupId]) ON [PRIMARY]
GO
ALTER TABLE [security].[UsersGroups] ADD CONSTRAINT [FK_UsersGroups_Groups] FOREIGN KEY ([GroupId]) REFERENCES [security].[Groups] ([GroupId])
GO
