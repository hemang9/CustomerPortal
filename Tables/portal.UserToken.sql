CREATE TABLE [portal].[UserToken]
(
[Token] [nvarchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[UserID] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TokenExpiration] [datetime] NOT NULL,
[TokenUsedDate] [datetime] NULL,
[DateCreated] [datetime] NOT NULL,
[DateModified] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [portal].[UserToken] ADD CONSTRAINT [PK_UserToken] PRIMARY KEY CLUSTERED  ([Token]) ON [PRIMARY]
GO
ALTER TABLE [portal].[UserToken] ADD CONSTRAINT [FK_UserToken_UserRegistration] FOREIGN KEY ([UserID]) REFERENCES [portal].[UserRegistration] ([UserID])
GO
