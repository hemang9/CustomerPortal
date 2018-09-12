SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROC [integration].[Merge_SystemUsers]

AS

BEGIN

MERGE INTO crm.SystemUsers AS t
USING
(
	SELECT 
		SystemUserId
		,FullName
		,FirstName
		,LastName
		,Address1_Telephone1
		,InternalEMailAddress
		,ParentSystemUserId
		,ParentSystemUserIdName
	FROM staging.SystemUsers
) AS source
ON (t.SystemUserId = source.SystemUserId)
WHEN NOT MATCHED THEN
	INSERT
	(
		SystemUserId
		,FullName
		,FirstName
		,LastName
		,Address1_Telephone1
		,InternalEMailAddress
		,ParentSystemUserId
		,ParentSystemUserIdName
	)
	VALUES
	(
		source.SystemUserId
		,source.FullName
		,source.FirstName
		,source.LastName
		,source.Address1_Telephone1
		,source.InternalEMailAddress
		,source.ParentSystemUserId
		,source.ParentSystemUserIdName
	)
WHEN MATCHED THEN
UPDATE SET 
	FullName = source.FullName
	,FirstName = source.FirstName
	,LastName = source.LastName
	,Address1_Telephone1 = source.Address1_Telephone1
	,InternalEMailAddress = source.InternalEMailAddress
	,ParentSystemUserId  = source.ParentSystemUserId
	,ParentSystemUserIdName  = source.ParentSystemUserIdName
;

END


GO
