CREATE TABLE [staging].[IncidentsActivities]
(
[Id] [uniqueidentifier] NOT NULL CONSTRAINT [DF_IncidentsActivities] DEFAULT (newsequentialid()),
[AsteaOrderId] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Activity] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ActivityStartTime] [datetimeoffset] NULL,
[ActivityCompletionTime] [datetimeoffset] NULL,
[IsPartsOnlyCall] [bit] NULL,
[LastModifiedBy] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastModifiedOn] [datetimeoffset] NULL,
[ETATime] [datetimeoffset] NULL
) ON [PRIMARY]
GO
ALTER TABLE [staging].[IncidentsActivities] ADD CONSTRAINT [PK_astea.IncidentsActivities] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
