;
; lepton-netlist backend: rmnc-dmn
; filter out nets with "noconnect" symbol (misc/nc-*) attached
;

( use-modules ( gnetlist schematic   ) )
( use-modules ( gnetlist package     ) )
( use-modules ( gnetlist package-pin ) )



( define ( get-connected-nets )
( let
    (
    ( graphicals   ( schematic-graphicals toplevel-schematic ) )
    ( all-nets     ( schematic-nets       toplevel-schematic ) )
    ( nc-packages '() ) ; "noconnect" symbols
    ( nc-nets     '() ) ; nets with "noconnect" symbol attached
    )

    ; local functions:

    ( define ( nc-attribute? attr-name )
        ; return:
        ( and attr-name (string-ci=? attr-name "nc") )
    )

    ( define ( nc-package? pkg )
        ; return:
        ( nc-attribute? (package-attribute pkg 'symbol) )
    )

    ( define ( net-connected? net-name )
        ; return:
        ( not ( member net-name nc-nets ) )
    )

    ; add net attached to a [pin] to [nc-nets] list:
    ;
    ( define ( add-pin-net-to-nc-nets pin )
        ( set! nc-nets ( cons (package-pin-name pin) nc-nets ) )
    )

    ; add all nets attached to a package [pkg] to [nc-nets] list:
    ;
    ( define ( add-package-nets-to-nc-nets pkg )
        ( for-each add-pin-net-to-nc-nets (package-pins pkg) )
    )


    ; main code:

    ; find all "noconnect" symbols (components with "symbol=nc" attribute):
    ;
    ( set! nc-packages ( filter nc-package? graphicals ) )

    ; collect all nets connected to that symbols to [nc-nets] list:
    ;
    ( for-each add-package-nets-to-nc-nets nc-packages )


    ; return:
    ( filter net-connected? all-nets ) ; filter out unconnected nets

) ; let
) ; get-connected-nets()



( define ( rmnc-dmn output-filename )
( let
    (
    ( all-nets       ( schematic-nets toplevel-schematic ) )
    ( connected-nets ( get-connected-nets ) )
    )

    ( format #t "all-nets:       ~{~a ~}~%" all-nets )
    ( format #t "connected-nets: ~{~a ~}~%" connected-nets )

) ; let
) ; rmnc-dmn()

