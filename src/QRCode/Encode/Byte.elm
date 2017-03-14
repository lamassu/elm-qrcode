module QRCode.Encode.Byte exposing
    ( regex
    , encode
    )


import Char
import Regex exposing (Regex)
import QRCode.Error exposing (Error(..))



regex : Regex
regex =
    Regex.regex "^[\\u0000-\\u00ff]+$"


encode : String -> Result Error (List ( Int, Int ))
encode str =
    encodeHelp str []
        |> Result.map (List.map (flip (,) 8))


encodeHelp : String -> List Int -> Result Error (List Int)
encodeHelp str bytes =
    case String.uncons str of
        Just ( char, strTail ) ->
            Char.toCode char
                |> flip (::) bytes
                |> encodeHelp strTail

        Nothing ->
            List.reverse bytes
                |> Result.Ok
