SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



/**
HJB 3/13/2018 create the merge operation for Astea tickets part shipment
              Now this stored proc contains all the astea tickets entities




-- updated where clause to handle nulls and performance

RUN only if needed

TRUNCATE TABLE [fpastea].[Incidents]
TRUNCATE TABLE [astea].[IncidentsInteractions]
TRUNCATE TABLE [astea].[IncidentsPartShipmentTracking]

select top 10 * from [fpastea].[Incidents] where etadatetime is not null
select top 10 * from [astea].[IncidentsInteractions]
select top 10  * from [astea].[IncidentsPartShipmentTracking] 
select top 10  * from [astea].IncidentsActivities where etatime is not null

 */
CREATE PROC [integration].[Merge_TicketEntitites]

AS

BEGIN
----Upsert [fpastea].[Incidents]
MERGE INTO [fpastea].[Incidents] AS t
USING
(
    SELECT [IncidentNumber],
           [IncidentType],
           [IncidentDescription],
           [Status],
           [EntryDateTime],
           [CloseDateTime],
           [EnteredByUser],
           [SeverityCode],
           [City],
           [State],
           [AccountCustomerName],
           [AccountCompanyCode],
           [EndUserCustomerName],
           [EndUserCompanyCode],
           [ProductLine],
           [ItemDescription],
           [SerialNumber],
           [ContractNumber],
           [ContractAssetID] ,
           [SiteContact],
           [AltSiteContact],
           [SolutionNotes],
           [ProblemNotes],
           [IsActiveAsset],
           [SiteDescription],
           [IsOpen],
           [SourceSystem],
           [LastModifiedOn],
           [ServiceOrderShipmentTracking],
           [SiteName],
           ETADateTime
    FROM [staging].[Incidents] WHERE [ContractAssetID] IS NOT NULL	
) AS source
ON (t.[IncidentNumber] = source.[IncidentNumber])
WHEN NOT MATCHED THEN
    INSERT
    (
        [IncidentNumber],
        [IncidentType],
        [IncidentDescription],
        [Status],
        [EntryDateTime],
        [CloseDateTime],
        [EnteredByUser],
        [SeverityCode],
        [City],
        [State],
        [AccountCustomerName],
        [AccountCompanyCode],
        [EndUserCustomerName],
        [EndUserCompanyCode],
        [ProductLine],
        [ItemDescription],
        [SerialNumber],
        [ContractNumber],
        [ContractAssetID],
        [SiteContact],
        [AltSiteContact],
        [SolutionNotes],
        [ProblemNotes],
        [IsActiveAsset],
        [SiteDescription],
        [IsOpen],
        [SourceSystem],
        [LastModifiedOn],
        [ServiceOrderShipmentTracking],
        [SiteName],
        ETADateTime
    )
    VALUES
    (source.[IncidentNumber], source.[IncidentType], source.[IncidentDescription], source.[Status],
     source.[EntryDateTime], source.[CloseDateTime], source.[EnteredByUser], source.[SeverityCode], source.[City],
     source.[State], source.[AccountCustomerName], source.[AccountCompanyCode], source.[EndUserCustomerName],
     source.[EndUserCompanyCode], source.[ProductLine], source.[ItemDescription], source.[SerialNumber],
     source.[ContractNumber],  source.[ContractAssetID] , source.[SiteContact],
     source.[AltSiteContact], source.[SolutionNotes], source.[ProblemNotes], source.[IsActiveAsset],
     source.[SiteDescription], source.[IsOpen], source.[SourceSystem], source.[LastModifiedOn],
     source.[ServiceOrderShipmentTracking], source.[SiteName], source.ETADateTime)
