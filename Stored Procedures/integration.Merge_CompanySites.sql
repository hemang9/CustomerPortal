SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
 

 /*
EXEC stmt
 exec [dbo].[Merge_CompanySites]
**/

CREATE PROC [integration].[Merge_CompanySites]

AS

BEGIN
------Upsert [astea].[CompanySites]

MERGE INTO [astea].[CompanySites] AS t
USING
(
	SELECT [company_id]
      
      ,[GpAccountNo]
      ,[SiteNo]
      ,[parent_company_id]
      ,[contact_person_id]
      ,[is_site]
      ,[CompanyPHone]
      ,[LegalEntity]
      ,[CompanyName]
      ,[is_active]
      ,[HardwareLocationId]
      ,[address_1]
      ,[address_2]
      ,[address_3]
      ,[attention]
      ,[city]
      ,[country_id]
      ,[latitude]
      ,[longitude]
      ,[AddressPhone]
      ,[state_prov_id]
      ,[zip]
  FROM [staging].[CompanySites]
) AS source
ON (t.company_id = source.company_id)
WHEN NOT MATCHED THEN
	INSERT 
	(
		[company_id]
      

      ,[GpAccountNo]
      ,[SiteNo]
      ,[parent_company_id]
      ,[contact_person_id]
      ,[is_site]
      ,[CompanyPHone]
      ,[LegalEntity]
      ,[CompanyName]
      ,[is_active]
      ,[HardwareLocationId]
      ,[address_1]
      ,[address_2]
      ,[address_3]
      ,[attention]
      ,[city]
      ,[country_id]
      ,[latitude]
      ,[longitude]
      ,[AddressPhone]
      ,[state_prov_id]
      ,[zip]
	)
	VALUES
	(
		source.[company_id]
    
      ,source.[GpAccountNo]
      ,source.[SiteNo]
      ,source.[parent_company_id]
      ,source.[contact_person_id]
      ,source.[is_site]
      ,source.[CompanyPHone]
      ,source.[LegalEntity]
      ,source.[CompanyName]
      ,source.[is_active]
      ,source.[HardwareLocationId]
      ,source.[address_1]
      ,source.[address_2]
      ,source.[address_3]
      ,source.[attention]
      ,source.[city]
      ,source.[country_id]
      ,source.[latitude]
      ,source.[longitude]
      ,source.[AddressPhone]
      ,source.[state_prov_id]
      ,source.[zip]
	)

WHEN MATCHED and 
(
		isnull(t.[GpAccountNo],'')<>isnull(source.[GpAccountNo],'')
      or isnull(t.[SiteNo],'')<>isnull(source.[SiteNo],'')
      or isnull(t.[parent_company_id],'')<>isnull(source.[parent_company_id],'')
      or isnull(t.[contact_person_id],'')<>isnull(source.[contact_person_id],'')
      or isnull(t.[is_site],'')<>isnull(source.[is_site],'')
      or isnull(t.[CompanyPHone],'')<>isnull(source.[CompanyPHone],'')
      or isnull(t.[LegalEntity],'')<>isnull(source.[LegalEntity],'')
      or isnull(t.[CompanyName],'')<>isnull(source.[CompanyName],'')
      or isnull(t.[is_active],'')<>isnull(source.[is_active],'')
      or isnull(t.[HardwareLocationId],'00000000-0000-0000-0000-000000000000')<>isnull(source.[HardwareLocationId],'00000000-0000-0000-0000-000000000000')
      or isnull(t.[address_1],'')<>isnull(source.[address_1],'')
      or isnull(t.[address_2],'')<>isnull(source.[address_2],'')
      or isnull(t.[address_3],'')<>isnull(source.[address_3],'')
      or isnull(t.[attention],'')<>isnull(source.[attention],'')
      or isnull(t.[city],'')<>isnull(source.[city],'')
      or isnull(t.[country_id],'')<>isnull(source.[country_id],'')
      or isnull(t.[latitude],'')<>isnull(source.[latitude],'')
      or isnull(t.[longitude],'')<>isnull(source.[longitude],'')
      or isnull(t.[AddressPhone],'')<>isnull(source.[AddressPhone],'')
      or isnull(t.[state_prov_id],'')<>isnull(source.[state_prov_id],'')
      or isnull(t.[zip],'')<>isnull(source.[zip],'')
)

THEN
	UPDATE SET 
	  [GpAccountNo]=source.[GpAccountNo]
      ,[SiteNo]=source.[SiteNo]
      ,[parent_company_id]=source.[parent_company_id]
      ,[contact_person_id]=source.[contact_person_id]
      ,[is_site]=source.[is_site]
      ,[CompanyPHone]=source.[CompanyPHone]
      ,[LegalEntity]=source.[LegalEntity]
      ,[CompanyName]=source.[CompanyName]
      ,[is_active]=source.[is_active]
      ,[HardwareLocationId]=source.[HardwareLocationId]
      ,[address_1]=source.[address_1]
      ,[address_2]=source.[address_2]
      ,[address_3]=source.[address_3]
      ,[attention]=source.[attention]
      ,[city]=source.[city]
      ,[country_id]=source.[country_id]
      ,[latitude]=source.[latitude]
      ,[longitude]=source.[longitude]
      ,[AddressPhone]=source.[AddressPhone]
      ,[state_prov_id]=source.[state_prov_id]
      ,[zip]=Source.[zip];
End
GO
