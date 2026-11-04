# Auctionite

> **An Auction House Addon for the Modern Auctioneer** on __Classic__ (Project Camelot), __Vanilla__ & __TBC__


Inspired by `Auctionator` (by `plusmouse`), & `Attune` (by `CixiDelmont`).

**Auctionite** redesigns the Auction House frame & synchronizes prices with your friends and guild who also have Auctionite.

## __Features__

> `/nite` to show __Auctionite__

[Images/auctionite.gif]

- *Better Filter Searching* - Filter for items in ways no other AH addon currently
- *Faster Repeat-buying* - Search History can be saved to a Shopping List
- *Premade Shopping Lists* - by Profession & Class
- *Record Book* - AH Postings & Money earned/spent are recorded


## TODO

- Game Version Support
    - [x] Forever     (PRIORITY)
    - [x] Mainline    (PLANNED)
    - [-] Vanilla     (PLANNED)
    - [-] TBC         (PLANNED)
    - [-] Wrath       (LOW PRIO)
    - [-] Cataclysm   (LOW PRIO)
    - [-] Mists       (LOW PRIO)
- Features
    - [x] AuctioniteFrame
    - [x] AuctioniteFrame.Tabs
      - [ ] Scan
      - [ ] Search
          - [ ] History (BUTTON?)
          - [ ] List
      - [x] Buy
          - [x] BuyItem
          - [ ] BuyToken
      - [x] Sell
          - [x] SellItem
          - [ ] SellToken
      - [ ] Records
          - [ ] Posting - Time, Expired/Sold
          - [ ] Deposits - Paid, Total Deposit Amount
          - [ ] Statistics
      - [x] Config
          - [ ] Addons Config Menu Integration
          - [ ] Import/Export
              - [ ] Auctionite (this addon)
              - [ ] Auctionator
              - [ ] Auctioneer
          - [ ] P2P Sync - Friends that have Auctionite may broadcast price updates
      - [ ] Credits - devs & localizers

## Development

### Why

Simple answer is: there are no real reasonable alternatives control and view the Action House in the way I wish, and want a better Auctioning experience that exceeds the abilities of `Auctionator`.

Also, special thank you to plusmouse for `Auctionator`! It's great; been using it for several years. 
`Auctionator` inspired me to go out on my own and make this project. Thank you!



### Dev Notes (WoW Addon nuances)

Would like to know more? Here's a few key definitions in the `WoW Addon` context that i wish someone told me:

- `XML` details UI elements (placement)
- `Lua` defines behavior (using `Mixin`s tied to said `XML` elements)


#### References

- WoW Addon Dev Frontpage: https://addonstudio.org/wiki/WoW:AddOn
- WoW API: https://addonstudio.org/wiki/WoW:World_of_Warcraft_API
- WoW Lua API, Standard Functions: https://addonstudio.org/wiki/WoW:Lua_functions
- WoW Lua API, Global Functions: https://addonstudio.org/wiki/WoW:Global_functions
- WoW XML: https://addonstudio.org/wiki/WoW:XML_UI
- WoW TOC: https://addonstudio.org/wiki/WoW:TOC_format
- WoW Lua Snippets: https://addonstudio.org/wiki/WoW:User_defined_functions
-