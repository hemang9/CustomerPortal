SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

 

/*
MOD HISTORY
----
HJB  3/7/2018   Update the Account Keys throughout the customer protal db
-----
EXEC stmt
 exec integration.[Reset_SecurityEntities]

 select * from [security].[GroupTypes]
**/

CREATE	 PROC [integration].[Reset_SecurityEntities]

AS

BEGIN




BEGIN TRANSACTION


TRUNCATE TABLE security.RequiredGroupCollectionGroups
TRUNCATE TABLE security.ResourceGroupCollection
DELETE	 from security.Resources
DELETE	 from security.RequiredGroupCollections
DELETE	 from security.Groups
DELETE	 from [security].[GroupTypes]
DELETE	 from [portal].[Activity] 




PRINT(N'Drop constraints from [portal].[ActivityLog]')
ALTER TABLE [portal].[ActivityLog] NOCHECK CONSTRAINT [FK_ActivityLog_Activity]

PRINT(N'Add 19 rows to [portal].[Activity]')
SET IDENTITY_INSERT [portal].[Activity] ON
INSERT INTO [portal].[Activity] ([Id], [ActivityName], [ActivityDescription]) VALUES (1, 'Login', 'User Logged in to the portal')
INSERT INTO [portal].[Activity] ([Id], [ActivityName], [ActivityDescription]) VALUES (2, 'Send Email', 'User sending contact email')
INSERT INTO [portal].[Activity] ([Id], [ActivityName], [ActivityDescription]) VALUES (3, 'Request Account Change', 'User requested a change to their account')
INSERT INTO [portal].[Activity] ([Id], [ActivityName], [ActivityDescription]) VALUES (4, 'Create User', 'User created an account for someone')
INSERT INTO [portal].[Activity] ([Id], [ActivityName], [ActivityDescription]) VALUES (5, 'Changed Permissions', 'User changed an accounts permissions')
INSERT INTO [portal].[Activity] ([Id], [ActivityName], [ActivityDescription]) VALUES (6, 'Edit User Info', 'User changed user info')
INSERT INTO [portal].[Activity] ([Id], [ActivityName], [ActivityDescription]) VALUES (7, 'Delete User', 'User deleted a user')
INSERT INTO [portal].[Activity] ([Id], [ActivityName], [ActivityDescription]) VALUES (8, 'Logout', 'User Logged out of the portal')
INSERT INTO [portal].[Activity] ([Id], [ActivityName], [ActivityDescription]) VALUES (9, 'Excel Export', 'Excel Export by user')
INSERT INTO [portal].[Activity] ([Id], [ActivityName], [ActivityDescription]) VALUES (10, 'Submit Ticket', 'Created an Incident')
INSERT INTO [portal].[Activity] ([Id], [ActivityName], [ActivityDescription]) VALUES (11, 'Account Information Change', 'Customer requested to change info on their account')
INSERT INTO [portal].[Activity] ([Id], [ActivityName], [ActivityDescription]) VALUES (12, 'Add Equipment', 'Customer requested to Add Equipment')
INSERT INTO [portal].[Activity] ([Id], [ActivityName], [ActivityDescription]) VALUES (13, 'Asset Information Request Change', 'Customer Requested to change information on contract asset')
INSERT INTO [portal].[Activity] ([Id], [ActivityName], [ActivityDescription]) VALUES (14, 'Support Request', 'Customer submitted a request for support')
INSERT INTO [portal].[Activity] ([Id], [ActivityName], [ActivityDescription]) VALUES (15, 'Account Administration Change', 'PPT Employee made a change to Account Administration')
INSERT INTO [portal].[Activity] ([Id], [ActivityName], [ActivityDescription]) VALUES (16, 'Account Settings', 'Updated Account Settings')
INSERT INTO [portal].[Activity] ([Id], [ActivityName], [ActivityDescription]) VALUES (17, 'Change Account', 'User changed account')
INSERT INTO [portal].[Activity] ([Id], [ActivityName], [ActivityDescription]) VALUES (18, 'User Login Activated ', 'Activated User to Login to the portal')
INSERT INTO [portal].[Activity] ([Id], [ActivityName], [ActivityDescription]) VALUES (19, 'User Login Deactivated', 'Deactivated User login')
SET IDENTITY_INSERT [portal].[Activity] OFF


PRINT(N'Drop constraints from [security].[UsersGroups]')
ALTER TABLE [security].[UsersGroups] NOCHECK CONSTRAINT [FK_UsersGroups_Groups]