WHEN MATCHED AND (
                     ISNULL(t.[IncidentType], '') <> ISNULL(source.[IncidentType], '')
                     OR ISNULL(t.[IncidentDescription], '') <> ISNULL(source.[IncidentDescription], '')
                     OR ISNULL(t.[Status], '') <> ISNULL(source.[Status], '')
                     OR t.[EntryDateTime] <> source.[EntryDateTime]
                     OR ISNULL(t.[CloseDateTime], '') <> ISNULL(source.[CloseDateTime], '')
                     OR t.[EnteredByUser] <> source.[EnteredByUser]
                     OR ISNULL(t.[SeverityCode], '') <> ISNULL(source.[SeverityCode], '')
                     OR ISNULL(t.[City], '') <> ISNULL(source.[City], '')
                     OR ISNULL(t.[State], '') <> ISNULL(source.[State], '')
                     OR t.[AccountCustomerName] <> source.[AccountCustomerName]
                     OR t.[AccountCompanyCode] <> source.[AccountCompanyCode]
                     OR t.[EndUserCustomerName] <> source.[EndUserCustomerName]
                     OR t.[EndUserCompanyCode] <> source.[EndUserCompanyCode]
                     OR ISNULL(t.[ProductLine], '') <> ISNULL(source.[ProductLine], '')
                     OR ISNULL(t.[ItemDescription], '') <> ISNULL(source.[ItemDescription], '')
                     OR ISNULL(t.[SerialNumber], '') <> ISNULL(source.[SerialNumber], '')
                     OR ISNULL(t.[ContractNumber], '') <> ISNULL(source.[ContractNumber], '')
                     OR ISNULL(t.[ContractAssetID], '') <> ISNULL(  source.[ContractAssetID]  , '')
                     OR ISNULL(t.[SiteContact], '') <> ISNULL(source.[SiteContact], '')
                     OR ISNULL(t.[AltSiteContact], '') <> ISNULL(source.[AltSiteContact], '')
                     OR ISNULL(t.[SolutionNotes], '') <> ISNULL(source.[SolutionNotes], '')
                     OR ISNULL(t.[ProblemNotes], '') <> ISNULL(source.[ProblemNotes], '')
                     OR t.[IsActiveAsset] <> source.[IsActiveAsset]
                     OR ISNULL(t.[SiteDescription], '') <> ISNULL(source.[SiteDescription], '')
                     OR t.[IsOpen] <> source.[IsOpen]
                     OR t.[SourceSystem] <> source.[SourceSystem]
                     OR t.[LastModifiedOn] <> source.[LastModifiedOn]
                     OR ISNULL(t.[ServiceOrderShipmentTracking], '') <> ISNULL(
                                                                                  source.[ServiceOrderShipmentTracking],
                                                                                  ''
                                                                              )
                     OR ISNULL(t.[SiteName], '') <> ISNULL(source.[SiteName], '')
                     OR ISNULL(t.ETADateTime, '') <> ISNULL(source.ETADateTime, '')
                 ) THEN
    UPDATE SET [IncidentType] = source.[IncidentType],
               [IncidentDescription] = source.[IncidentDescription],
               [Status] = source.[Status],
               [EntryDateTime] = source.[EntryDateTime],
               [CloseDateTime] = source.[CloseDateTime],
               [EnteredByUser] = source.[EnteredByUser],
               [SeverityCode] = source.[SeverityCode],
               [City] = source.[City],
               [State] = source.[State],
               [AccountCustomerName] = source.[AccountCustomerName],
               [AccountCompanyCode] = source.[AccountCompanyCode],
               [EndUserCustomerName] = source.[EndUserCustomerName],
               [EndUserCompanyCode] = source.[EndUserCompanyCode],
               [ProductLine] = source.[ProductLine],
               [ItemDescription] = source.[ItemDescription],
               [SerialNumber] = source.[SerialNumber],
               [ContractNumber] = source.[ContractNumber],
               [ContractAssetID] = source.[ContractAssetID],
               [SiteContact] = source.[SiteContact],
               [AltSiteContact] = source.[AltSiteContact],
               [SolutionNotes] = source.[SolutionNotes],
               [ProblemNotes] = source.[ProblemNotes],
               [IsActiveAsset] = source.[IsActiveAsset],
               [SiteDescription] = source.[SiteDescription],
               [IsOpen] = source.[IsOpen],
               [SourceSystem] = source.[SourceSystem],
               [LastModifiedOn] = source.[LastModifiedOn],
               [ServiceOrderShipmentTracking] = source.[ServiceOrderShipmentTracking],
               [SiteName] = source.[SiteName],
               ETADateTime = source.ETADateTime;


