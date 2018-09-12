SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

 
/**
HJB 3/13/2018 create the merge operation for Merge_AccountSettings



**********************************************
EXEC [dbo].[Get_LastRunDate]
**********************************************

*/

CREATE PROC [integration].[Get_LastRunDate]

AS

BEGIN

 
 SELECT	  [LastRunDate] FROM portal.DataloadControl;
 

END
GO