PRINT(N'Drop constraints from [security].[RequiredGroupCollectionGroups]')
ALTER TABLE [security].[RequiredGroupCollectionGroups] NOCHECK CONSTRAINT [FK_RequiredGroupCollectionGroups_Groups]
ALTER TABLE [security].[RequiredGroupCollectionGroups] NOCHECK CONSTRAINT [FK_RequiredGroupCollectionGroups_RequiredGroupCollection]

PRINT(N'Drop constraints from [security].[ResourceGroupCollection]')
ALTER TABLE [security].[ResourceGroupCollection] NOCHECK CONSTRAINT [FK_ResourceGroups_Groups]
ALTER TABLE [security].[ResourceGroupCollection] NOCHECK CONSTRAINT [FK_ResourceGroups_Resources]

PRINT(N'Drop constraints from [security].[Groups]')
ALTER TABLE [security].[Groups] NOCHECK CONSTRAINT [FK_Groups_GroupTypes]

PRINT(N'Add 2 rows to [security].[GroupTypes]')
INSERT INTO [security].[GroupTypes] ([Id], [GroupTypeName]) VALUES ('f54f44a0-8742-e811-80c4-00155d05c70a', N'Role')
INSERT INTO [security].[GroupTypes] ([Id], [GroupTypeName]) VALUES ('f64f44a0-8742-e811-80c4-00155d05c70a', N'Permission')

PRINT(N'Add 9 rows to [security].[RequiredGroupCollections]')
SET IDENTITY_INSERT [security].[RequiredGroupCollections] ON
INSERT INTO [security].[RequiredGroupCollections] ([GroupCollectionId], [GroupCollectionName]) VALUES (1, 'ChanelPartner')
INSERT INTO [security].[RequiredGroupCollections] ([GroupCollectionId], [GroupCollectionName]) VALUES (2, 'Sales')
INSERT INTO [security].[RequiredGroupCollections] ([GroupCollectionId], [GroupCollectionName]) VALUES (3, 'SuperUser')
INSERT INTO [security].[RequiredGroupCollections] ([GroupCollectionId], [GroupCollectionName]) VALUES (4, 'User')
INSERT INTO [security].[RequiredGroupCollections] ([GroupCollectionId], [GroupCollectionName]) VALUES (5, 'UserAdmin')
INSERT INTO [security].[RequiredGroupCollections] ([GroupCollectionId], [GroupCollectionName]) VALUES (6, 'ChannelPartnerAdmin')
INSERT INTO [security].[RequiredGroupCollections] ([GroupCollectionId], [GroupCollectionName]) VALUES (8, 'ChannelPartnerUser')
INSERT INTO [security].[RequiredGroupCollections] ([GroupCollectionId], [GroupCollectionName]) VALUES (10, 'GroupsThatDontChange')
INSERT INTO [security].[RequiredGroupCollections] ([GroupCollectionId], [GroupCollectionName]) VALUES (11, 'HelpDesk')
SET IDENTITY_INSERT [security].[RequiredGroupCollections] OFF

PRINT(N'Add 14 rows to [security].[Resources]')
SET IDENTITY_INSERT [security].[Resources] ON
INSERT INTO [security].[Resources] ([ResourceId], [ResourceName]) VALUES (1, 'ChangeAccount')
INSERT INTO [security].[Resources] ([ResourceId], [ResourceName]) VALUES (2, 'SuperUser')
INSERT INTO [security].[Resources] ([ResourceId], [ResourceName]) VALUES (3, 'User')
INSERT INTO [security].[Resources] ([ResourceId], [ResourceName]) VALUES (4, 'TechContactAdmin')
INSERT INTO [security].[Resources] ([ResourceId], [ResourceName]) VALUES (5, 'AccountSettings')
INSERT INTO [security].[Resources] ([ResourceId], [ResourceName]) VALUES (7, 'ChannelPartner')
INSERT INTO [security].[Resources] ([ResourceId], [ResourceName]) VALUES (8, 'UserAdmin')
INSERT INTO [security].[Resources] ([ResourceId], [ResourceName]) VALUES (9, 'ChannelPartnerAdmin')
INSERT INTO [security].[Resources] ([ResourceId], [ResourceName]) VALUES (10, 'ChannelPartnerUser')
INSERT INTO [security].[Resources] ([ResourceId], [ResourceName]) VALUES (11, 'GroupsThatDontChange')
INSERT INTO [security].[Resources] ([ResourceId], [ResourceName]) VALUES (12, 'PPTEmployee')
INSERT INTO [security].[Resources] ([ResourceId], [ResourceName]) VALUES (13, 'PortalUser')
INSERT INTO [security].[Resources] ([ResourceId], [ResourceName]) VALUES (15, 'AccountAdministration')
INSERT INTO [security].[Resources] ([ResourceId], [ResourceName]) VALUES (16, 'HelpDesk')
SET IDENTITY_INSERT [security].[Resources] OFF