----Upsert [staging].[TechnicalContacts]
-- MERGE INTO [astea].[TechnicalContacts]  AS t
--USING
--(
-- SELECT 
--       [AsteaPersonId]
--      ,[CompanyId]
--      ,[Country]
--      ,[CreatedOn]
--      ,[CrmId]
--      ,[EmailAddress]
--      ,[FirstName]
--      ,[LastModifiedOn]
--      ,[LastName]
--      ,[Line1]
--      ,[Line2]
--      ,[Line3]
--      ,[Line4]
--      ,[Locality]
--      ,[PhoneNumber]
--      ,[PostalCode]
--      ,[Region]
--	  ,[Source]
--  FROM [staging].[TechnicalContacts]
--) AS source
--ON (t.[AsteaPersonId] = source.[AsteaPersonId] AND t.[AsteaPersonId] IS NULL )
--WHEN NOT MATCHED THEN
--	INSERT
--	(
--	   [AsteaPersonId]
--      ,[CompanyId]
--      ,[Country]
--      ,[CreatedOn]
--      ,[CrmId]
--      ,[EmailAddress]
--      ,[FirstName]
--      ,[LastModifiedOn]
--      ,[LastName]
--      ,[Line1]
--      ,[Line2]
--      ,[Line3]
--      ,[Line4]
--      ,[Locality]
--      ,[PhoneNumber]
--      ,[PostalCode]
--      ,[Region]
--	  ,[Source]
--	)
--	VALUES
--	(
--		source.[AsteaPersonId]
--      ,source.[CompanyId]
--      ,source.[Country]
--      ,source.[CreatedOn]
--      ,source.[CrmId]
--      ,source.[EmailAddress]
--      ,source.[FirstName]
--      ,source.[LastModifiedOn]
--      ,source.[LastName]
--      ,source.[Line1]
--      ,source.[Line2]
--      ,source.[Line3]
--      ,source.[Line4]
--      ,source.[Locality]
--      ,source.[PhoneNumber]
--      ,source.[PostalCode]
--      ,source.[Region]
--	  , source.[Source]
--	)
--WHEN MATCHED  
-- --AND (t.[CompanyId]<>source.[CompanyId]
-- --     or isnull(t.[Country],'')<>isnull(source.[Country],'')
-- --     or t.[CreatedOn]<>source.[CreatedOn]
-- --     or isnull(t.[CrmId],'00000000-0000-0000-0000-000000000000')<>isnull(source.[CrmId],'00000000-0000-0000-0000-000000000000') 
-- --     or t.[EmailAddress]<>source.[EmailAddress]
-- --     or t.[FirstName]<>source.[FirstName]
-- --     or t.[LastModifiedOn]<>source.[LastModifiedOn]
-- --     or t.[LastName]<>source.[LastName]
-- --     or isnull(t.[Line1],'')<>isnull(source.[Line1],'')
-- --     or isnull(t.[Line2],'')<>isnull(source.[Line2],'')
-- --     or isnull(t.[Line3],'')<>isnull(source.[Line3],'')
-- --     or isnull(t.[Line4],'')<>isnull(source.[Line4],'')
-- --     or isnull(t.[Locality],'')<>isnull(source.[Locality],'')
-- --     or isnull(t.[PhoneNumber],'')<>isnull(source.[PhoneNumber],'')
-- --     or isnull(t.[PostalCode],'')<>isnull(source.[PostalCode],'')
-- --     or isnull(t.[Region],'')<>isnull(source.[Region],'')
--	--  or t.[Source] <> source.[Source] )
	  
-- THEN
--	UPDATE SET 
--		[CompanyId]=source.[CompanyId]
--      ,[Country]=source.[Country]
--      ,[CreatedOn]=source.[CreatedOn]
--      ,[CrmId]=source.[CrmId]
--      ,[EmailAddress]=source.[EmailAddress]
--      ,[FirstName]=source.[FirstName]
--      ,[LastModifiedOn]=source.[LastModifiedOn]
--      ,[LastName]=source.[LastName]
--      ,[Line1]=source.[Line1]
--      ,[Line2]=source.[Line2]
--      ,[Line3]=source.[Line3]
--      ,[Line4]=source.[Line4]
--      ,[Locality]=source.[Locality]
--      ,[PhoneNumber]=source.[PhoneNumber]
--      ,[PostalCode]=source.[PostalCode]
--      ,[Region]=source.[Region] 
--	  ,[Source] = source.[Source];
  


