CREATE TABLE [portal].[ActivityLog]
(
[Id] [uniqueidentifier] NOT NULL CONSTRAINT [DF_ActivityLog_Id] DEFAULT (newsequentialid()),
[UserId] [uniqueidentifier] NULL,
[OktaUserId] [nvarchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LoginRoles] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ActivityId] [int] NOT NULL,
[AccountId] [uniqueidentifier] NOT NULL,
[Message] [nvarchar] (1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LoggedOn] [datetimeoffset] NOT NULL CONSTRAINT [DF_ActivityLog_LoggedDate] DEFAULT (sysdatetimeoffset()),
[ModelType] [nvarchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ModelState] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [portal].[ActivityLog] ADD CONSTRAINT [PK_ActivityLog_1] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
ALTER TABLE [portal].[ActivityLog] ADD CONSTRAINT [FK_ActivityLog_Activity] FOREIGN KEY ([ActivityId]) REFERENCES [portal].[Activity] ([Id])
GO
