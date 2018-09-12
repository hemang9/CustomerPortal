SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


/*
MOD HISTORY
----
HJB  3/7/2018   Merge the accounts latest
-----
EXEC stmt
 exec [dbo].[Merge_ChannelPartnerTypes]
**/
CREATE PROC [integration].[Merge_ChannelPartnerTypes]



AS



BEGIN

MERGE INTO crm.ChannelPartnerTypes AS t
USING
(
	SELECT 
		[Id]
      ,[CrmValue]
      ,[ChannelPartnerType]
	FROM [staging].[ChannelPartnerTypes]
) AS source
ON (t.Id = source.[Id])
WHEN NOT MATCHED THEN
	INSERT
	(
		 [Id]
      ,[CrmValue]
      ,[ChannelPartnerType]
	)
	VALUES
	(
		source.[Id]
      ,source.[CrmValue]
      ,source.[ChannelPartnerType]
	)
WHEN MATCHED THEN
UPDATE SET 
		 [Id] =source.[Id]
      ,[CrmValue] =source.[CrmValue]
      ,[ChannelPartnerType] =source.[ChannelPartnerType]
;

END
GO
