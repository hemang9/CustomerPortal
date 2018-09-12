CREATE TABLE [astea].[TechnicalContacts]
(
[Id] [uniqueidentifier] NOT NULL CONSTRAINT [DF_TechnicalContacts_Id] DEFAULT (newsequentialid()),
[AsteaPersonId] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CompanyId] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Country] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedOn] [datetimeoffset] NOT NULL CONSTRAINT [DF_TechnicalContacts_CreatedOn] DEFAULT (sysdatetimeoffset()),
[CrmId] [uniqueidentifier] NULL,
[EmailAddress] [varchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[FirstName] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[LastModifiedOn] [datetimeoffset] NOT NULL CONSTRAINT [DF_TechnicalContacts_LastModifiedOn] DEFAULT (sysdatetimeoffset()),
[LastName] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Line1] [varchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Line2] [varchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Line3] [varchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Line4] [varchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Locality] [varchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PhoneNumber] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PostalCode] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Region] [varchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UserId] [uniqueidentifier] NULL,
[AccountId] [uniqueidentifier] NULL,
[Source] [nvarchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [astea].[TechnicalContacts] ADD CONSTRAINT [PK_TechnicalContacts_1] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_TechnicalContacts] ON [astea].[TechnicalContacts] ([AsteaPersonId]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Firstname] ON [astea].[TechnicalContacts] ([FirstName]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Lastname] ON [astea].[TechnicalContacts] ([LastName]) ON [PRIMARY]
GO
