DECLARE @InputUsername AS VARCHAR(100)='USER BEFORE'
DECLARE @OutputUsername AS VARCHAR(100)='USER AFTER'

--Make sure to double check the codebase to make sure anything hardcoded with this username
-- is updated as well (user titles/trophies)

--Alter tables
ALTER TABLE [MyAdventureGame].[dbo].[Duels] NOCHECK CONSTRAINT [FK Duels Users - Challengee];
ALTER TABLE [MyAdventureGame].[dbo].[Forums_Posts] NOCHECK CONSTRAINT FK_Forums_Posts_Users;
ALTER TABLE [MyAdventureGame].[dbo].[Game Coauthors]  NOCHECK CONSTRAINT [FK Game Coauthors Users];
ALTER TABLE [MyAdventureGame].[dbo].[Private Messages] NOCHECK CONSTRAINT [FK Private Messages Username Sender];
ALTER TABLE [MyAdventureGame].[dbo].[Private Messages] NOCHECK CONSTRAINT [FK Private Messages Username Recipient];
ALTER TABLE [MyAdventureGame].[dbo].[Games] NOCHECK CONSTRAINT [FK Games Username];
ALTER TABLE [MyAdventureGame].[dbo].[Point Transactions] NOCHECK CONSTRAINT [FK Point Transactions];
ALTER TABLE [MyAdventureGame].[dbo].[Privileges] NOCHECK CONSTRAINT [FK Privileges Users];
ALTER TABLE [MyAdventureGame].[dbo].[Articles] NOCHECK CONSTRAINT [FK Articles Users];

ALTER TABLE [MyAdventureGame].[dbo].[Private Messages - Deleted] NOCHECK CONSTRAINT [FK Private Messages - Deleted Username];
ALTER TABLE [MyAdventureGame].[dbo].[User Images] NOCHECK CONSTRAINT [FK User Images Users];
ALTER TABLE [MyAdventureGame].[dbo].[Game Saves] NOCHECK CONSTRAINT [FK Game Saves Users];
ALTER TABLE [MyAdventureGame].[dbo].[Forums_Message_Subscriptions] NOCHECK CONSTRAINT FK_Forums_Message_Subscriptions_Users;
ALTER TABLE [MyAdventureGame].[dbo].[Endorsements] NOCHECK CONSTRAINT FK__Endorsements__Username;