PRINT(N'Add 6 rows to [security].[Groups]')
SET IDENTITY_INSERT [security].[Groups] ON
INSERT INTO [security].[Groups] ([GroupId], [GroupName], [GroupTypeId]) VALUES (1, 'CustomerPortal_Permission_ChannelPartner', 'f64f44a0-8742-e811-80c4-00155d05c70a')
INSERT INTO [security].[Groups] ([GroupId], [GroupName], [GroupTypeId]) VALUES (2, 'CustomerPortal_Permission_Sales', 'f64f44a0-8742-e811-80c4-00155d05c70a')
INSERT INTO [security].[Groups] ([GroupId], [GroupName], [GroupTypeId]) VALUES (3, 'CustomerPortal_Permission_SuperUser', 'f64f44a0-8742-e811-80c4-00155d05c70a')
INSERT INTO [security].[Groups] ([GroupId], [GroupName], [GroupTypeId]) VALUES (4, 'CustomerPortal_Role_User', 'f54f44a0-8742-e811-80c4-00155d05c70a')
INSERT INTO [security].[Groups] ([GroupId], [GroupName], [GroupTypeId]) VALUES (5, 'CustomerPortal_Role_UserAdmin', 'f54f44a0-8742-e811-80c4-00155d05c70a')
INSERT INTO [security].[Groups] ([GroupId], [GroupName], [GroupTypeId]) VALUES (6, 'CustomerPortal_Permission_HelpDesk', 'f64f44a0-8742-e811-80c4-00155d05c70a')
SET IDENTITY_INSERT [security].[Groups] OFF

PRINT(N'Add 20 rows to [security].[ResourceGroupCollection]')
INSERT INTO [security].[ResourceGroupCollection] ([ResourceId], [GroupCollectionId]) VALUES (1, 2)
INSERT INTO [security].[ResourceGroupCollection] ([ResourceId], [GroupCollectionId]) VALUES (1, 3)
INSERT INTO [security].[ResourceGroupCollection] ([ResourceId], [GroupCollectionId]) VALUES (1, 11)
INSERT INTO [security].[ResourceGroupCollection] ([ResourceId], [GroupCollectionId]) VALUES (2, 3)
INSERT INTO [security].[ResourceGroupCollection] ([ResourceId], [GroupCollectionId]) VALUES (3, 4)
INSERT INTO [security].[ResourceGroupCollection] ([ResourceId], [GroupCollectionId]) VALUES (4, 5)
INSERT INTO [security].[ResourceGroupCollection] ([ResourceId], [GroupCollectionId]) VALUES (5, 6)
INSERT INTO [security].[ResourceGroupCollection] ([ResourceId], [GroupCollectionId]) VALUES (7, 1)
INSERT INTO [security].[ResourceGroupCollection] ([ResourceId], [GroupCollectionId]) VALUES (8, 5)
INSERT INTO [security].[ResourceGroupCollection] ([ResourceId], [GroupCollectionId]) VALUES (9, 6)
INSERT INTO [security].[ResourceGroupCollection] ([ResourceId], [GroupCollectionId]) VALUES (10, 8)
INSERT INTO [security].[ResourceGroupCollection] ([ResourceId], [GroupCollectionId]) VALUES (11, 10)
INSERT INTO [security].[ResourceGroupCollection] ([ResourceId], [GroupCollectionId]) VALUES (12, 2)
INSERT INTO [security].[ResourceGroupCollection] ([ResourceId], [GroupCollectionId]) VALUES (12, 3)
INSERT INTO [security].[ResourceGroupCollection] ([ResourceId], [GroupCollectionId]) VALUES (12, 11)
INSERT INTO [security].[ResourceGroupCollection] ([ResourceId], [GroupCollectionId]) VALUES (13, 4)
INSERT INTO [security].[ResourceGroupCollection] ([ResourceId], [GroupCollectionId]) VALUES (13, 5)
INSERT INTO [security].[ResourceGroupCollection] ([ResourceId], [GroupCollectionId]) VALUES (15, 3)
INSERT INTO [security].[ResourceGroupCollection] ([ResourceId], [GroupCollectionId]) VALUES (15, 11)
INSERT INTO [security].[ResourceGroupCollection] ([ResourceId], [GroupCollectionId]) VALUES (16, 11)

