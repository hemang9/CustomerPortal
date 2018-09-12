SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- ============================================================
-- Author:		Michael Kucirka
-- Create date: 01/12/2018
-- Description:	This is all the logic for CoverageStartDate
-- ============================================================
CREATE FUNCTION [dbo].[ContractAssets_CoverageStartDate] 
(
	-- Add the parameters for the function here
	@originationDate		AS	DATETIME, 
	@contractStartDate		AS  DATETIME,
	@firstCallStartDate		AS  DATETIME,
	@billingStartDate		AS  DATETIME,
	@termStartDate			AS  DATETIME,
	@coverageStartDate		AS  DATETIME

)
RETURNS DATETIME
AS
BEGIN
		RETURN CASE 
			WHEN (@originationDate != @contractStartDate) THEN 
				CASE -- If FC start date is null then billing date otherwise FC start Date
					WHEN (@firstCallStartDate IS NULL) THEN @billingStartDate		
					ELSE @firstCallStartDate		
					END
			ELSE 
				CASE
					WHEN (@coverageStartDate IS NOT NULL) THEN
						CASE
							WHEN(@firstCallStartDate IS NULL) THEN
								CASE
									WHEN (@billingStartDate > @termStartDate) THEN @billingStartDate
									ELSE
										@coverageStartDate
									END
							ELSE
								CASE
									WHEN (@billingStartDate > @termStartDate) THEN
										CASE
											WHEN (@firstCallStartDate > @termStartDate) THEN @firstCallStartDate
											ELSE
												@coverageStartDate
											END
									ELSE
										@billingStartDate
									END
							END			
					ELSE
						CASE
							WHEN (@billingStartDate > @termStartDate) THEN @billingStartDate
							ELSE
								@coverageStartDate
							END
					END
			END										

END
GO
