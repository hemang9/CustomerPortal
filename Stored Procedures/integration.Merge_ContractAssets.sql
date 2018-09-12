SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROC [integration].[Merge_ContractAssets]

AS

BEGIN

MERGE INTO crm.ContractAssets AS t
USING
(
	SELECT 
		ppt_contract_assetId
		,ppt_asset_sla
		,ppt_inactivation_date
		,ppt_contractid
		,ppt_name
		,ppt_description
		,ppt_serialnumber
		,ppt_assetlocationidName
		,ppt_assetlocationid
		,ppt_purchase_order
		,ppt_remote_monitoring
		,ppt_billing_end_date
		,ppt_fc_start_date
		,ppt_fc_end_date
		,ppt_inactivation_reasoncode
		,ppt_assetid
		,ppt_parentid
		,ppt_hostname
		,ppt_activation_date
		,ppt_billing_start_date
		,ContractStartDate
		,ContractEndDate
		,ContractCoverageStartDate
		,Status
	FROM staging.ContractAssets
) AS source
ON (t.ppt_contract_assetId = source.ppt_contract_assetId)
WHEN NOT MATCHED THEN
	INSERT
	(
		ppt_contract_assetId
		,ppt_asset_sla
		,ppt_inactivation_date
		,ppt_contractid
		,ppt_name
		,ppt_description
		,ppt_serialnumber
		,ppt_assetlocationidName
		,ppt_assetlocationid
		,ppt_purchase_order
		,ppt_remote_monitoring
		,ppt_billing_end_date
		,ppt_fc_start_date
		,ppt_fc_end_date
		,ppt_inactivation_reasoncode
		,ppt_assetid
		,ppt_parentid
		,ppt_hostname
		,ppt_activation_date
		,ppt_billing_start_date
		,ContractStartDate
		,ContractEndDate
		,ContractCoverageStartDate
		,Status
	)
	VALUES
	(
		source.ppt_contract_assetId
		,source.ppt_asset_sla
		,source.ppt_inactivation_date
		,source.ppt_contractid
		,source.ppt_name
		,source.ppt_description
		,source.ppt_serialnumber
		,source.ppt_assetlocationidName
		,source.ppt_assetlocationid
		,source.ppt_purchase_order
		,source.ppt_remote_monitoring
		,source.ppt_billing_end_date
		,source.ppt_fc_start_date
		,source.ppt_fc_end_date
		,source.ppt_inactivation_reasoncode
		,source.ppt_assetid
		,source.ppt_parentid
		,source.ppt_hostname
		,source.ppt_activation_date
		,source.ppt_billing_start_date
		,source.ContractStartDate
		,source.ContractEndDate
		,source.ContractCoverageStartDate
		,source.Status
	)
WHEN MATCHED 
  AND (
                     t.ppt_contract_assetId <> source.ppt_contract_assetId 
                     OR ISNULL(t.ppt_asset_sla, '') <> ISNULL(source.ppt_asset_sla, '')
                     OR ISNULL(t.[Status], '') <> ISNULL(source.[Status], '')
                     OR t.ppt_inactivation_date <> source.ppt_inactivation_date
                     OR   t.ppt_contractid  <>  source.ppt_contractid 
                     OR t.ppt_name <> source.ppt_name
                     OR ISNULL(t.ppt_description, '') <> ISNULL(source.ppt_description, '')
                     OR ISNULL(t.ppt_serialnumber, '') <> ISNULL(source.ppt_serialnumber, '')
                     OR ISNULL(t.ppt_assetlocationidName, '') <> ISNULL(source.ppt_assetlocationidName, '')
                     OR t.ppt_assetlocationid <> source.ppt_assetlocationid
                     OR t.ppt_purchase_order <> source.ppt_purchase_order
					 
					 OR ISNULL(t.ppt_remote_monitoring, '') <> ISNULL(source.ppt_remote_monitoring, '')
					 OR ISNULL(t.ppt_billing_end_date, '') <> ISNULL(source.ppt_billing_end_date, '')
					 OR ISNULL(t.ppt_fc_start_date, '') <> ISNULL(source.ppt_fc_start_date, '')
					 OR ISNULL(t.ppt_fc_end_date, '') <> ISNULL(source.ppt_fc_end_date, '')
					 OR ISNULL(t.ppt_inactivation_reasoncode, '') <> ISNULL(source.ppt_inactivation_reasoncode, '')
					 OR  t.ppt_assetid  <>  source.ppt_assetid 
					 OR  t.ppt_parentid  <>  source.ppt_parentid 
					 OR ISNULL(t.ppt_hostname, '') <> ISNULL(source.ppt_hostname, '')
					 OR t.ppt_activation_date <> source.ppt_activation_date
					 OR t.ppt_billing_start_date <> source.ppt_billing_start_date

					 OR t.ContractStartDate <> source.ContractStartDate
					 OR t.ContractEndDate <> source.ContractEndDate
					 OR t.ContractCoverageStartDate <> source.ContractCoverageStartDate
					 OR ISNULL(t.Status,'') <> ISNULL(source.Status,'')
                 )

THEN
	UPDATE SET 
		ppt_contract_assetId = source.ppt_contract_assetId
		,ppt_asset_sla = source.ppt_asset_sla
		,ppt_inactivation_date = source.ppt_inactivation_date
		,ppt_contractid = source.ppt_contractid
		,ppt_name = source.ppt_name
		,ppt_description = source.ppt_description
		,ppt_serialnumber = source.ppt_serialnumber
		,ppt_assetlocationidName = source.ppt_assetlocationidName
		,ppt_assetlocationid = source.ppt_assetlocationid
		,ppt_purchase_order = source.ppt_purchase_order
		,ppt_remote_monitoring = source.ppt_remote_monitoring
		,ppt_billing_end_date = source.ppt_billing_end_date
		,ppt_fc_start_date = source.ppt_fc_start_date
		,ppt_fc_end_date = source.ppt_fc_end_date
		,ppt_inactivation_reasoncode = source.ppt_inactivation_reasoncode
		,ppt_assetid = source.ppt_assetid
		,ppt_parentid = source.ppt_parentid
		,ppt_hostname = source.ppt_hostname
		,ppt_activation_date = source.ppt_activation_date
		,ppt_billing_start_date = source.ppt_billing_start_date
		,ContractStartDate = source.ContractStartDate
		,ContractEndDate = source.ContractEndDate
		,ContractCoverageStartDate = source.ContractCoverageStartDate
		,Status = source.Status
;

END


GO
