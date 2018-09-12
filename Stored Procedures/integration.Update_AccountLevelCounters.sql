SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE PROC [integration].[Update_AccountLevelCounters]

AS

--Get Direct Contracts count
update
		a
set
		a.ContractCount = isnull( [cntracts].[ContractCnt], 0 )
from	staging.Accounts a
left join
		(
			select
						AccountNumber
					  , sum( [Contract] ) as ContractCnt
			from
						(
							select
										a.[AccountNumber]
									  , 1 as [Contract]
							from		staging.[Accounts]	  a (nolock)
							inner join	staging.Contracts c (nolock)
								on c.[ppt_enduserid] = a.[AccountId]
								   and		c.[ppt_enduserid] = c.[ppt_accountid] --direct contract
								   and		c.IsActive = 1	-- active
								   and		a.[StatusCode] LIKE 'Active'
						) as tmp
			group by	[AccountNumber]
		)							as cntracts
	on cntracts.[AccountNumber] = a.[AccountNumber];

print convert( varchar(16), getdate(), 14 ) + ' | CustomerPortal staging Accounts Updated Direct Contract Count: '
	  + convert( varchar(16), @@rowcount ) + ' records';

--Add Channel Partner Contracts Count
update
		a
set
		a.ContractCount = a.ContractCount + isnull( [cntracts].[ContractCnt], 0 )
from	staging.Accounts a
left join
		(
			select
						AccountNumber
					  , sum( [Contract] ) as ContractCnt
			from
						(
							select
										a.[AccountNumber]
									  , 1 as [Contract]
							from		staging.[Accounts]	  a (nolock)
							inner join	staging.Contracts c (nolock)
								on c.[ppt_accountid] = a.[AccountId]
								   and		c.[ppt_enduserid] != c.[ppt_accountid] --channel partner
								   and		c.[IsActive] = 1	-- active
								   and		a.[StatusCode] ='Active'
						) as tmp
			group by	[AccountNumber]
		)							as cntracts
	on cntracts.[AccountNumber] = a.[AccountNumber];

print convert( varchar(16), getdate(), 14 ) + ' | CustomerPortal staging Accounts Updated Channel Partner Contract Count: '
	  + convert( varchar(16), @@rowcount ) + ' records';

--Add End User Channel Partner Contracts Count
update
		a
set
		a.ContractCount = a.ContractCount + isnull( [cntracts].[ContractCnt], 0 )
from	staging.Accounts a
left join
		(
			select
						AccountNumber
					  , sum( [Contract] ) as ContractCnt
			from
						(
							select
										a.[AccountNumber]
									  , 1 as [Contract]
							from		staging.[Accounts]	  a (nolock)
							inner join	staging.Contracts c (nolock)
								on c.[ppt_enduserid] = a.[AccountId]
								   and		c.[ppt_enduserid] != c.[ppt_accountid] --channel partner
								   and		c.[IsActive] = 1 -- active
								   and		a.[StatusCode] = 'Active'
							inner join	.[portal].[AccountSettings]		  channelPartnerSettings (nolock)
								on [channelPartnerSettings].[AccountId] = [c].[ppt_accountid]
								   and		[channelPartnerSettings].[CanViewContractsAndTickets] = 1
						) as tmp
			group by	[AccountNumber]
		)							as cntracts
	on cntracts.[AccountNumber] = a.[AccountNumber];

print convert( varchar(16), getdate(), 14 )
	  + ' | CustomerPortal staging Accounts Updated End User Channel Partner Contract Count: '
	  + convert( varchar(16), @@rowcount ) + ' records';


--Get direct Contract Assets Count
update
		a
set
		a.ContractAssetCount = isnull( caCnt.ContractAssetCnt, 0 )
from	staging.Accounts a
left join
		(
			select
						AccountNumber
					  , sum( [ContractAsset] ) as ContractAssetCnt
			from
						(
							select
										a.[AccountNumber]
									  , 1 as [ContractAsset]
							from		staging.[Accounts]		  a (nolock)
							inner join	staging.Contracts	  c (nolock)
								on c.[ppt_enduserid] = a.[AccountId]
								   and		c.[ppt_enduserid] = c.[ppt_accountid]
								   and		c.[IsActive] = 1 -- active
								   and		a.[StatusCode] ='Active'
							inner join	staging.ContractAssets ca
								on ca.[ppt_contractid] = c.[ppt_contractId]
								   and		ca.[ppt_parentid] is null
						--and ca.[statecode] = 0 --active
						--where [CustomerTypeCode] = 1 --EndUser
						) as tmp
			group by	[AccountNumber]
		)							as caCnt
	on caCnt.[AccountNumber] = a.[AccountNumber];

