SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


/**
HJB 3/13/2018 create the merge operation for Astea tickets part shipment
*/
CREATE PROC [integration].[Merge_PartsShipment]

AS

BEGIN



----Upsert [IncidentsPartShipmentTracking][staging].[TechnicalContacts]

MERGE INTO [astea].[TechnicalContacts]  AS t
USING
(
	 

SELECT [AsteaPersonId]
      ,[CompanyId]
      ,[Country]
      ,[CreatedOn]
      ,[CrmId]
      ,[EmailAddress]
      ,[FirstName]
      ,[LastModifiedOn]
      ,[LastName]
      ,[Line1]
      ,[Line2]
      ,[Line3]
      ,[Line4]
      ,[Locality]
      ,[PhoneNumber]
      ,[PostalCode]
      ,[Region]
  FROM [staging].[TechnicalContacts]
 

) AS source
ON (t.[AsteaPersonId] = source.[AsteaPersonId])
WHEN NOT MATCHED THEN
	INSERT
	(
	   [AsteaPersonId]
      ,[CompanyId]
      ,[Country]
      ,[CreatedOn]
      ,[CrmId]
      ,[EmailAddress]
      ,[FirstName]
      ,[LastModifiedOn]
      ,[LastName]
      ,[Line1]
      ,[Line2]
      ,[Line3]
      ,[Line4]
      ,[Locality]
      ,[PhoneNumber]
      ,[PostalCode]
      ,[Region]
	)
	VALUES
	(
		source.[AsteaPersonId]
      ,source.[CompanyId]
      ,source.[Country]
      ,source.[CreatedOn]
      ,source.[CrmId]
      ,source.[EmailAddress]
      ,source.[FirstName]
      ,source.[LastModifiedOn]
      ,source.[LastName]
      ,source.[Line1]
      ,source.[Line2]
      ,source.[Line3]
      ,source.[Line4]
      ,source.[Locality]
      ,source.[PhoneNumber]
      ,source.[PostalCode]
      ,source.[Region]
	)
WHEN MATCHED THEN
	UPDATE SET 
		[AsteaPersonId]=source.[AsteaPersonId]
      ,[CompanyId]=source.[CompanyId]
      ,[Country]=source.[Country]
      ,[CreatedOn]=source.[CreatedOn]
      ,[CrmId]=source.[CrmId]
      ,[EmailAddress]=source.[EmailAddress]
      ,[FirstName]=source.[FirstName]
      ,[LastModifiedOn]=source.[LastModifiedOn]
      ,[LastName]=source.[LastName]
      ,[Line1]=source.[Line1]
      ,[Line2]=source.[Line2]
      ,[Line3]=source.[Line3]
      ,[Line4]=source.[Line4]
      ,[Locality]=source.[Locality]
      ,[PhoneNumber]=source.[PhoneNumber]
      ,[PostalCode]=source.[PostalCode]
      ,[Region]=source.[Region] ;




----Upsert [IncidentsPartShipmentTracking]
MERGE INTO [astea].[IncidentsPartShipmentTracking]  AS t
USING
(
	SELECT	
		[Id]
      ,[order_id]
      ,[request_id]
      ,[carrier_ref_no]
      ,[carrier_id]
      ,[dterm_id]
      ,[last_change_by]
      ,[updated_at]
	FROM staging.[IncidentsPartShipmentTracking]
) AS source
ON (t.[Id] = source.[Id])
WHEN NOT MATCHED THEN
	INSERT
	(
		[Id]
      ,[order_id]
      ,[request_id]
      ,[carrier_ref_no]
      ,[carrier_id]
      ,[dterm_id]
      ,[last_change_by]
      ,[updated_at]
	)
	VALUES
	(
		source.[Id]
      ,source.[order_id]
      ,source.[request_id]
      ,source.[carrier_ref_no]
      ,source.[carrier_id]
      ,source.[dterm_id]
      ,source.[last_change_by]
      ,source.[updated_at]
	)
WHEN MATCHED THEN
	UPDATE SET 
		[Id] =source.[Id]
      ,[order_id] =source.[order_id]
      ,[request_id] = source.[request_id]
      ,[carrier_ref_no] =source.[carrier_ref_no]
      ,[carrier_id] =source.[carrier_id]
      ,[dterm_id] =source.[dterm_id]
      ,[last_change_by] =source.[last_change_by]
      ,[updated_at] =source.[updated_at]

;

END
GO
