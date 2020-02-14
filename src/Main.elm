module Main exposing (..)

import Bootstrap.CDN as CDN
import Bootstrap.Grid as Grid
import Bootstrap.Button as Button
import Bootstrap.Navbar as Navbar

-- Press buttons to increment and decrement a counter.
--
-- Read how it works:
--   https://guide.elm-lang.org/architecture/buttons.html
--


import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)



-- MAIN


main =
  Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model = Int


init : Model
init =
  0



-- UPDATE


type Msg
  = Increment
  | Decrement


update : Msg -> Model -> Model
update msg model =
  case msg of
    Increment ->
      model + 1

    Decrement ->
      model - 1



-- VIEW


view : Model -> Html Msg
view model =
  Grid.container []
  [ CDN.stylesheet
  , Grid.row []
    [ Grid.col []
      [ div []
        [ Button.button [ Button.primary, Button.attrs [onClick Decrement] ] [ text "-" ]
        , div [] [ text (String.fromInt model) ]
        , Button.button [ Button.primary, Button.attrs [onClick Increment] ] [ text "+" ]
        ]
      ]
    ]
  ]
  