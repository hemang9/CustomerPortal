CREATE TABLE [security].[Resources]
(
[ResourceId] [int] NOT NULL IDENTITY(1, 1),
[ResourceName] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [security].[Resources] ADD CONSTRAINT [PK_security.Resources] PRIMARY KEY CLUSTERED  ([ResourceId]) ON [PRIMARY]
GO
