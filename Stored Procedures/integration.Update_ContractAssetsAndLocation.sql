SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



/* 
exec [dbo].[Update_ContractAssetsAndLocation]
*/
CREATE	 PROC [integration].[Update_ContractAssetsAndLocation]

AS

BEGIN

update ca set
	IsActive = 1
from crm.ContractAssets ca
where ca.Status = 'Active'


update ca set
	ca.CalcContractAssetStartDate = (case
										when isnull(c.ppt_origination_date, '') <> isnull(c.ppt_term_start_date, '')
											then coalesce(ca.ppt_fc_start_date, ca.ppt_billing_start_date)
										when isnull(c.ppt_coveragestartdate, '') = ''
											then coalesce(ca.ppt_fc_start_date, ca.ppt_billing_start_date)
										when isnull(c.ppt_coveragestartdate, '') <> ''
											then (
													case	
														when isnull(ca.ppt_fc_start_date, '') <> ''
															then (
																	case 
																		when ca.ppt_billing_start_date > c.ppt_term_start_date
																			then (
																					case 
																						when ca.ppt_fc_start_date > c.ppt_term_start_date
																							then ca.ppt_fc_start_date
																						else
																							c.ppt_coveragestartdate
																					end
																				 )
																		else
																			ca.ppt_billing_start_date
																	end
																 )
														when ca.ppt_billing_start_date > c.ppt_term_start_date
															then ca.ppt_billing_start_date
														else 
															c.ppt_coveragestartdate
													end															
												 )
										else
											ca.ppt_billing_start_date
									 end)
from crm.ContractAssets ca
inner join crm.Contracts c 
	on c.ppt_contractId = ca.ppt_contractid
	and ca.CalcContractAssetStartDate is null


update ca set
	ca.CalcContractAssetEndDate = (
									case 
										when ca.IsActive = 1
											then ca.ppt_billing_end_date
										else 
											ca.ppt_inactivation_date
									end
								  )
from crm.ContractAssets ca
where ca.CalcContractAssetEndDate is null



update l set
	l.CalcLocationName = (
							case
								when l.ppt_country = 'United States'
									then replace(l.ppt_name, ', XX', '')
								else
									replace(l.ppt_name, ', XX', ', ' + l.ppt_country)
							end
						 )
from crm.Locations l
where l.CalcLocationName is null

END

GO
