SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROC [integration].[Merge_LegalEntities]

AS

BEGIN

MERGE INTO crm.LegalEntities AS t
USING
(
	SELECT 
		ppt_legalentityId
		,ppt_name
		,ppt_phone
		,OwnerId
	FROM staging.LegalEntities
) AS source
ON (t.ppt_legalentityId = source.ppt_legalentityId)
WHEN NOT MATCHED THEN
	INSERT
	(
		ppt_legalentityId
		,ppt_name
		,ppt_phone
		,OwnerId
	)
	VALUES
	(
		source.ppt_legalentityId
		,source.ppt_name
		,source.ppt_phone
		,source.OwnerId
	)
WHEN MATCHED THEN
UPDATE SET 
	ppt_name = source.ppt_name
	,ppt_phone = source.ppt_phone
	,OwnerId = source.OwnerId
;

END


GO
