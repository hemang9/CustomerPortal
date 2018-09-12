CREATE TABLE [portal].[UserAccessLog]
(
[UserID] [uniqueidentifier] NOT NULL,
[AcessedOn] [datetimeoffset] NOT NULL CONSTRAINT [DF_UserAccessLog_AcessedOn] DEFAULT (sysdatetimeoffset())
) ON [PRIMARY]
GO
ALTER TABLE [portal].[UserAccessLog] ADD CONSTRAINT [PK_UserAccessLog] PRIMARY KEY CLUSTERED  ([UserID], [AcessedOn]) ON [PRIMARY]
GO
