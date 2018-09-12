CREATE TABLE [crm].[Contacts]
(
[ContactId] [uniqueidentifier] NOT NULL,
[FirstName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FullName] [nvarchar] (160) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EMailAddress1] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ParentCustomerId] [uniqueidentifier] NULL,
[AccountId] [uniqueidentifier] NULL,
[Telephone1] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [crm].[Contacts] ADD CONSTRAINT [PK_Contacts] PRIMARY KEY CLUSTERED  ([ContactId]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AccountId] ON [crm].[Contacts] ([AccountId]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ParentCustomerId] ON [crm].[Contacts] ([ParentCustomerId]) ON [PRIMARY]
GO
