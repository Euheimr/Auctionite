local ADDON_NAME, Auctionite = ...
local events = Auctionite.Events
local frame = Auctionite.Frame
local tabs = {
    "Shop",
    "Sell",
    "WoW Token",
}

--- AuctioniteFrame Tab Functionality ---
local LibAHTab = LibStub:GetLibrary("LibAHTab-1.0")
assert(LibAHTab, "Could not load LibAHTab")


AuctioniteFrameDialogs = {
    "BuyDialog",
}

AuctioniteFramePopups = {
    "BID_AUCTION",
    "BUYOUT_AUCTION",
    "CANCEL_AUCTION",
    "TOKEN_AUCTIONABLE_TOKEN_OWNED",
    "TOKEN_NONE_FOR_SALE",
}

function events:ADDON_LOADED(...)
    print(ADDON_NAME .. " v"
            ---@diagnostic disable-next-line: undefined-global
            .. C_Addons:GetAddonMetadata(ADDON_NAME, "Version")
            .. " LOADED")
end

function events:PLAYER_INTERACTION_MANAGER_FRAME_SHOW(_, _, panelType)
    -- if panelType == Enum.PlayerInteractionType.Auctioneer then end
    -- todo: hook into other vendor types to update tooltips price
end

function events:AUCTION_HOUSE_SHOW(...)
    for _, name in pairs(tabs) do
        LibAHTab:CreateTab(name, frame, name, "header")
    end

    frame:SetScript("OnShow", function()
        -- do something when the tab is selected
        LibAHTab:SetSelected(0)
    end)

    -- Auctionite:Show();
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