UPDATE t
    SET   t.[Source] = source.[Source]
		,t.[CompanyId]=source.[CompanyId]
      ,t.[Country]=source.[Country]
      ,t.[CreatedOn]=source.[CreatedOn]
      ,t.[CrmId]=source.[CrmId]
      ,t.[EmailAddress]=source.[EmailAddress]
      ,t.[FirstName]=source.[FirstName]
      ,t.[LastModifiedOn]=source.[LastModifiedOn]
      ,t.[LastName]=source.[LastName]
      ,t.[Line1]=source.[Line1]
      ,t.[Line2]=source.[Line2]
      ,t.[Line3]=source.[Line3]
      ,t.[Line4]=source.[Line4]
      ,t.[Locality]=source.[Locality]
      ,t.[PhoneNumber]=source.[PhoneNumber]
      ,t.[PostalCode]=source.[PostalCode]
      ,t.[Region]=source.[Region] 

    FROM [astea].[TechnicalContacts]  t
        INNER JOIN staging.[TechnicalContacts]  source
            ON (
                   t.AsteaPersonId = source.AsteaPersonId
                   
               )


--INSERT for new records [astea].[TechnicalContacts]

INSERT INTO [astea].[TechnicalContacts]
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
	  ,[Source]
)
SELECT 
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
	  ,[Source]

FROM staging.[TechnicalContacts] source
WHERE NOT EXISTS
(
   SELECT t.Id
    FROM [astea].[TechnicalContacts]  t
        INNER JOIN staging.[TechnicalContacts]  source
            ON (
                   t.AsteaPersonId = source.AsteaPersonId
                   AND t.CreatedOn = source.CreatedOn
                   AND t.[LastModifiedOn] = source.[LastModifiedOn]
               )     
);


----Upsert [astea].[IncidentsInteractions] 
		
 
IF EXISTS
(
    SELECT t.Id
    FROM [astea].[IncidentsInteractions] t
        INNER JOIN staging.IncidentsInteractions source
            ON (
                   t.[IncidentNumber] = source.[IncidentNumber]
                   AND t.CreatedOn = source.CreatedOn
                   AND t.CreatedBy = source.CreatedBy
                   AND t.LastModifiedBy = source.LastModifiedBy
                   AND t.[LastModifiedOn] = source.[LastModifiedOn]
				   AND ( t.Comment <> source.Comment )

               )  
)
BEGIN
    UPDATE t
    SET  
        t.AsteaOrderId = source.AsteaOrderId,
        t.Comment = source.Comment
    FROM [astea].[IncidentsInteractions] t
        INNER JOIN staging.IncidentsInteractions source
            ON (
                   t.[IncidentNumber] = source.[IncidentNumber]
                   AND t.CreatedOn = source.CreatedOn
                   AND t.CreatedBy = source.CreatedBy
                   AND t.LastModifiedBy = source.LastModifiedBy
                   AND t.[LastModifiedOn] = source.[LastModifiedOn]
				   AND ( t.Comment <> source.Comment )
               );
END;

--INSERT for new records [astea].[IncidentsInteractions] 

INSERT INTO [astea].[IncidentsInteractions]
(
    [Id],
    [AsteaOrderId],
    [Comment],
    [CreatedBy],
    [CreatedOn],
    [IncidentNumber],
    [LastModifiedBy],
    [LastModifiedOn]
)
SELECT [Id],
       [AsteaOrderId],
       [Comment],
       [CreatedBy],
       [CreatedOn],
       [IncidentNumber],
       [LastModifiedBy],
       [LastModifiedOn]
FROM [staging].[IncidentsInteractions] source
WHERE NOT EXISTS
(
    SELECT t.Id
    FROM [astea].[IncidentsInteractions] t
        WHERE	(
                   (t.[IncidentNumber] = source.[IncidentNumber]
                   AND t.CreatedOn = source.CreatedOn
                   AND t.CreatedBy = source.CreatedBy
                   AND t.LastModifiedBy = source.LastModifiedBy
                   AND t.[LastModifiedOn] = source.[LastModifiedOn])
				  
               )  OR  t.id = source.Id
);



