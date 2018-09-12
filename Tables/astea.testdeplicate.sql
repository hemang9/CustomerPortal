CREATE TABLE [astea].[testdeplicate]
(
[Id] [uniqueidentifier] NULL,
[order_id] [varchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[request_id] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[bpart_id] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[carrier_ref_no] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[carrier_id] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dterm_id] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[last_change_by] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[updated_at] [datetime] NULL
) ON [PRIMARY]
GO
