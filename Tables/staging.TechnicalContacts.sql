CREATE TABLE [staging].[TechnicalContacts]
(
[Id] [uniqueidentifier] NOT NULL CONSTRAINT [DF_TechnicalContacts_Id] DEFAULT (newsequentialid()),
[AsteaPersonId] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CompanyId] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Country] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedOn] [datetimeoffset] NOT NULL CONSTRAINT [DF_TechnicalContacts_CreatedOnStg] DEFAULT (sysdatetimeoffset()),
[CrmId] [uniqueidentifier] NULL,
[EmailAddress] [varchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[FirstName] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[LastModifiedOn] [datetimeoffset] NOT NULL CONSTRAINT [DF_TechnicalContacts_LastModifiedOnStg] DEFAULT (sysdatetimeoffset()),
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
ALTER TABLE [staging].[TechnicalContacts] ADD CONSTRAINT [PK_TechnicalContacts] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
