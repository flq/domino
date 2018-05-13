module Main exposing (..)

import Html exposing (Html, text, div, h1, img)
import Svg exposing (Svg, defs, use, symbol, svg, rect, line, circle)
import Svg.Attributes exposing (id, xlinkHref, viewBox, width, height, x, y, x1, y1, x2, y2, cx, cy, r, rx, ry, stroke, strokeWidth, fill)
import List exposing(head)
import Maybe exposing(withDefault)

import Models exposing (AppModel, initialModel, Tile, defaultTile, matchDobsToId)


init : ( AppModel, Cmd Msg )
init =
    ( initialModel, Cmd.none )



---- UPDATE ----


type Msg
    = NoOp


update : Msg -> AppModel -> ( AppModel, Cmd Msg )
update msg model =
    ( model, Cmd.none )



---- VIEW ----


view : AppModel -> Html Msg
view model =
    div [] [
        h1 [] [ text "Domino!" ],
        renderTile <| withDefault defaultTile <| head model.line
    ]

renderTile : Tile -> Svg Msg
renderTile { l, r } =
    svg [width "404", height "204"] [
        loadDefs,
        use [xlinkHref "#tile", x "0", y "0"] [],
        use [xlinkHref (matchDobsToId l), x "0", y "0"] [],
        use [xlinkHref (matchDobsToId r), x "200", y "0"] []
    ]

loadDefs : Svg Msg
loadDefs = 
    defs [] [
        symbol [id "tile"] [
            rect [ x "2", y "2", width "400", height "200", rx "15", ry "15", stroke "black", strokeWidth "2", fill "white" ] [],
            line [x1 "201", y1 "10", x2 "201", y2 "190", stroke "black", strokeWidth "2"] []
        ],
        symbol [id "zero"] [],
        symbol [id "one"] [
            circle [cx "100", cy "100", r "15"] []
        ],
        symbol [id "two"] [
            circle [cx "30", cy "30", r "15"] [],
            circle [cx "170", cy "170", r "15"] []
        ],
        symbol [id "three"] [
            circle [cx "30", cy "30", r "15"] [],
            circle [cx "100", cy "100", r "15"] [],
            circle [cx "170", cy "170", r "15"] []
        ],
        symbol [id "four"] [
            circle [cx "30", cy "30", r "15"] [],
            circle [cx "170", cy "30", r "15"] [],
            circle [cx "30", cy "170", r "15"] [],
            circle [cx "170", cy "170", r "15"] []
        ],
        symbol [id "five"] [
            circle [cx "30", cy "30", r "15"] [],
            circle [cx "170", cy "30", r "15"] [],
            circle [cx "100", cy "100", r "15"] [],
            circle [cx "30", cy "170", r "15"] [],
            circle [cx "170", cy "170", r "15"] []
        ],
        symbol [id "six"] [
            circle [cx "30", cy "30", r "15"] [],
            circle [cx "100", cy "30", r "15"] [],
            circle [cx "170", cy "30", r "15"] [],
            circle [cx "30", cy "170", r "15"] [],
            circle [cx "100", cy "170", r "15"] [],
            circle [cx "170", cy "170", r "15"] []
        ],
        symbol [id "seven"] [
            circle [cx "30", cy "30", r "15"] [],
            circle [cx "100", cy "30", r "15"] [],
            circle [cx "170", cy "30", r "15"] [],
            circle [cx "100", cy "100", r "15"] [],
            circle [cx "30", cy "170", r "15"] [],
            circle [cx "100", cy "170", r "15"] [],
            circle [cx "170", cy "170", r "15"] []
        ],
        symbol [id "eight"] [
            circle [cx "30", cy "30", r "15"] [],
            circle [cx "100", cy "30", r "15"] [],
            circle [cx "170", cy "30", r "15"] [],
            circle [cx "30", cy "100", r "15"] [],
            circle [cx "170", cy "100", r "15"] [],
            circle [cx "30", cy "170", r "15"] [],
            circle [cx "100", cy "170", r "15"] [],
            circle [cx "170", cy "170", r "15"] []
        ],
        symbol [id "nine"] [
            circle [cx "30", cy "30", r "15"] [],
            circle [cx "100", cy "30", r "15"] [],
            circle [cx "170", cy "30", r "15"] [],
            circle [cx "30", cy "100", r "15"] [],
            circle [cx "100", cy "100", r "15"] [],
            circle [cx "170", cy "100", r "15"] [],
            circle [cx "30", cy "170", r "15"] [],
            circle [cx "100", cy "170", r "15"] [],
            circle [cx "170", cy "170", r "15"] []
        ]

    ]

---- PROGRAM ----


main : Program Never AppModel Msg
main =
    Html.program
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }
