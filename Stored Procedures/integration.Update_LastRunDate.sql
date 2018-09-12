SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

 
/**
HJB 3/13/2018 create the merge operation for Merge_AccountSettings



**********************************************
EXEC [dbo].[update_LastRunDate]

select * from portal.DataloadControl 
**********************************************

*/

CREATE PROC [integration].[Update_LastRunDate]

AS

BEGIN

 
 UPDATE portal.DataloadControl SET [LastRunDate] =GETDATE()
 

END
GO
