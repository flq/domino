module Models exposing (..)

type Dobs
    = Zero
    | One
    | Two
    | Three
    | Four
    | Five
    | Six
    | Seven
    | Eight
    | Nine

matchDobsToId : Dobs -> String
matchDobsToId dobs =
    case dobs of
        Zero -> "#zero"
        One -> "#one"
        Two -> "#two"
        Three -> "#three"
        Four -> "#four"
        Five -> "#five"
        Six -> "#six"
        Seven -> "#seven"
        Eight -> "#eight"
        Nine -> "#nine"

type alias Tile = 
    {
        l: Dobs,
        r: Dobs
    }

allTiles: List Tile
allTiles =
    [
        { l = Zero, r = Zero }
    ]

defaultTile: Tile
defaultTile = { l = Seven, r = Five }

type alias AppModel = 
    {
        player1Tiles: List Tile,
        player2Tiles: List Tile,
        line: List Tile
    }

initialModel : AppModel
initialModel =
    {
        player1Tiles = [],
        player2Tiles = [],
        line = []
    }