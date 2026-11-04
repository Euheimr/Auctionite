
Basic XML Frame:

  ```
  <Ui xmlns="http://www.blizzard.com/wow/ui/"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://www.blizzard.com/wow/ui/ ..\FrameXML\UI.xsd">
      <Frame name="AuctioniteFrame">
          <Size><RelDimension x="0.5" y="0.5"/> </Size>
          <Anchors>
              <Anchor point="TOPLEFT"/>
          </Anchors>
          <Frames>
              <Button name="$parent_BtnSearch">
              ...
              </Button>
          </Frames>
      </Frame>
  </Ui>
  ```


- WoW:Events/Battle.net - https://addonstudio.org/wiki/WoW:Events/Battle.net
  - `BN_CONNECTED`
  - `BN_SYSTEM_MESSAGE`
  - `BN_SELF_ONLINE`
  - `BN_SELF_OFFLINE`
  - `BN_TOON_NAME_UPDATED`
  - `BN_FRIEND_ACCOUNT_ONLINE`
  - `BN_FRIEND_ACCOUNT_OFFLINE`
  - `BN_FRIEND_TOON_ONLINE`
  - `BN_FRIEND_TOON_OFFLINE`


- WoW:Events/System - https://addonstudio.org/wiki/WoW:Events/System
  - `ADDON_ACTION_FORBIDDEN`
  - `ADDON_LOADED`
  - `CVAR_UPDATE`
  - `DISPLAY_SIZE_CHANGED`
  - `PLAYER_ENTERING_WORLD`
  - `PLAYER_LEAVING_WORLD`
  - `PLAYER_LOGIN`
  - `PLAYER_LOGOUT`
  - `PLAYER_QUITTING`
  - `SOUND_DEVICE_UPDATE`
  - `TIME_PLAYED_MSG`
  - `UI_ERROR_MESSAGE`
  - `UI_INFO_MESSAGE`
  - `UPDATE_BINDINGS`

- WoW:Events/Player - https://addonstudio.org/wiki/WoW:Events/Player
  - `ACTIVE_TALENT_GROUP_CHANGED` -> specIndex Number
    - Fired when a player changes which dual spec is active
  - `CANCEL_SUMMON`
  - `CHARACTER_POINTS_CHANGED` -> numTalentPoints Number
    - `-1` on talent point assignment
    - `1` on level-up
  - `CHAT_MSG_COMBAT_XP_GAIN` msg String
    - does not fire if 0xp is gained when killing a target
  - `PLAYER_CAMPING`
  - `PLAYER_ENTERING_WORLD`
    - Fired when the player enters the world, enters/leaves an instance, or respawns at a graveyard. Also fires any other time the player sees a loading screen
    - GetPlayerMapPosition always returns the coordinates [0,0] and hence there is no way to determine using the event PLAYER_ENTERING_WORLD if the player is entering an instance or not. When leaving an instance the following events fire (ignoring party/raid events). 
      - WORLD_MAP_UPDATE
      - PLAYER_ENTERING_WORLD
      - WORLD_MAP_UPDATE <--- Player coordinates are non-zero here
    - Instances do have coordinates for units once the second WORLD_MAP_UPDATE event has fired. For the case of entering a battleground such as WSG, WORLD_MAP_UPDATE won't fire until you leave Silverwing Hold or Warsong Lumber Mill and you are outside.
  - `PLAYER_FLAGS_CHANGED`
  - `PLAYER_GUILD_UPDATE`
  - `PLAYER_LEVEL_UP` <- newLevel Number, hp Number, mana Number, talentPts Number (always 1 unless <10), pvpTalentPts Number, str Number, agl Number, sta Number, int Number
  - `PLAYER_MONEY`
    - Fired when player gains & loses money
    - Use `GetMoney()` when this event is fired to get the amount
  - `PLAYER_PVP_KILLS_CHANGED`
  - `PLAYER_REGEN_ENABLED`
    - Fired after ending combat. Useful as an out-of-combat event trigger
  - `PLAYER_SKINNED`
  - `PLAYER_TALENT_UPDATE`
  - `PLAYER_TOTEM_UPDATE` <- totemSlot Number (1-4)
    - Fires when totem is cast or destroyed
  - `PLAYER_UPDATE_RESTING`
  - `PLAYER_XP_UPDATE` <- unitId Number
  - `PLAYTIME_CHANGED`
    - Fired when the playtime state changes
  - <WRATH 3.x> `RUNE_POWER_UPDATE` <- runeIndex Number, runeUseable boolean
  - <Wrath 3.x> `RUNE_TYPE_UPDATE` <- runeIndex Number
  - `TIME_PLAYED_MSG` -> timeTotal number, timeAtLevel number
    - Fired when client received time played message
  - <1.x thru 3.x> `UNIT_ENERGY` <- name String
  - <4.x +> `UNIT_POWER` 
  - `UPDATE_EXHAUSTION`
    - Fired when rested bonus XP changes
    - Use `GetXPExhaustion()` to get value
  - `UPDATE_INVENTORY_ALERTS`
    - Fired when item durability status becomes yellow or red