PRINT(N'Add 13 rows to [security].[RequiredGroupCollectionGroups]')
INSERT INTO [security].[RequiredGroupCollectionGroups] ([GroupCollectionId], [GroupId]) VALUES (1, 1)
INSERT INTO [security].[RequiredGroupCollectionGroups] ([GroupCollectionId], [GroupId]) VALUES (2, 2)
INSERT INTO [security].[RequiredGroupCollectionGroups] ([GroupCollectionId], [GroupId]) VALUES (3, 3)
INSERT INTO [security].[RequiredGroupCollectionGroups] ([GroupCollectionId], [GroupId]) VALUES (4, 4)
INSERT INTO [security].[RequiredGroupCollectionGroups] ([GroupCollectionId], [GroupId]) VALUES (5, 5)
INSERT INTO [security].[RequiredGroupCollectionGroups] ([GroupCollectionId], [GroupId]) VALUES (6, 1)
INSERT INTO [security].[RequiredGroupCollectionGroups] ([GroupCollectionId], [GroupId]) VALUES (6, 5)
INSERT INTO [security].[RequiredGroupCollectionGroups] ([GroupCollectionId], [GroupId]) VALUES (8, 1)
INSERT INTO [security].[RequiredGroupCollectionGroups] ([GroupCollectionId], [GroupId]) VALUES (8, 4)
INSERT INTO [security].[RequiredGroupCollectionGroups] ([GroupCollectionId], [GroupId]) VALUES (10, 2)
INSERT INTO [security].[RequiredGroupCollectionGroups] ([GroupCollectionId], [GroupId]) VALUES (10, 3)
INSERT INTO [security].[RequiredGroupCollectionGroups] ([GroupCollectionId], [GroupId]) VALUES (10, 6)
INSERT INTO [security].[RequiredGroupCollectionGroups] ([GroupCollectionId], [GroupId]) VALUES (11, 6)

PRINT(N'Add 35 rows to [security].[UsersGroups]')

 