print convert( varchar(16), getdate(), 14 ) + ' | CustomerPortal staging Accounts Updated Direct Contract Asset Count: '
	  + convert( varchar(16), @@rowcount ) + ' records';


--Get channel partner Contract Assets Count
update
		a
set
		a.ContractAssetCount = a.ContractAssetCount + isnull( caCnt.ContractAssetCnt, 0 )
from	staging.Accounts a
left join
		(
			select
						AccountNumber
					  , sum( [ContractAsset] ) as ContractAssetCnt
			from
						(
							select
										a.[AccountNumber]
									  , 1 as [ContractAsset]
							from		staging.[Accounts]		  a (nolock)
							inner join	staging.Contracts	  c (nolock)
								on c.[ppt_accountid] = a.[AccountId]
								   and		c.[ppt_enduserid] != c.[ppt_accountid]
								   and		c.[IsActive] = 1 -- active
								   and		a.[StatusCode] ='Active'
							inner join	staging.ContractAssets ca
								on ca.[ppt_contractid] = c.[ppt_contractId]
								   and		ca.[ppt_parentid] is null
						--and ca.[statecode] = 0 --active
						--where [CustomerTypeCode] = 1 --EndUser
						) as tmp
			group by	[AccountNumber]
		)							as caCnt
	on caCnt.[AccountNumber] = a.[AccountNumber];

print convert( varchar(16), getdate(), 14 )
	  + ' | CustomerPortal staging Accounts Updated Channel Partner Contract Asset Count: '
	  + convert( varchar(16), @@rowcount ) + ' records';


--Get End User channel partner Contract Assets Count
update
		a
set
		a.ContractAssetCount = a.ContractAssetCount + isnull( caCnt.ContractAssetCnt, 0 )
from	staging.Accounts a
left join
		(
			select
						AccountNumber
					  , sum( [ContractAsset] ) as ContractAssetCnt
			from
						(
							select
										a.[AccountNumber]
									  , 1 as [ContractAsset]
							from		staging.[Accounts]		  a (nolock)
							inner join	staging.Contracts	  c (nolock)
								on c.[ppt_enduserid] = a.[AccountId]
								   and		c.[ppt_enduserid] != c.[ppt_accountid]
								   and		c.[IsActive] = 1 -- active
								   and		a.[StatusCode] ='Active'
							inner join	.[portal].[AccountSettings]			  channelPartnerSettings (nolock)
								on [channelPartnerSettings].[AccountId] = [c].[ppt_accountid]
								   and		[channelPartnerSettings].[CanViewContractsAndTickets] = 1
							inner join	staging.ContractAssets ca
								on ca.[ppt_contractid] = c.[ppt_contractId]
								   and		ca.[ppt_parentid] is null
						--and ca.Status = 'Active' --active
						--where [CustomerTypeCode] = 1 --EndUser
						) as tmp
			group by	[AccountNumber]
		)							as caCnt
	on caCnt.[AccountNumber] = a.[AccountNumber];

print convert( varchar(16), getdate(), 14 )
	  + ' | CustomerPortal staging Accounts Updated End User Channel Partner Contract Asset Count: '
	  + convert( varchar(16), @@rowcount ) + ' records';

--Get direct Active Contract Assets Count
update
		a
set
		a.ActiveContractAssetCount = isnull( caCnt.ContractAssetCnt, 0 )
from	staging.Accounts a
left join
		(
			select
						AccountNumber
					  , sum( [ContractAsset] ) as ContractAssetCnt
			from
						(
							select
										a.[AccountNumber]
									  , 1 as [ContractAsset]
							from		staging.[Accounts]		  a (nolock)
							inner join	staging.Contracts	  c (nolock)
								on c.[ppt_enduserid] = a.[AccountId]
								   and		c.[ppt_enduserid] = c.[ppt_accountid]
								   and		c.[IsActive] = 1 -- active
								   and		a.[StatusCode] ='Active'
							inner join	staging.ContractAssets ca
								on ca.[ppt_contractid] = c.[ppt_contractId]
								   and		ca.[ppt_parentid] is null
							and ca.Status = 'Active' --active
						--where [CustomerTypeCode] = 1 --EndUser
						) as tmp
			group by	[AccountNumber]
		)							as caCnt
	on caCnt.[AccountNumber] = a.[AccountNumber];