----Upsert [IncidentsPartShipmentTracking]

 
IF EXISTS
(
    SELECT t.Id
    FROM [astea].IncidentsPartShipmentTracking t
        INNER JOIN staging.IncidentsPartShipmentTracking source
            ON (
                   t.order_id = source.order_id
                   AND t.request_id = source.request_id
				   AND t.bpart_id = source.bpart_id
                   AND t.carrier_ref_no = source.carrier_ref_no
                   AND
                   (
				    t.updated_at <> source.updated_at
                   )
               )
)
BEGIN
    UPDATE t
    SET  
		t.Id = source.Id,
        t.updated_at = source.updated_at
    FROM [astea].IncidentsPartShipmentTracking t
        INNER JOIN staging.IncidentsPartShipmentTracking source
            ON (
                   t.order_id = source.order_id
                   AND t.request_id = source.request_id
				   AND t.bpart_id = source.bpart_id
                   AND t.carrier_ref_no = source.carrier_ref_no
                   AND
                   (
				    t.updated_at <> source.updated_at
                   )
               );
END;

--INSERT for new records

INSERT INTO [astea].IncidentsPartShipmentTracking
(
    [Id],
    [order_id],
    [request_id],
    [bpart_id],
    [carrier_ref_no],
    [carrier_id],
    [dterm_id],
    [last_change_by],
    [updated_at]
)
SELECT [Id],
       [order_id],
       [request_id],
       [bpart_id],
       [carrier_ref_no],
       [carrier_id],
       [dterm_id],
       [last_change_by],
       [updated_at]
FROM [staging].IncidentsPartShipmentTracking source
WHERE NOT EXISTS
(
    SELECT t.Id
    FROM [astea].IncidentsPartShipmentTracking t
    WHERE (
              t.order_id = source.order_id
              AND t.request_id = source.request_id
			  AND t.bpart_id =source.bpart_id
              AND t.carrier_ref_no = source.carrier_ref_no
              
          )
		  OR t.id = source.Id
);



----Upsert OrderActivities


 
IF EXISTS
(
    SELECT t.Id,*
    FROM [astea].IncidentsActivities t
        INNER JOIN staging.IncidentsActivities source
            ON (
                   t.AsteaOrderId = source.AsteaOrderId
                   AND t.Activity = source.Activity
                   AND t.LastModifiedBy = source.LastModifiedBy
                   AND t.LastModifiedOn = source.LastModifiedOn
                   AND
                   (
                       t.ActivityStartTime <> source.ActivityStartTime
                       OR t.ActivityCompletionTime <> source.ActivityCompletionTime
                       OR t.ETATime <> source.ETATime
                   )
               )
)
BEGIN
    UPDATE t
    SET  
        t.ActivityStartTime = source.ActivityStartTime,
        t.ActivityCompletionTime = source.ActivityCompletionTime,
        t.ETATime = source.ETATime
    FROM [astea].IncidentsActivities t
        INNER JOIN staging.IncidentsActivities source
            ON (
                   t.AsteaOrderId = source.AsteaOrderId
                   AND t.Activity = source.Activity
                   AND t.LastModifiedBy = source.LastModifiedBy
                   AND t.LastModifiedOn = source.LastModifiedOn
                   AND
                   (
                       t.ActivityStartTime <> source.ActivityStartTime
                       OR t.ActivityCompletionTime <> source.ActivityCompletionTime
                       OR t.ETATime <> source.ETATime
                   )
               );
END;

--INSERT for new records

INSERT INTO [astea].IncidentsActivities
(
    [Id],
    [AsteaOrderId],
    [Activity],
    [ActivityStartTime],
    [ActivityCompletionTime],
    [IsPartsOnlyCall],
    [LastModifiedBy],
    [LastModifiedOn],
    ETATime
)
SELECT [Id],
       [AsteaOrderId],
       [Activity],
       [ActivityStartTime],
       [ActivityCompletionTime],
       [IsPartsOnlyCall],
       [LastModifiedBy],
       [LastModifiedOn],
       ETATime
FROM [staging].IncidentsActivities source
WHERE NOT EXISTS
(
    SELECT t.Id
    FROM [astea].IncidentsActivities t
    WHERE (
              t.AsteaOrderId = source.AsteaOrderId
              AND t.Activity = source.Activity
              AND t.LastModifiedBy = source.LastModifiedBy
              AND t.LastModifiedOn = source.LastModifiedOn
			 
          ) OR (t.id=source.id)
);




END


/****** Object:  StoredProcedure [dbo].[Truncate_AllStagingTables]    Script Date: 3/16/2018 2:35:08 PM ******/
SET ANSI_NULLS ON
GO
