SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROC [integration].[Merge_Contracts]

AS

BEGIN

MERGE INTO crm.Contracts AS t
USING
(
	SELECT 
		ppt_contractId
		,ppt_accountid
		,ppt_enduserid
		,ppt_primarycontactid
		,ppt_contractnumber
		,ppt_name
		,ppt_contractsource
		,statuscode
		,[IsActive]
		,OwnerId
		,ppt_purchase_order
		,ppt_term_start_date
		,ppt_term_end_date
		,ppt_poexpirydate
		,ppt_billto_address_line1
		,ppt_billto_address_line2
		,ppt_billto_address_city
		,ppt_billto_address_stateorprovince
		,ppt_billto_address_country
		,ppt_billto_address_postalcode
		,ppt_billto_emailaddress
		,ppt_billing_frequency
		,ppt_billingmethod
		,ppt_payment_terms
		,ppt_customerscontract
		,ppt_acquisitionoriginatingcontractnumber
		,AssetCount
		,ppt_coveragestartdate
		,ppt_origination_date
		,ppt_enduseridName
		,ppt_accountidName
		,ActiveContractAssetCount
		,InactiveContractAssetCount
	FROM staging.Contracts
) AS source
ON (t.ppt_contractId = source.ppt_contractId)
WHEN NOT MATCHED THEN
	INSERT
	(
		ppt_contractId
		,ppt_accountid
		,ppt_enduserid
		,ppt_primarycontactid
		,ppt_contractnumber
		,ppt_name
		,ppt_contractsource
		,statuscode
		,[IsActive]
		,OwnerId
		,ppt_purchase_order
		,ppt_term_start_date
		,ppt_term_end_date
		,ppt_poexpirydate
		,ppt_billto_address_line1
		,ppt_billto_address_line2
		,ppt_billto_address_city
		,ppt_billto_address_stateorprovince
		,ppt_billto_address_country
		,ppt_billto_address_postalcode
		,ppt_billto_emailaddress
		,ppt_billing_frequency
		,ppt_billingmethod
		,ppt_payment_terms
		,ppt_customerscontract
		,ppt_acquisitionoriginatingcontractnumber
		,AssetCount
		,ppt_coveragestartdate
		,ppt_origination_date
		,ppt_enduseridName
		,ppt_accountidName
		,ActiveContractAssetCount
		,InactiveContractAssetCount
	)
	VALUES
	(
		source.ppt_contractId
		,source.ppt_accountid
		,source.ppt_enduserid
		,source.ppt_primarycontactid
		,source.ppt_contractnumber
		,source.ppt_name
		,source.ppt_contractsource
		,source.statuscode
		,source.IsActive
		,source.OwnerId
		,source.ppt_purchase_order
		,source.ppt_term_start_date
		,source.ppt_term_end_date
		,source.ppt_poexpirydate
		,source.ppt_billto_address_line1
		,source.ppt_billto_address_line2
		,source.ppt_billto_address_city
		,source.ppt_billto_address_stateorprovince
		,source.ppt_billto_address_country
		,source.ppt_billto_address_postalcode
		,source.ppt_billto_emailaddress
		,source.ppt_billing_frequency
		,source.ppt_billingmethod
		,source.ppt_payment_terms
		,source.ppt_customerscontract
		,source.ppt_acquisitionoriginatingcontractnumber
		,source.AssetCount
		,source.ppt_coveragestartdate
		,source.ppt_origination_date
		,source.ppt_enduseridName
		,source.ppt_accountidName
		,source.ActiveContractAssetCount
		,source.InactiveContractAssetCount
	)
WHEN MATCHED THEN
	UPDATE SET 
		ppt_accountid = source.ppt_accountid
		,ppt_enduserid = source.ppt_enduserid
		,ppt_primarycontactid = source.ppt_primarycontactid
		,ppt_contractnumber = source.ppt_contractnumber
		,ppt_name = source.ppt_name
		,ppt_contractsource = source.ppt_contractsource
		,statuscode = source.statuscode
		,IsActive = source.IsActive
		,OwnerId = source.OwnerId
		,ppt_purchase_order = source.ppt_purchase_order
		,ppt_term_start_date = source.ppt_term_start_date
		,ppt_term_end_date = source.ppt_term_end_date
		,ppt_poexpirydate = source.ppt_poexpirydate
		,ppt_billto_address_line1 = source.ppt_billto_address_line1
		,ppt_billto_address_line2 = source.ppt_billto_address_line2
		,ppt_billto_address_city = source.ppt_billto_address_city
		,ppt_billto_address_stateorprovince = source.ppt_billto_address_stateorprovince
		,ppt_billto_address_country = source.ppt_billto_address_country
		,ppt_billto_address_postalcode = source.ppt_billto_address_postalcode
		,ppt_billto_emailaddress = source.ppt_billto_emailaddress
		,ppt_billing_frequency = source.ppt_billing_frequency
		,ppt_billingmethod = source.ppt_billingmethod
		,ppt_payment_terms = source.ppt_payment_terms
		,ppt_customerscontract = source.ppt_customerscontract
		,ppt_acquisitionoriginatingcontractnumber = source.ppt_acquisitionoriginatingcontractnumber
		,AssetCount = source.AssetCount
		,ppt_coveragestartdate = source.ppt_coveragestartdate
		,ppt_origination_date = source.ppt_origination_date
		,ppt_enduseridName=source.ppt_enduseridName
		,ppt_accountidName=source.ppt_accountidName
		,ActiveContractAssetCount =source.ActiveContractAssetCount
		,InactiveContractAssetCount=source.InactiveContractAssetCount
;

END


GO