print convert( varchar(16), getdate(), 14 ) + ' | CustomerPortal staging Accounts Updated Direct Contract Asset Count: '
	  + convert( varchar(16), @@rowcount ) + ' records';


--Get channel partner Active Contract Assets Count
update
		a
set
		a.ActiveContractAssetCount = a.ActiveContractAssetCount + isnull( caCnt.ContractAssetCnt, 0 )
from	staging.Accounts a
left join
		(
			select
						AccountNumber
					  , sum( [ContractAsset] ) as ContractAssetCnt
			from
						(
							select
										a.[AccountNumber]
									  , 1 as [ContractAsset]
							from		staging.[Accounts]		  a (nolock)
							inner join	staging.Contracts	  c (nolock)
								on c.[ppt_accountid] = a.[AccountId]
								   and		c.[ppt_enduserid] != c.[ppt_accountid]
								   and		c.[IsActive] = 1 -- active
								   and		a.[StatusCode] ='Active'
							inner join	staging.ContractAssets ca
								on ca.[ppt_contractid] = c.[ppt_contractId]
								   and		ca.[ppt_parentid] is null
						 and ca.Status = 'Active' --active
						--where [CustomerTypeCode] = 1 --EndUser
						) as tmp
			group by	[AccountNumber]
		)							as caCnt
	on caCnt.[AccountNumber] = a.[AccountNumber];

print convert( varchar(16), getdate(), 14 )
	  + ' | CustomerPortal staging Accounts Updated Channel Partner Contract Asset Count: '
	  + convert( varchar(16), @@rowcount ) + ' records';


--Get End User channel partner Active Contract Assets Count
update
		a
set
		a.ActiveContractAssetCount = a.ActiveContractAssetCount + isnull( caCnt.ContractAssetCnt, 0 )
from	staging.Accounts a
left join
		(
			select
						AccountNumber
					  , sum( [ContractAsset] ) as ContractAssetCnt
			from
						(
							select
										a.[AccountNumber]
									  , 1 as [ContractAsset]
							from		staging.[Accounts]		  a (nolock)
							inner join	staging.Contracts	  c (nolock)
								on c.[ppt_enduserid] = a.[AccountId]
								   and		c.[ppt_enduserid] != c.[ppt_accountid]
								   and		c.[IsActive] = 1 -- active
								   and		a.[StatusCode] ='Active'
							inner join	.[portal].[AccountSettings]			  channelPartnerSettings (nolock)
								on [channelPartnerSettings].[AccountId] = [c].[ppt_accountid]
								   and		[channelPartnerSettings].[CanViewContractsAndTickets] = 1
							inner join	staging.ContractAssets ca
								on ca.[ppt_contractid] = c.[ppt_contractId]
								   and		ca.[ppt_parentid] is null
						and ca.Status = 'Active' --active
						--where [CustomerTypeCode] = 1 --EndUser
						) as tmp
			group by	[AccountNumber]
		)							as caCnt
	on caCnt.[AccountNumber] = a.[AccountNumber];

print convert( varchar(16), getdate(), 14 )
	  + ' | CustomerPortal staging Accounts Updated End User Channel Partner Contract Asset Count: '
	  + convert( varchar(16), @@rowcount ) + ' records';



--Get Direct Open Incidents Count
update
		a
set
		a.OpenIncidentCount = isnull( opentIncidnets.OpenIncidentCount, 0 )
from	staging.Accounts a
left join
		(
			select
						AccountNumber
					  , sum( OpenIncident ) as OpenIncidentCount
			from
						(
							select
										a.[AccountNumber]
									  , 1 as OpenIncident
							from		staging.[Accounts] a (nolock)
							inner join	.staging.[Incidents]		 i (nolock)
								on i.[EndUserCompanyCode] = a.[AccountNumber] collate Latin1_General_CI_AI
								   and		i.[EndUserCompanyCode] = i.[AccountCompanyCode]
								   and		i.[IsOpen] = 1
								   and		a.[StatusCode] ='Active'
						) as tmp
			group by	AccountNumber
		)							as opentIncidnets
	on [opentIncidnets].[AccountNumber] = [a].[AccountNumber];

print convert( varchar(16), getdate(), 14 ) + ' | CustomerPortal staging Accounts Updated Direct Open Incident Count: '
	  + convert( varchar(16), @@rowcount ) + ' records';

--Get Channel Partner Open Incidents Count
update
		a
