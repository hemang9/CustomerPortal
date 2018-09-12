CREATE TABLE [portal].[Activity]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[ActivityName] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_Activity_ActivityName] DEFAULT (''),
[ActivityDescription] [varchar] (512) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_Activity_ActivityDescription] DEFAULT ('')
) ON [PRIMARY]
GO
ALTER TABLE [portal].[Activity] ADD CONSTRAINT [PK_Activity] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
