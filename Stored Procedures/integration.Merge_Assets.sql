SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/*
MOD HISTORY
----
HJB  3/7/2018   Merge the assets latest schema changes
-----
EXEC stmt
 exec [dbo].[Merge_Assets]
**/
CREATE PROC [integration].[Merge_Assets]
AS
BEGIN

    MERGE INTO crm.Assets AS t
    USING
    (
        SELECT ppt_assetId,
               ppt_oem_name,
               ppt_accountid
        FROM staging.Assets
    ) AS source
    ON (t.ppt_assetId = source.ppt_assetId)
    WHEN NOT MATCHED THEN
        INSERT
        (
            ppt_assetId,
            ppt_oem_name,
            ppt_accountid
        )
        VALUES
        (source.ppt_assetId, source.ppt_oem_name, source.ppt_accountid)
    WHEN MATCHED THEN
        UPDATE SET ppt_oem_name = source.ppt_oem_name,
                   ppt_accountid = source.ppt_accountid;

END;


GO
