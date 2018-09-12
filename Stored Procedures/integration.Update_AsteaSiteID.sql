SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE	 PROC [integration].[Update_AsteaSiteID]

AS

BEGIN

-- Update ContractAssets with CompanyID
update ca set
ca.AsteaSiteID = a.company_id
from crm.ContractAssets ca
inner join astea.Assets a
on a.AssetId = cast(ca.ppt_assetid as varchar(50))

End

GO
