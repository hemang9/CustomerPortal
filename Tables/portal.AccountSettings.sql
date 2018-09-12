CREATE TABLE [portal].[AccountSettings]
(
[AccountId] [uniqueidentifier] NOT NULL,
[AccountNumber] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CanViewContractsAndTickets] [bit] NOT NULL CONSTRAINT [DF_AccountSettings_IsViewContractsAndTicketsAllowed] DEFAULT ((0)),
[CanOpenTickets] [bit] NOT NULL CONSTRAINT [DF_AccountSettings_IsOpenTicketsAllowed] DEFAULT ((0)),
[CanParkPlaceContactCustomer] [bit] NOT NULL CONSTRAINT [DF_AccountSettings_IsParkPlaceAllowedToContactCustomer] DEFAULT ((0)),
[IsDefault] [bit] NOT NULL CONSTRAINT [DF_AccountSettings_IsDefault] DEFAULT ((1)),
[IsApproved] [bit] NOT NULL CONSTRAINT [DF_AccountSettings_IsAccountSettingsApproved] DEFAULT ((0)),
[ApprovedOn] [datetimeoffset] NULL,
[CreatedOn] [datetimeoffset] NOT NULL CONSTRAINT [DF_AccountSettings_DateCreated] DEFAULT (sysdatetimeoffset()),
[LastModifiedOn] [datetimeoffset] NOT NULL CONSTRAINT [DF_AccountSettings_LastModifiedOn] DEFAULT (sysdatetimeoffset()),
[LastModifiedUser] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [portal].[AccountSettings] ADD CONSTRAINT [PK_AccountSettings] PRIMARY KEY CLUSTERED  ([AccountId]) ON [PRIMARY]
GO
