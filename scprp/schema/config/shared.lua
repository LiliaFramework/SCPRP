--[[--
Lilia's configuration options.

This is meant to override Lilia's configuration options.
]]
-- @configuration Lilia
--- A list of available configuration options for use within the game.
-- Each option is represented by a field with a specific data type and functionality.
-- @realm shared
-- @table ConfigList
-- @field WalkSpeed Controls how fast characters walk | **integer**
-- @field RunSpeed Controls how fast characters run | **integer**
-- @field WalkRatio Defines the walk speed ratio when holding the Alt key | **number**
-- @field AllowExistNames Determines whether duplicate character names are allowed | **boolean**
-- @field GamemodeName Specifies the name of the gamemode | **string**
-- @field Color Sets the theme color used throughout the gamemode | **color**
-- @field Font Specifies the core font used for UI elements | **string**
-- @field Language Determines the language setting for the game | **string**
-- @field GenericFont Specifies the secondary font used for UI elements | **string**
-- @field MoneyModel Defines the model used for representing money in the game | **string**
-- @field MaxCharacters Sets the maximum number of characters per player | **integer**
-- @field DataSaveInterval Time interval between data saves | **integer**
-- @field CharacterDataSaveInterval Time interval between character data saves | **integer**
-- @field MoneyLimit Sets the limit of money a player can have **[0 for infinite]** | **integer**
-- @field invW Defines the width of the default inventory | **integer**
-- @field invH Defines the height of the default inventory | **integer**
-- @field DefaultMoney Specifies the default amount of money a player starts with | **integer**
-- @field MaxChatLength Sets the maximum length of chat messages | **integer**
-- @field CurrencySymbol Specifies the currency symbol used in the game | **string**
-- @field SpawnTime Time to respawn after death | **integer**
-- @field MaxAttributePoints Maximum number of points that can be allocated across an attribute | **integer**
-- @field MaxStartingAttributes Maximum value of each attribute at character creation | **integer**
-- @field StartingAttributePoints Total number of points available for starting attribute allocation | **integer**
-- @field EquipDelay Time delay between equipping items | **integer**
-- @field DropDelay Time delay between dropping items | **integer**
-- @field TakeDelay Time delay between taking items | **integer**
-- @field CurrencySingularName Singular name of the in-game currency | **string**
-- @field CurrencyPluralName Plural name of the in-game currency | **string**
-- @field SchemaYear Year of the gamemode's schema | **integer**
-- @field AmericanDates Determines whether to use the American date format | **boolean**
-- @field AmericanTimeStamp Determines whether to use the American timestamp format | **boolean**
-- @field MinDescLen Minimum length required for a character's description | **integer**
-- @field AdminConsoleNetworkLogs Specifies if the logging system should replicate to admins' consoles | **boolean**
-- @field TimeToEnterVehicle Time **[in seconds]** required to enter a vehicle | **integer**
-- @field CarEntryDelayEnabled Determines if the car entry delay is applicable | **boolean**
-- @field Notify Contains notification sound and volume settings | **table**
-- @field Notify.Sound Notification sound file path | **string**
-- @field Notify.Volume Notification volume | **integer**
-- @field Notify.Pitch Notification pitch | **integer**
lia.config.WalkSpeed = 130
lia.config.RunSpeed = 235
lia.config.WalkRatio = 0.5
lia.config.AllowExistNames = true
lia.config.GamemodeName = "A Lilia Gamemode"
lia.config.Color = Color(37, 116, 108)
lia.config.Font = "Arial"
lia.config.Language = "english"
lia.config.GenericFont = "Segoe UI"
lia.config.MoneyModel = "models/props_lab/box01a.mdl"
lia.config.MaxCharacters = 5
lia.config.DataSaveInterval = 600
lia.config.CharacterDataSaveInterval = 300
lia.config.MoneyLimit = 0
lia.config.invW = 6
lia.config.invH = 4
lia.config.DefaultMoney = 0
lia.config.MaxChatLength = 256
lia.config.CurrencySymbol = "$"
lia.config.SpawnTime = 5
lia.config.MaxAttributePoints = 30
lia.config.MaxStartingAttributes = 30
lia.config.StartingAttributePoints = 30
lia.config.EquipDelay = 2
lia.config.UnequipDelay = 2
lia.config.DropDelay = 2
lia.config.TakeDelay = 0
lia.config.CurrencySingularName = "Dollar"
lia.config.CurrencyPluralName = "Dollars"
lia.config.SchemaYear = 2023
lia.config.AmericanDates = true
lia.config.AmericanTimeStamp = true
lia.config.MinDescLen = 16
lia.config.AdminConsoleNetworkLogs = false
lia.config.TimeToEnterVehicle = 1
lia.config.CarEntryDelayEnabled = true
lia.config.Notify = {"garrysmod/content_downloaded.wav", 50, 250}