set
		a.OpenIncidentCount = a.OpenIncidentCount + isnull( opentIncidnets.OpenIncidentCount, 0 )
from	staging.Accounts a
left join
		(
			select
						AccountNumber
					  , sum( OpenIncident ) as OpenIncidentCount
			from
						(
							select
										a.[AccountNumber]
									  , 1 as OpenIncident
							from		crm.[Accounts] a (nolock)
							inner join	.fpastea.[Incidents]		 i (nolock)
								on i.[AccountCompanyCode] = a.[AccountNumber] collate Latin1_General_CI_AI
								   and		i.[EndUserCompanyCode] != i.[AccountCompanyCode]
								   and		i.[IsOpen] = 1
								   and		a.[StatusCode] ='Active'
						) as tmp
			group by	AccountNumber
		)							as opentIncidnets
	on [opentIncidnets].[AccountNumber] = [a].[AccountNumber];

print convert( varchar(16), getdate(), 14 )
	  + ' | CustomerPortal staging Accounts Updated Channel Partner Open Incident Count: '
	  + convert( varchar(16), @@rowcount ) + ' records';

--Get End User Channel Partner Open Incidents Count
update
		a
set
		a.OpenIncidentCount = a.OpenIncidentCount + isnull( opentIncidnets.OpenIncidentCount, 0 )
from	staging.Accounts a
left join
		(
			select
						AccountNumber
					  , sum( OpenIncident ) as OpenIncidentCount
			from
						(
							select
										a.[AccountNumber]
									  , 1 as OpenIncident
							from		crm.[Accounts] a (nolock)
							inner join	.fpastea.[Incidents]		 i (nolock)
								on i.[EndUserCompanyCode] = a.[AccountNumber] collate Latin1_General_CI_AI
								   and		i.[EndUserCompanyCode] != i.[AccountCompanyCode]
								   and		i.[IsOpen] = 1
								   and		a.[StatusCode] ='Active'
							inner join	.[portal].[AccountSettings]	 channelAccountSettings (nolock)
								on [channelAccountSettings].[AccountNumber] = i.[AccountCompanyCode]
								   and		[channelAccountSettings].[CanViewContractsAndTickets] = 1
						) as tmp
			group by	AccountNumber
		)							as opentIncidnets
	on [opentIncidnets].[AccountNumber] = [a].[AccountNumber];

print convert( varchar(16), getdate(), 14 )
	  + ' | CustomerPortal staging Accounts Updated End User Channel Partner Open Incident Count: '
	  + convert( varchar(16), @@rowcount ) + ' records';

--Get Direct Closed Incidents Count
update
		a
set
		a.ClosedIncidentCount = isnull( closedIncidents.closedIncidentCount, 0 )
from	staging.Accounts a
left join
		(
			select
						AccountNumber
					  , sum( closedIncident ) as closedIncidentCount
			from
						(
							select
										a.[AccountNumber]
									  , 1 as closedIncident
							from		crm.Accounts a (nolock)
							inner join	.fpastea.[Incidents]		   i (nolock)
								on i.[EndUserCompanyCode] = a.[AccountNumber] collate Latin1_General_CI_AI
								   and		i.[EndUserCompanyCode] = i.[AccountCompanyCode]
								   and		i.[IsOpen] = 0
								   and		a.[StatusCode] ='Active'
						) as tmp
			group by	AccountNumber
		)							closedIncidents
	on [closedIncidents].[AccountNumber] = [a].[AccountNumber];

print convert( varchar(16), getdate(), 14 ) + ' | CustomerPortal staging Accounts Updated Direct Closed Incident Count: '
	  + convert( varchar(16), @@rowcount ) + ' records';

--Get Channel Partner Closed Incidents Count
update
		a
set
		a.ClosedIncidentCount = a.ClosedIncidentCount + isnull( closedIncidents.closedIncidentCount, 0 )
from	staging.Accounts a
left join
		(
			select
						AccountNumber
					  , sum( closedIncident ) as closedIncidentCount
			from
						(
							select
										a.[AccountNumber]
									  , 1 as closedIncident
							from		crm.Accounts a (nolock)
							inner join	.fpastea.[Incidents]		   i (nolock)
								on i.[AccountCompanyCode] = a.[AccountNumber] collate Latin1_General_CI_AI
								   and		i.[EndUserCompanyCode] != i.[AccountCompanyCode]
								   and		i.[IsOpen] = 0
								   and		a.[StatusCode] ='Active'
						) as tmp
			group by	AccountNumber
		)							closedIncidents
	on [closedIncidents].[AccountNumber] = [a].[AccountNumber];