- WoW:Events/Unit Info - https://addonstudio.org/wiki/WoW:Events/Unit_Info
  - `PLAYER_FOCUS_CHANGED`
  - `PLAYER_TARGET_CHANGED`
  - `RAID_TARGET_UPDATE`
    - Fired when player joins or leaves party or raid. Also fired when a raid target icon is changed or removed
    - Does NOT get triggered if a mob using a raid target icon dies
  - `UNIT_ATTACK`
  - `UNIT_ATTACK_POWER`
  - `UNIT_ATTACK_SPEED`
  - `UNIT_AURA`-> unitId
  - `UNIT_COMBAT` -> args1,2,3,4,5
  - `UNIT_COMBO_POINTS`
  - `UNIT_DAMAGE`
  - `UNIT_DEFENSE`
  - `UNIT_DISPLAYPOWER` unitId
  - `UNIT_DYNAMIC_FLAGS`
  - `UNIT_ENERGY` unitName
  - `UNIT_ENTERED_VEHICLE` unitId, unknownBool, vehicleType (Natural or Mechanical)
  - `UNIT_ENTERING_VEHICLE`
  - `UNIT_EXITED_VEHICLE` -> unitId
  - `UNIT_EXITING_VEHICLE`
  - `UNIT_FACTION` -> unitName
  - `UNIT_FLAGS`
  - <1.x - 3.x> `UNIT_FOCUS` -> unitId
    - Fired when a unit's focus resource value changes ie hunter pets
    - <4.x +> use `UNIT_POWER` instead
  - <4.x +> `UNIT_HEALTH_PREDICTION` -> unitId
    - Fired when unitId receiving incoming heal
  - `UNIT_HEALTH` -> unitId
    - Fired when unitId health is affected, regardless of distance
    - May fire more than once to represent the same change if entity can be accessed through multiple unitId's
    - Two events may be sent for party members within unitId's raid group
    - Seen unit names: player, pet, target, mouseover, party1..4, partypet1..4, raid1..40
  - `UNIT_INVENTORY_CHANGED` -> unitId
    - __Note__: - Inventory information is initially available when `PLAYER_ENTERING_WORLD` is triggered
    - Fired when player equips or unequips an item.
    - Fired  if your target, mouseover or party member changes an item (untested for hostile)
    - Fired when a new item is placed inside player's bags, taking a new slot.
    - Fired when a player weapon receives a temporary enhancement (poison, lure, etc)
    - Fires once if multiple slots are equipped/unequipped
  - `UNIT_LEVEL` -> unitId
  - <1.x - 3.x> `UNIT_MANA`, `UNIT_MAXMANA` -> unitId
    - <4.x +> Use `UNIT_MAXPOWER` instead
  - <1.x - 3.x> `UNIT_MAXENERGY`, `UNIT_RAGE`, `UNIT_MAXRAGE`, `UNIT_MAXFOCUS`, `UNIT_HAPPINESS`, `UNIT_MAXRUNIC_POWER`
    - <4.x +> Use `UNIT_MAXPOWER` instead
  - `UNIT_MAXHEALTH` -> unitId
  - `UNIT_MAXPOWER` -> unitId, powerType ("MANA", "RAGE", "ENERGY", "FOCUS", "HAPPINESS", "RUNIC_POWER")
  - `UNIT_MODEL_CHANGED`
    - Fired when unit 3d model changes
  - `UNIT_NAME_UPDATE` -> unitId
  - `UNIT_PET` -> unitId
    - Fired when unitId's pet changes
  - `UNIT_RESISTANCES`

  - todo: `UNIT_SPELLCAST_*`

- WoW:Events/Auction - https://addonstudio.org/wiki/WoW:Events/Auction
  - `AUCTION_BIDDER_LIST_UPDATE`
  - `AUCTION_HOUSE_CLOSED`
  - `AUCTION_HOUSE_DISABLED`
  - `AUCTION_HOUSE_SHOW`
    - Fired when AH interface is displayed
  - `AUCTION_ITEM_LIST_UPDATE`
    - Fired when Auction list updates or if SortAuctionItems() is called
  - `AUCTION_MULTISELL_FAILURE`
    - Listing multiple stacks failed or aborted
  - `AUCTION_MULTISELL_START` -> stacksTotal Number
    - Start listing multiple stacks
  - `AUCTION_MULTISELL_UPDATE` -> stacksPosted Number, TotalStacks Number
    - Fired on each stack posted when listing multiple stacks of items
  - `AUCTION_OWNED_LIST_UPDATE` ???
    - ???
  - `NEW_AUCTION_UPDATE`
    - user drags an item into the Auction Item box on the Auctions tab of the auction house window