--INSERT INTO [security].[UsersGroups] ([UserId], [GroupId]) VALUES ('821325d7-f844-e811-80c4-00155d05c70a', 1)
--INSERT INTO [security].[UsersGroups] ([UserId], [GroupId]) VALUES ('821325d7-f844-e811-80c4-00155d05c70a', 3)
--INSERT INTO [security].[UsersGroups] ([UserId], [GroupId]) VALUES ('821325d7-f844-e811-80c4-00155d05c70a', 5)
--INSERT INTO [security].[UsersGroups] ([UserId], [GroupId]) VALUES ('330efc36-8b45-e811-80c4-00155d05c70a', 1)
--INSERT INTO [security].[UsersGroups] ([UserId], [GroupId]) VALUES ('330efc36-8b45-e811-80c4-00155d05c70a', 3)
--INSERT INTO [security].[UsersGroups] ([UserId], [GroupId]) VALUES ('330efc36-8b45-e811-80c4-00155d05c70a', 5)
--INSERT INTO [security].[UsersGroups] ([UserId], [GroupId]) VALUES ('4fde34e1-a245-e811-80c4-00155d05c70a', 5)
--INSERT INTO [security].[UsersGroups] ([UserId], [GroupId]) VALUES ('87ea731e-c445-e811-80c4-00155d05c70a', 1)
--INSERT INTO [security].[UsersGroups] ([UserId], [GroupId]) VALUES ('87ea731e-c445-e811-80c4-00155d05c70a', 3)
--INSERT INTO [security].[UsersGroups] ([UserId], [GroupId]) VALUES ('87ea731e-c445-e811-80c4-00155d05c70a', 5)
--INSERT INTO [security].[UsersGroups] ([UserId], [GroupId]) VALUES ('cb9ba8e5-6d46-e811-80c4-00155d05c70a', 3)
--INSERT INTO [security].[UsersGroups] ([UserId], [GroupId]) VALUES ('cb9ba8e5-6d46-e811-80c4-00155d05c70a', 5)
--INSERT INTO [security].[UsersGroups] ([UserId], [GroupId]) VALUES ('f4fafc60-7c46-e811-80c4-00155d05c70a', 3)
--INSERT INTO [security].[UsersGroups] ([UserId], [GroupId]) VALUES ('f4fafc60-7c46-e811-80c4-00155d05c70a', 5)
--INSERT INTO [security].[UsersGroups] ([UserId], [GroupId]) VALUES ('0d9be712-f846-e811-80c4-00155d05c70a', 3)
--INSERT INTO [security].[UsersGroups] ([UserId], [GroupId]) VALUES ('0d9be712-f846-e811-80c4-00155d05c70a', 5)
--INSERT INTO [security].[UsersGroups] ([UserId], [GroupId]) VALUES ('e779b2ba-1347-e811-80c4-00155d05c70a', 1)
--INSERT INTO [security].[UsersGroups] ([UserId], [GroupId]) VALUES ('e779b2ba-1347-e811-80c4-00155d05c70a', 3)
--INSERT INTO [security].[UsersGroups] ([UserId], [GroupId]) VALUES ('e779b2ba-1347-e811-80c4-00155d05c70a', 5)
--INSERT INTO [security].[UsersGroups] ([UserId], [GroupId]) VALUES ('a594117b-1847-e811-80c4-00155d05c70a', 1)
--INSERT INTO [security].[UsersGroups] ([UserId], [GroupId]) VALUES ('a594117b-1847-e811-80c4-00155d05c70a', 3)
--INSERT INTO [security].[UsersGroups] ([UserId], [GroupId]) VALUES ('a594117b-1847-e811-80c4-00155d05c70a', 5)
--INSERT INTO [security].[UsersGroups] ([UserId], [GroupId]) VALUES ('63516dd6-1847-e811-80c4-00155d05c70a', 3)
--INSERT INTO [security].[UsersGroups] ([UserId], [GroupId]) VALUES ('63516dd6-1847-e811-80c4-00155d05c70a', 5)
--INSERT INTO [security].[UsersGroups] ([UserId], [GroupId]) VALUES ('23a11bb7-1f47-e811-80c4-00155d05c70a', 1)
--INSERT INTO [security].[UsersGroups] ([UserId], [GroupId]) VALUES ('23a11bb7-1f47-e811-80c4-00155d05c70a', 3)
--INSERT INTO [security].[UsersGroups] ([UserId], [GroupId]) VALUES ('23a11bb7-1f47-e811-80c4-00155d05c70a', 5)
--INSERT INTO [security].[UsersGroups] ([UserId], [GroupId]) VALUES ('e407f2f9-2247-e811-80c4-00155d05c70a', 3)
--INSERT INTO [security].[UsersGroups] ([UserId], [GroupId]) VALUES ('e407f2f9-2247-e811-80c4-00155d05c70a', 5)
--INSERT INTO [security].[UsersGroups] ([UserId], [GroupId]) VALUES ('3b80566f-2347-e811-80c4-00155d05c70a', 3)
--INSERT INTO [security].[UsersGroups] ([UserId], [GroupId]) VALUES ('3b80566f-2347-e811-80c4-00155d05c70a', 5)
--INSERT INTO [security].[UsersGroups] ([UserId], [GroupId]) VALUES ('c6d97085-2647-e811-80c4-00155d05c70a', 3)
--INSERT INTO [security].[UsersGroups] ([UserId], [GroupId]) VALUES ('c6d97085-2647-e811-80c4-00155d05c70a', 5)
--INSERT INTO [security].[UsersGroups] ([UserId], [GroupId]) VALUES ('322bb1dc-3647-e811-80c4-00155d05c70a', 3)
--INSERT INTO [security].[UsersGroups] ([UserId], [GroupId]) VALUES ('322bb1dc-3647-e811-80c4-00155d05c70a', 5)

PRINT(N'Add constraints to [security].[UsersGroups]')
ALTER TABLE [security].[UsersGroups] WITH CHECK CHECK CONSTRAINT [FK_UsersGroups_Groups]

PRINT(N'Add constraints to [security].[RequiredGroupCollectionGroups]')
ALTER TABLE [security].[RequiredGroupCollectionGroups] WITH CHECK CHECK CONSTRAINT [FK_RequiredGroupCollectionGroups_Groups]
ALTER TABLE [security].[RequiredGroupCollectionGroups] WITH CHECK CHECK CONSTRAINT [FK_RequiredGroupCollectionGroups_RequiredGroupCollection]

PRINT(N'Add constraints to [security].[ResourceGroupCollection]')
ALTER TABLE [security].[ResourceGroupCollection] WITH CHECK CHECK CONSTRAINT [FK_ResourceGroups_Groups]
ALTER TABLE [security].[ResourceGroupCollection] WITH CHECK CHECK CONSTRAINT [FK_ResourceGroups_Resources]

PRINT(N'Add constraints to [security].[Groups]')
ALTER TABLE [security].[Groups] WITH CHECK CHECK CONSTRAINT [FK_Groups_GroupTypes]
COMMIT TRANSACTION



 

END



GO
