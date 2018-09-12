SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROC [integration].[Merge_Locations]

AS

BEGIN

MERGE INTO crm.Locations AS t
USING
(
	SELECT 
		ppt_hardwarelocationId
		,ppt_AccountId
		,ppt_name
		,ppt_primaryfeid
		,ppt_line1
		,ppt_line2
		,ppt_line3
		,ppt_city
		,ppt_stateorprovince
		,ppt_postalcode
		,ppt_country
	FROM staging.Locations
) AS source
ON (t.ppt_hardwarelocationId = source.ppt_hardwarelocationId)
WHEN NOT MATCHED THEN
	INSERT
	(
		ppt_hardwarelocationId
		,ppt_AccountId
		,ppt_name
		,ppt_primaryfeid
		,ppt_line1
		,ppt_line2
		,ppt_line3
		,ppt_city
		,ppt_stateorprovince
		,ppt_postalcode
		,ppt_country
	)
	VALUES
	(
		source.ppt_hardwarelocationId
		,source.ppt_AccountId
		,source.ppt_name
		,source.ppt_primaryfeid
		,source.ppt_line1
		,source.ppt_line2
		,source.ppt_line3
		,source.ppt_city
		,source.ppt_stateorprovince
		,source.ppt_postalcode
		,source.ppt_country
	)
WHEN MATCHED THEN
UPDATE SET
	ppt_AccountId = source.ppt_AccountId
	,ppt_name = source.ppt_name
	,ppt_primaryfeid = source.ppt_primaryfeid
	,ppt_line1 = source.ppt_line1
	,ppt_line2 = source.ppt_line2
	,ppt_line3 = source.ppt_line3
	,ppt_city = source.ppt_city
	,ppt_stateorprovince = source.ppt_stateorprovince
	,ppt_postalcode = source.ppt_postalcode
	,ppt_country = source.ppt_country
;

END


GO
