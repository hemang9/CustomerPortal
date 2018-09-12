CREATE TABLE [astea].[IncidentsPartShipmentTracking]
(
[Id] [uniqueidentifier] NOT NULL CONSTRAINT [DF_IncidentsPartShipmentTracking] DEFAULT (newsequentialid()),
[order_id] [varchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[request_id] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[bpart_id] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[carrier_ref_no] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[carrier_id] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dterm_id] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[last_change_by] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[updated_at] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [astea].[IncidentsPartShipmentTracking] ADD CONSTRAINT [PK_IncidentsPartShipmentTracking] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
