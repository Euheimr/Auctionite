# Auctionite
> _An Auction House Addon for the Modern Auctioneer_

**Auctionite** replaces & redesigns the World of Warcraft Auction House frame to:
1. be visually intuitive & reactive
2. be more accurate & consistent with price data (high-highs and low-lows)
3. expedite frequent purchases
4. expedite Auctions posting
5. [WIP] run statistics on pricing data
6. [WIP] show charts for pricing data

[img/auctionite.gif]

Inspired by **Auctionator** (by `plusmouse`) & **Attune** (by `CixiDelmont`).

---

## About

`Auctionator` inspired me to go out on my own and make this project. Thank you **plusmouse and contributors** of `Auctionator`!

My most straight forward motivation is: there are no real reasonable alternatives to be the Auctioneer in WoW in the way I wish.

My wishes: more ergonomic UI (search history and item-icon-focused), pricing statistics (with ceiling and floor normalization), ASCII data charts, price sync with friends and guild members, and handle imports from other AH addons.


## Development

Only _my GPUs_ & espresso machine were harmed in the making of Auctionite, a **MIT Licensed** project.

To be clear: I'm not against LLMs! _All I ask is pretty please DON'T feed this project to any AI agents!_

**Just kindly take a peek inside the project** and if you find it or pieces useful to you, then I'm _geniunely_ grateful! Do what you want with it!

**LLMs will never be used for this project**; not out of principle - rather its due to practicality, maintenance and the sake of experience learning Addon creation.
In other words - implementating more advanced features will be harder to implement if the foundation is misunderstood or wrong.


### Dev Notes (WoW Addon nuances)

Would like to know more? Here's a few key definitions in the `WoW Addon` context that i wish someone told me:

- `XML` details UI elements (initial placement, size, etc)
- `Lua` defines behavior using `Mixin`s hooked to said `XML` elements
- GlobalStrings -> https://wago.tools/db2/GlobalStrings
- [ketho/BlizzardInterfaceResources](https://github.com/Ketho/BlizzardInterfaceResources)

#### TODO

- Game Version Support
    - [x] Forever     (PRIORITY)
    - [x] Mainline    (PRIORITY)
    - [ ] Vanilla     (PLANNED)
    - [ ] TBC         (PLANNED)
    - [ ] Wrath       (LOW PRIO)
    - [ ] Cataclysm   (LOW PRIO)
    - [ ] Mists       (LOW PRIO)


- External Libraries
  - `LibStub` (Public Domain) by: Kaelten, Cladhaire, ckknight, Mikk, Ammo, Nevcairiel, joshborke
  - `LibAHTab` (MIT) by: plusmouse
    - tab frames made easier
  - `Taintless.xml` by: townlong-yak (Only: vanilla, tbc, wrath)


- API Features
    - [x] Namespace `Auctionite`
    - [x] Call order `Auctionite.toc` -> `Auctionite.xml` (Base Frames) -> `Auctionite.lua` -> `AuctioniteFrameMixin:OnLoad(...)`
    - [x] Root Frame `Auctionite.Frame` <- `AuctioniteFrameMixin`
    - [x] `Auctionite.Events` - Registered Blizzard UI Events to be processed
    - [ ] `Auctionite.Queue` - Event Queue to handle **Auctionite-specific events**
    - [ ] `Auctionite.Config` - Config Menu Integration
    - [x] `AUCTIONITE_DB`
        - [ ] Scan `AuctionData` 
        - [ ] `UpdateDb(...)`
        - [ ] Auctionite P2P Sync
        - Import/Export -> `AUCTIONITE_DB`
            - [ ] Database <- Auctionator
            - [ ] Database <- Auctioneer
    - [x] `AuctioniteFrame.Tabs` <- `libs/LibAHTab` library by **plusmouse**
        - [ ] `SearchTab`
            - [ ] Filter
            - [ ] History
            - [ ] Lists(...)
            - [x] BuyItem(...)
            - [x] BuyToken(...)
        - [x] `SellTab`
            - [x] SellItem(...)
            - [x] SellToken(...)
        - [ ] `AuctionsTab` - user-posted auctions
            - [ ] Cancel Auction
        - [ ] `RecordsTab` - Time, Expired/Sold
            - [ ] Deposits - Paid, Total Deposit Amount
            - [ ] Statistics
        - [ ] `CreditsTab` - devs & localizers


#### References

- WoW Addon Dev Frontpage: https://addonstudio.org/wiki/WoW:AddOn
- WoW API: https://addonstudio.org/wiki/WoW:World_of_Warcraft_API
- WoW Lua API, Standard Functions: https://addonstudio.org/wiki/WoW:Lua_functions
- WoW Lua API, Global Functions: https://addonstudio.org/wiki/WoW:Global_functions
- WoW XML: https://addonstudio.org/wiki/WoW:XML_UI
- WoW TOC: https://addonstudio.org/wiki/WoW:TOC_format
- WoW Lua Snippets: https://addonstudio.org/wiki/WoW:User_defined_functions
-