local ADDON_NAME, Auctionite = ...

Auctionite = LibStub("AceAddon-3.0"):NewAddon(ADDON_NAME)

local AceEvent = LibStub("AceEvent-3.0"):Embed(Auctionite)


-- TODO: check conflicts
---conflicts = Auctionite:CheckConflicts()

function print(msg)
   local color = "F0C060"
   local dbgColor = "FFAA00"

   if DEFAULT_CHAT_FRAME then
      if Auctionite.debug == true then
         DEFAULT_CHAT_FRAME:AddMessage(
                 "|cff" .. color .. ADDON_NAME .. "|r "
                         .. "|cff" .. dbgColor .. "<DEBUG>" .. "|r: " .. tostring(msg))
      else
         DEFAULT_CHAT_FRAME:AddMessage("|cff" .. color .. ADDON_NAME .. "|r: " .. tostring(msg))
      end
   end
end

--function Auctionite:Show(self)
--   self.frame:Show()
--   if debug and not self.frame.hidden then print("shown") end
--end

--function Auctionite:Hide(self)
--   self.frame:Hide()
--   if debug and self.frame.hidden then print("hidden") end
--end

function Auctionite:OnInitialize(self)
   -- load CLI commands & Saved Variables
   -- Load and persist
   AUCTIONITE_DB = AUCTIONITE_DB or {}
   AUCTIONITE_CFG = AUCTIONITE_CFG or {
      updateInterval = AUCTIONITE_CFG.updateInterval or 1.0,
      debug = AUCTIONITE_CFG.debug or false
   }

   -- Benevolently dictate our global Auctionite namespace

   Auctionite = {
      Frame = AuctioniteFrameMixin,                       -- AuctioniteFrame of course
      lastUpdate = AuctioniteFrameMixin.lastUpdate,       -- Variable pulled & polled by AuctioniteFrame_OnUpdate() via XML
      Events = {},                                        -- OnEvent(...) Events Handler
      -- Setup state via SavedVariables by reference - don't copy the values
      Db = AUCTIONITE_DB,
      updateInterval = AUCTIONITE_CFG.updateInterval,
      debug = AUCTIONITE_CFG.debug,
   }

   --- CLI ---
   SLASH_AUCTIONITE, SLASH_AUCTIONITE1 = "/auctionite", "/nite"
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
   --- CLI ---

   local function eventHandler(_, event, ...)
      if events[event] then events[event](self.frame, ...) end
   end

   self:SetScript("OnEvent", eventHandler)
   for k, _ in pairs(Auctionite.Events) do
      local ok = self:RegisterEvent(k)
      if Auctionite.debug then
         if ok then print(string.format("<RegisterEvent> %s - ok", k))
         else
            print(string.format("<RegisterEvent> %s - FAILURE", k))
         end
      end
   end

end


   --- EVENTS ---
   function AuctioniteFrameMixin:RegisterEvents(self)

   end
   --- EVENTS ---
end

function Auctionite:OnEnable()
   -- Do more initialization here, that really enables the use of your addon.
   -- Register Events, Hook functions, Create Frames, Get information from
   -- the game that wasn't available in OnInitialize
end

function Auctionite:OnDisable()
   -- Unhook, Unregister Events, Hide frames that you created.
   -- You would probably only use an OnDisable if you want to
   -- build a "standby" mode, or be able to toggle modules on/off.
end

---AuctioniteFrame OnLoad()
---@param self table AuctioniteFrame
function AuctioniteFrameMixin:OnLoad(self)
   CallbackRegistryMixin.OnLoad(self);

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



