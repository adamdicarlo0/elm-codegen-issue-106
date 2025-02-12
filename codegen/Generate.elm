module Generate exposing (main)

{-| -}

import Elm
import Elm.Annotation as Type
import Gen.CodeGen.Generate as Generate
import Gen.Dict


main : Program {} () ()
main =
    Generate.run
        [ fileMissingImport
        , fileWithWorkaround
        ]


fileMissingImport : Elm.File
fileMissingImport =
    Elm.file [ "MissingImport" ]
        [ Elm.alias "SomeDict" (Type.dict Type.string Type.int)
        ]


fileWithWorkaround : Elm.File
fileWithWorkaround =
    Elm.file [ "Workaround" ]
        [ Elm.alias "SomeDict" (Gen.Dict.annotation_.dict Type.string Type.int)
        ]
