CREATE TABLE [staging].[IncidentsInteractions]
(
[Id] [uniqueidentifier] NOT NULL CONSTRAINT [DF_IncidentsInteractions_CreatedOnStg] DEFAULT (newsequentialid()),
[AsteaOrderId] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Comment] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreatedBy] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreatedOn] [datetimeoffset] NOT NULL CONSTRAINT [DF_IncidentsInteractions_CreatedOn] DEFAULT (sysdatetimeoffset()),
[IncidentNumber] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[LastModifiedBy] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[LastModifiedOn] [datetimeoffset] NOT NULL CONSTRAINT [DF_IncidentsInteractions_LastModifiedOn] DEFAULT (sysdatetimeoffset())
) ON [PRIMARY]
GO
ALTER TABLE [staging].[IncidentsInteractions] ADD CONSTRAINT [PK_Interactions] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
