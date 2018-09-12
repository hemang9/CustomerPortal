SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


/*
EXEC stmt
 exec [dbo].[Merge_AsteaAssets]
**/

CREATE PROC [integration].[Merge_AsteaAssets]
AS
BEGIN
    ----Upsert [Astea].[Assets]

    MERGE INTO astea.Assets AS t
    USING
    (
        SELECT [AssetId],
               [serial_no],
               [company_id],
               [bpart_id],
               [descr],
               [item_id],
               [ProductClass2],
               [ProductClass3],
               [qty],
               [tagno]
        FROM [staging].[AsteaAssets]
    ) AS source
    ON (t.item_id = source.item_id)
    WHEN NOT MATCHED THEN
        INSERT
        (
            [AssetId],
            [serial_no],
            [company_id],
            [bpart_id],
            [descr],
            [item_id],
            [ProductClass2],
            [ProductClass3],
            [qty],
            [tagno]
        )
        VALUES
        (source.[AssetId], source.[serial_no], source.[company_id], source.[bpart_id], source.[descr],
         source.[item_id], source.[ProductClass2], source.[ProductClass3], source.[qty], source.[tagno])
    WHEN MATCHED AND (
                         ISNULL(t.AssetId, '') <> ISNULL(source.AssetId, '')
                         OR ISNULL(t.[serial_no], '') <> ISNULL(source.[serial_no], '')
                         OR ISNULL(t.[company_id], '') <> ISNULL(source.[company_id], '')
                         OR ISNULL(t.[bpart_id], '') <> ISNULL(source.[bpart_id], '')
                         OR ISNULL(t.[descr], '') <> ISNULL(source.[descr], '')
                         OR t.[item_id] <> source.[item_id]
                         OR ISNULL(t.[ProductClass2], '') <> ISNULL(source.[ProductClass2], '')
                         OR ISNULL(t.[ProductClass3], '') <> ISNULL(source.[ProductClass3], '')
                         OR ISNULL(t.[qty], '') <> ISNULL(source.[qty], '')
                         OR ISNULL(t.[tagno], '') <> ISNULL(source.[tagno], '')
                     ) THEN
        UPDATE SET AssetId = source.AssetId,
                   [serial_no] = source.[serial_no],
                   [company_id] = source.[company_id],
                   [bpart_id] = source.[bpart_id],
                   [descr] = source.[descr],
                   [ProductClass2] = source.[ProductClass2],
                   [ProductClass3] = source.[ProductClass3],
                   [qty] = source.[qty],
                   [tagno] = source.[tagno];
END;
GO
