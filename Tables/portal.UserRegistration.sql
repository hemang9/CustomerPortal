CREATE TABLE [portal].[UserRegistration]
(
[UserID] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[FirstName] [nvarchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[LastName] [nvarchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[IsCustomerConsentGiven] [bit] NOT NULL,
[DateCreated] [datetime] NOT NULL,
[DateModified] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [portal].[UserRegistration] ADD CONSTRAINT [PK_UserRegistration_1] PRIMARY KEY CLUSTERED  ([UserID]) ON [PRIMARY]
GO
