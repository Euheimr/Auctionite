local ADDON_NAME, Auctionite = ...

-- Load and persist
AUCTIONITE_CFG = AUCTIONITE_CFG or {
   updateInterval = AUCTIONITE_CFG.updateInterval or 1.0,
   debug = AUCTIONITE_CFG.debug or false
}
AUCTIONITE_DB = AUCTIONITE_DB or {}

-- TODO: check conflicts
-- conflicts = Auctionite:CheckConflicts()

-- Benevolently dictate our global Auctionite namespace via XML AuctioniteFrame OnLoad()
Auctionite = Auctionite or {
   Frame = AuctioniteFrameMixin,                       -- AuctioniteFrame of course
   lastUpdate = AuctioniteFrameMixin.lastUpdate,       -- Variable pulled & polled by AuctioniteFrame_OnUpdate() via XML
   Events = Auctionite.Events or {},   -- OnEvent(...) Events Handler
   -- Setup state via SavedVariables by reference - don't copy the values
   Db = AUCTIONITE_DB,
   updateInterval = AUCTIONITE_CFG.updateInterval,
   debug = AUCTIONITE_CFG.debug,
}
local debug = Auctionite.debug


local function print(msg)
   local color = "F0C060"

   if DEFAULT_CHAT_FRAME then DEFAULT_CHAT_FRAME:AddMessage(
         "|cff" .. color .. ADDON_NAME .. "|r: " .. tostring(msg))
   end
end

function Auctionite:Show()
   self.Frame:Show()
   if debug and not self.Frame.hidden then print("shown") end
end

function Auctionite:Hide()
   self.Frame:Hide()
   if debug and self.Frame.hidden then print("hidden") end
end

--- CLI ---
SLASH_AUCTIONITE, SLASH_AUCTIONITE1 = "/auctionite", "/nite"

function Auctionite:RegisterCLI()
   SlashCmdList[SLASH_AUCTIONITE] = function(msg, _)
      if msg == "debug" then
         self.debug = not self.debug
         print("debug is " .. string.upper((tostring(self.debug))))
      elseif msg == "show" then
         self:Show()
      elseif msg == "hide" then
         self:Hide()
      end
   end
   -- just alias
   SlashCmdList[SLASH_AUCTIONITE1] = SlashCmdList[SLASH_AUCTIONITE]
end
--- CLI ---

--- EVENTS ---
local events = Auctionite.Events

function events:ADDON_LOADED(...)
   print(ADDON_NAME .. " v"
         ---@diagnostic disable-next-line: undefined-global
         .. C_Addons:GetAddonMetadata(ADDON_NAME, "Version")
         .. " LOADED")
end

function events:PLAYER_INTERACTION_MANAGER_FRAME_SHOW(_, _, panelType)
   if panelType == Enum.PlayerInteractionType.Auctioneer then
      local tabs = {
         "Shop",
         "Sell",
         "WoW Token",
      }
      local f = Auctionite.Frame

      for _, name in pairs(tabs) do
         LibAHTab:CreateTab(name, f, name, "header")
      end

      f:SetScript("OnShow", function()
         -- do something when the tab is selected
         LibAHTab:SetSelected(0)
      end)
   end
end

function events:AUCTION_HOUSE_SHOW(...)
   Auctionite:Show();
end

function events:AUCTION_HOUSE_HIDE(...)
   Auctionite:Hide();
end

function events:AUCTION_HOUSE_DISABLED(...)
   print("Auction House disabled or unavailable")
end

function events:TRADE_SKILL_SHOW(...)
   --TODO: init professions frame
end

local function eventHandler(self, event, ...)
   if events[event] then events[event](self, ...) end
end

function Auctionite:RegisterEvents()
   self.Frame:SetScript("OnEvent", eventHandler)
   for k, _ in pairs(Auctionite.Events) do
      local ok = self.Frame:RegisterEvent(k)
      if Auctionite.debug then
         if ok then print(string.format("<RegisterEvent> %s - ok", k))
         else
            print(string.format("<RegisterEvent> %s - FAILURE", k))
         end
      end
   end
end
--- EVENTS ---

--- AuctioniteFrame Functionality ---
local LibAHTab = LibStub:GetLibrary("LibAHTab-1.0")
assert(LibAHTab, "Could not load LibAHTab")

AuctioniteDialogs = {
   "BuyDialog",
}

AuctioniteFramePopups = {
   "BID_AUCTION",
   "BUYOUT_AUCTION",
   "CANCEL_AUCTION",
   "TOKEN_AUCTIONABLE_TOKEN_OWNED",
   "TOKEN_NONE_FOR_SALE",
}

---AuctioniteFrame OnLoad()
---@param self table AuctioniteFrame
function AuctioniteFrameMixin:OnLoad(self)
   --CallbackRegistryMixin.OnLoad(self);

   Auctionite:RegisterCLI()
   Auctionite:RegisterEvents()
end

---AuctioniteFrame OnUpdate()
---@param self table AuctioniteFrame
---@param elapsed table
function AuctioniteFrameMixin:OnUpdate(self, elapsed)
   self.lastUpdate = self.lastUpdate + elapsed;

   if (self.lastUpdate > Auctionite.updateInterval) then
      -- TODO: Update state here

      self.lastUpdate = 0;
   end
end