--Run changes
UPDATE [MyAdventureGame].[dbo].[Users] SET Username = @OutputUsername where Username like @InputUsername;
UPDATE [MyAdventureGame].[dbo].[Forums_Posts] SET Username = @OutputUsername where Username like @InputUsername;
UPDATE [MyAdventureGame].[dbo].[Game Coauthors] SET Username = @OutputUsername where Username like @InputUsername;
UPDATE [MyAdventureGame].[dbo].[Private Messages] SET [Sender Username] = @OutputUsername where [Sender Username] like @InputUsername;
UPDATE [MyAdventureGame].[dbo].[Private Messages] SET [Recipient Username] = @OutputUsername where [Recipient Username] like @InputUsername;
UPDATE [MyAdventureGame].[dbo].[Games] SET Username = @OutputUsername where Username like @InputUsername;
UPDATE [MyAdventureGame].[dbo].[Point Transactions] SET Username = @OutputUsername where Username like @InputUsername;
UPDATE [MyAdventureGame].[dbo].[Privileges] SET Username = @OutputUsername where Username like @InputUsername;
UPDATE [MyAdventureGame].[dbo].[Game Saves] SET Username = @OutputUsername where Username like @InputUsername;
UPDATE [MyAdventureGame].[dbo].[User Images] SET Username = @OutputUsername where Username like @InputUsername;
UPDATE [MyAdventureGame].[dbo].[Private Messages - Deleted] SET Username = @OutputUsername where Username like @InputUsername;
UPDATE [MyAdventureGame].[dbo].[Forums_Message_Subscriptions] SET Username = @OutputUsername where Username like @InputUsername;
UPDATE [MyAdventureGame].[dbo].[Endorsements] SET Username = @OutputUsername where Username like @InputUsername;
UPDATE [MyAdventureGame].[dbo].[Duels] SET [Challengee Username] = @OutputUsername where [Challengee Username] like @InputUsername;
UPDATE [MyAdventureGame].[dbo].[Duels] SET [Challenger Username] = @OutputUsername where [Challenger Username] like @InputUsername;
UPDATE [MyAdventureGame].[dbo].[Comments_OLD] SET Name = @OutputUsername where Name like @InputUsername;
UPDATE [MyAdventureGame].[dbo].[Articles] SET Username = @OutputUsername where Username like @InputUsername;
UPDATE [ChooseYourStory].[dbo].[User_TrophyTypes] SET [Owner_Username] = @OutputUsername where [Owner_Username] like @InputUsername;
UPDATE [ChooseYourStory].[dbo].[User_Trophies] SET Username = @OutputUsername where Username like @InputUsername;
UPDATE [ChooseYourStory].[dbo].[User_Properties] SET Username = @OutputUsername where Username like @InputUsername;
UPDATE [ChooseYourStory].[dbo].[User_PersonalizationSettings] SET Username = @OutputUsername where Username like @InputUsername;
UPDATE [ChooseYourStory].[dbo].[User_Notifications] SET [User_Username] = @OutputUsername where [User_Username] like @InputUsername;
UPDATE [ChooseYourStory].[dbo].[Story_EditorOptions] SET [User_Username] = @OutputUsername where [User_Username] like @InputUsername;
UPDATE [ChooseYourStory].[dbo].[Story_Comments] SET [Commenter_Username] = @OutputUsername where [Commenter_Username] like @InputUsername;
UPDATE [ChooseYourStory].[dbo].[Duel_RpsUserChoices] SET [User_Username] = @OutputUsername where [User_Username] like @InputUsername;

--Revert tables back
ALTER TABLE [MyAdventureGame].[dbo].[Duels] CHECK CONSTRAINT [FK Duels Users - Challengee];
ALTER TABLE [MyAdventureGame].[dbo].[Forums_Posts] CHECK CONSTRAINT FK_Forums_Posts_Users;
ALTER TABLE [MyAdventureGame].[dbo].[Game Coauthors]  CHECK CONSTRAINT [FK Game Coauthors Users];
ALTER TABLE [MyAdventureGame].[dbo].[Private Messages] CHECK CONSTRAINT [FK Private Messages Username Sender];
ALTER TABLE [MyAdventureGame].[dbo].[Private Messages] CHECK CONSTRAINT [FK Private Messages Username Recipient];
ALTER TABLE [MyAdventureGame].[dbo].[Games] CHECK CONSTRAINT [FK Games Username];
ALTER TABLE [MyAdventureGame].[dbo].[Point Transactions] CHECK CONSTRAINT [FK Point Transactions];
ALTER TABLE [MyAdventureGame].[dbo].[Privileges] CHECK CONSTRAINT [FK Privileges Users];
ALTER TABLE [MyAdventureGame].[dbo].[Articles] CHECK CONSTRAINT [FK Articles Users];
ALTER TABLE [MyAdventureGame].[dbo].[Private Messages - Deleted] CHECK CONSTRAINT [FK Private Messages - Deleted Username];
ALTER TABLE [MyAdventureGame].[dbo].[User Images] CHECK CONSTRAINT [FK User Images Users];
ALTER TABLE [MyAdventureGame].[dbo].[Game Saves] CHECK CONSTRAINT [FK Game Saves Users];
ALTER TABLE [MyAdventureGame].[dbo].[Forums_Message_Subscriptions] CHECK CONSTRAINT FK_Forums_Message_Subscriptions_Users;
ALTER TABLE [MyAdventureGame].[dbo].[Endorsements] CHECK CONSTRAINT FK__Endorsements__Username;