print convert( varchar(16), getdate(), 14 )
	  + ' | CustomerPortal staging Accounts Updated Channel Partner Closed Incident Count: '
	  + convert( varchar(16), @@rowcount ) + ' records';

--Get End User Channel Partner Closed Incidents Count
update
		a
set
		a.ClosedIncidentCount = a.ClosedIncidentCount + isnull( closedIncidents.closedIncidentCount, 0 )
from	staging.Accounts a
left join
		(
			select
						AccountNumber
					  , sum( closedIncident ) as closedIncidentCount
			from
						(
							select
										a.[AccountNumber]
									  , 1 as closedIncident
							from		crm.Accounts a (nolock)
							inner join	.fpastea.[Incidents]		   i (nolock)
								on i.[EndUserCompanyCode] = a.[AccountNumber] collate Latin1_General_CI_AI
								   and		i.[EndUserCompanyCode] != i.[AccountCompanyCode]
								   and		i.[IsOpen] = 0
								   and		a.[StatusCode] ='Active'
							inner join	.[portal].[AccountSettings]	   channelAccountSettings (nolock)
								on [channelAccountSettings].[AccountNumber] = i.[AccountCompanyCode]
								   and		[channelAccountSettings].[CanViewContractsAndTickets] = 1
						) as tmp
			group by	AccountNumber
		)							closedIncidents
	on [closedIncidents].[AccountNumber] = [a].[AccountNumber];

print convert( varchar(16), getdate(), 14 )
	  + ' | CustomerPortal staging Accounts Updated End User Channel Partner Closed Incident Count: '
	  + convert( varchar(16), @@rowcount ) + ' records';



---
--Get direct InActive Contract Assets Count for enduser
update
	a
set
	a.InActiveContractAssetCount = isnull( caCnt.ContractAssetCnt, 0 )
from       staging.Accounts a
left join
(
    select
                 AccountNumber
                 , sum( [ContractAsset] ) as ContractAssetCnt
    from
                                    (
                                                    select
                                                                                                    a.[AccountNumber]
                                                                                        , 1 as [ContractAsset]
                                                    from                       staging.[Accounts]                               a (nolock)
                                                    inner join              staging.Contracts                 c (nolock)
                                                                    on c.[ppt_enduserid] = a.[AccountId]
                                                                        and                      c.[ppt_enduserid] = c.[ppt_accountid]
                                                                        and                      c.[IsActive] = 1 -- active
                                                                        and                      a.[StatusCode] ='Active'
                                                    inner join              staging.ContractAssets ca
                                                                    on ca.[ppt_contractid] = c.[ppt_contractId]
                                                                        and                      ca.[ppt_parentid] is null
                                                    and ca.Status = 'InActive' --active
                                    --where [CustomerTypeCode] = 1 --EndUser
                                    ) as tmp
    group by        [AccountNumber]
)     as caCnt
on caCnt.[AccountNumber] = a.[AccountNumber];

print convert( varchar(16), getdate(), 14 ) + ' | CustomerPortal staging inactive contract assets counts for end user: '
+ convert( varchar(16), @@rowcount ) + ' records';


--Get direct InActive Contract Assets Count for non end user
update
a
set
a.InActiveContractAssetCount = a.InActiveContractAssetCount + isnull( caCnt.ContractAssetCnt, 0 )
from       staging.Accounts a
left join
(
    select
                                                    AccountNumber
                                        , sum( [ContractAsset] ) as ContractAssetCnt
    from
                                                    (
                                                                    select
                                                                                                                    a.[AccountNumber]
                                                                                                        , 1 as [ContractAsset]
                                                                    from                       staging.[Accounts]                               a (nolock)
                                                                    inner join              staging.Contracts                 c (nolock)
                                                                                    on c.[ppt_accountid] = a.[AccountId]
                                                                                        and                      c.[ppt_enduserid] != c.[ppt_accountid]
                                                                                        and                      c.[IsActive] = 1 -- active
                                                                                        and                      a.[StatusCode] ='Active'
                                                                    inner join              staging.ContractAssets ca
                                                                                    on ca.[ppt_contractid] = c.[ppt_contractId]
                                                                                        and                      ca.[ppt_parentid] is null
                                                    and ca.Status = 'InActive' --active
                                                    --where [CustomerTypeCode] = 1 --EndUser
                                                    ) as tmp
    group by               [AccountNumber]
)                                                                                                               as caCnt
on caCnt.[AccountNumber] = a.[AccountNumber];

