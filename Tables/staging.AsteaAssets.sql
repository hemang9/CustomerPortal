CREATE TABLE [staging].[AsteaAssets]
(
[AssetId] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[serial_no] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[company_id] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[bpart_id] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[descr] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[item_id] [int] NOT NULL,
[ProductClass2] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ProductClass3] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[qty] [float] NULL,
[tagno] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [staging].[AsteaAssets] ADD CONSTRAINT [PK_Item_Id] PRIMARY KEY CLUSTERED  ([item_id]) ON [PRIMARY]
GO
