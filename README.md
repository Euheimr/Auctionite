# Auctionite
> _An Auction House Addon for the Modern Auctioneer_

Inspired by **Auctionator** (by `plusmouse`) & **Attune** (by `CixiDelmont`).

## __Features__

**Auctionite** redesigns the Auction House frame & synchronizes prices with your friends and guild who also have **Auctionite**.

> `/auctionite` or `/nite` to show __Auctionite__

[Images/auctionite.gif]

- *Better Filter Searching* - Filter for items in ways no other AH addon currently
- *Faster Repeat-buying* - Search History can be saved to a Shopping List
- *Premade Shopping Lists* - by Profession & Class
- *Record Book* - AH Postings & Money earned/spent are recorded

## Development

### Why

Simple answer is: there are no real reasonable alternatives control and view the Action House in the way I wish, and want a better Auctioning experience that exceeds the abilities of `Auctionator`.

Also, special thank you to **plusmouse** for `Auctionator`! It's great; been using it for several years. 
`Auctionator` inspired me to go out on my own and make this project. Thank you!



### Dev Notes (WoW Addon nuances)

Would like to know more? Here's a few key definitions in the `WoW Addon` context that i wish someone told me:

- `XML` details UI elements (placement)
- `Lua` defines behavior (using `Mixin`s tied to said `XML` elements)


### TODO

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