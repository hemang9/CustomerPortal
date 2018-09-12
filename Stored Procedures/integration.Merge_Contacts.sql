SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


/*
MOD HISTORY
----
HJB  3/7/2018   Merge the contacts latest schema changes
-----
EXEC stmt
 exec [dbo].[Merge_Contacts]
**/

CREATE PROC [integration].[Merge_Contacts]

AS

BEGIN

MERGE INTO crm.Contacts AS t
USING
(
	SELECT 
		ContactId
		,FirstName
		,LastName
		,FullName
		,EMailAddress1
		,ParentCustomerId
		,AccountId
		,Telephone1
	FROM staging.Contacts
) AS source
ON (t.ContactId = source.ContactId)
WHEN NOT MATCHED THEN
	INSERT
	(
		ContactId
		,FirstName
		,LastName
		,FullName
		,EMailAddress1
		,ParentCustomerId
		,AccountId
		,Telephone1
	)
	VALUES
	(
		source.ContactId
		,source.FirstName
		,source.LastName
		,source.FullName
		,source.EMailAddress1
		,source.ParentCustomerId
		,source.AccountId
		,source.Telephone1
	)
WHEN MATCHED THEN
	UPDATE SET 
		FirstName = source.FirstName
		,LastName = source.LastName
		,FullName = source.FullName
		,EMailAddress1 = source.EMailAddress1
		,ParentCustomerId = source.ParentCustomerId
		,AccountId = source.AccountId
		,Telephone1 = source.Telephone1
;

END


GO