print convert( varchar(16), getdate(), 14 )
+ ' | CustomerPortal staging Accounts Updated Channel Partner inactive Contract Asset Count for non end user: '
+ convert( varchar(16), @@rowcount ) + ' records';


--Get direct InActive Contract Assets Count for channel partner
update
a
set
a.InActiveContractAssetCount = a.InActiveContractAssetCount + isnull( caCnt.ContractAssetCnt, 0 )
from       staging.Accounts a
left join
(
    select
                                                    AccountNumber
                                        , sum( [ContractAsset] ) as ContractAssetCnt
    from
                                                    (
                                                                    select
                                                                                                                    a.[AccountNumber]
                                                                                                        , 1 as [ContractAsset]
                                                                    from                       staging.[Accounts]                               a (nolock)
                                                                    inner join              staging.Contracts                 c (nolock)
                                                                                    on c.[ppt_enduserid] = a.[AccountId]
                                                                                        and                      c.[ppt_enduserid] != c.[ppt_accountid]
                                                                                        and                      c.[IsActive] = 1 -- active
                                                                                        and                      a.[StatusCode] ='Active'
                                                                    inner join              .[portal].[AccountSettings]                                                  channelPartnerSettings (nolock)
                                                                                    on [channelPartnerSettings].[AccountId] = [c].[ppt_accountid]
                                                                                        and                      [channelPartnerSettings].[CanViewContractsAndTickets] = 1
                                                                    inner join              staging.ContractAssets ca
                                                                                    on ca.[ppt_contractid] = c.[ppt_contractId]
                                                                                        and                      ca.[ppt_parentid] is null
                                                    and ca.Status = 'InActive' --active
                                                    --where [CustomerTypeCode] = 1 --EndUser
                                                    ) as tmp
    group by               [AccountNumber]
)                                                                                                               as caCnt
on caCnt.[AccountNumber] = a.[AccountNumber];

print convert( varchar(16), getdate(), 14 )
+ ' | CustomerPortal staging Accounts Updated Channel Partner Contract inactive Asset Count: '
+ convert( varchar(16), @@rowcount ) + ' records';




UPDATE contracts
 SET contracts.InActiveContractAssetCount = ISNULL(caCnt.InActiveContractAssetCount, 0)
FROM staging.Contracts contracts
    LEFT JOIN
    (
        SELECT ppt_contractId,
               SUM([ContractAsset]) AS InActiveContractAssetCount
        FROM
        (
            SELECT c.ppt_contractId,
                   1 AS [ContractAsset]
            FROM staging.Contracts c with (NOLOCK)
                INNER JOIN staging.ContractAssets ca  with (NOLOCK)
                    ON ca.[ppt_contractid] = c.[ppt_contractId]
                       AND ca.[ppt_parentid] IS NULL
                       AND ca.Status = 'InActive' --active

            WHERE   c.[IsActive] = 1 -- active
        ) AS tmp
        GROUP BY ppt_contractId
    ) AS caCnt
        ON caCnt.ppt_contractId = contracts.ppt_contractId;

PRINT CONVERT(VARCHAR(16), GETDATE(), 14)
      + ' | CustomerPortal staging Contracts inactive Asset Count: '
      + CONVERT(VARCHAR(16), @@rowcount) + ' records';



UPDATE contracts
 SET contracts.ActiveContractAssetCount = ISNULL(caCnt.ActiveContractAssetCount, 0)
FROM staging.Contracts contracts
    LEFT JOIN
    (
        SELECT ppt_contractId,
               SUM([ContractAsset]) AS ActiveContractAssetCount
        FROM
        (
            SELECT c.ppt_contractId,
                   1 AS [ContractAsset]
            FROM staging.Contracts c with (NOLOCK)
                INNER JOIN staging.ContractAssets ca  with (NOLOCK)
                    ON ca.[ppt_contractid] = c.[ppt_contractId]
                       AND ca.[ppt_parentid] IS NULL
                       AND ca.Status = 'Active' --active

            WHERE   c.[IsActive] = 1 -- active
        ) AS tmp
        GROUP BY ppt_contractId
    ) AS caCnt
        ON caCnt.ppt_contractId = contracts.ppt_contractId;

PRINT CONVERT(VARCHAR(16), GETDATE(), 14)
      + ' | CustomerPortal staging Contracts active Asset Count: '
      + CONVERT(VARCHAR(16), @@rowcount) + ' records';



GO
