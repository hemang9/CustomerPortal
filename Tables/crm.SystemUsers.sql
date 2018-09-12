CREATE TABLE [crm].[SystemUsers]
(
[SystemUserId] [uniqueidentifier] NOT NULL,
[FullName] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FirstName] [nvarchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastName] [nvarchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address1_Telephone1] [nvarchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[InternalEMailAddress] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ParentSystemUserId] [uniqueidentifier] NULL,
[ParentSystemUserIdName] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [crm].[SystemUsers] ADD CONSTRAINT [PK_SystemUsers] PRIMARY KEY CLUSTERED  ([SystemUserId]) ON [PRIMARY]
GO
