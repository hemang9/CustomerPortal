CREATE TABLE [security].[Groups]
(
[GroupId] [int] NOT NULL IDENTITY(1, 1),
[GroupName] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[GroupTypeId] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [security].[Groups] ADD CONSTRAINT [PK_Groups] PRIMARY KEY CLUSTERED  ([GroupId]) ON [PRIMARY]
GO
ALTER TABLE [security].[Groups] ADD CONSTRAINT [FK_Groups_GroupTypes] FOREIGN KEY ([GroupTypeId]) REFERENCES [security].[GroupTypes] ([Id])
GO
