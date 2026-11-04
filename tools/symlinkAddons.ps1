$ADDON_NAME="Auctionite"
$WOW_DIR="E:\Battle.net\World of Warcraft"
$GAME_VER="_forever_"

$AuctioniteDir = Split-Path -Path $PSScriptRoot -Parent
cd "$AuctioniteDir"

function linkToAddonsFolder {
    param(
        [String]$GAME_VER
    )
    $DEST_DIR = "$WOW_DIR\$GAME_VER\Interface\AddOns\$ADDON_NAME"
    Write-Output ""
    Write-Output "  Creating Hard SymbolicLink !"
    Write-Output "    from '$AuctioniteDir' to => '$DEST_DIR'"
    Write-Output ""

    New-Item -ItemType SymbolicLink -Path "$DEST_DIR" -Target "$AuctioniteDir"
}

# todo: check if exists
# todo: check if privileged
# todo: loop over GAME_VER
linkToAddonsFolder($GAME_VER)




