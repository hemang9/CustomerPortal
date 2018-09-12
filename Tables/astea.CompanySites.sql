CREATE TABLE [astea].[CompanySites]
(
[company_id] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[GpAccountNo] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SiteNo] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[parent_company_id] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[contact_person_id] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[is_site] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CompanyPHone] [varchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LegalEntity] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CompanyName] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[is_active] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HardwareLocationId] [uniqueidentifier] NULL,
[address_1] [varchar] (254) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[address_2] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[address_3] [varchar] (254) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[attention] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[city] [varchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[country_id] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[latitude] [float] NULL,
[longitude] [float] NULL,
[AddressPhone] [varchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[state_prov_id] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[zip] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AccountId] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
ALTER TABLE [astea].[CompanySites] ADD CONSTRAINT [PK_CompanySites] PRIMARY KEY CLUSTERED  ([company_id]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_GpAccountNo] ON [astea].[CompanySites] ([GpAccountNo]) ON [PRIMARY]
GO
