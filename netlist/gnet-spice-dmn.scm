; file: gnet-spice-dmn.scm
; copyright (c) 2019 dmn <graahnul.grom@gmail.com>
; license: GPLv2+
;
; simple SPICE lepton-netlist backend
; usage: lepton-netlist -o - -f gnet-spice-dmn.scm some_schematic.sch
;

( use-modules ( netlist schematic ) )
( use-modules ( netlist schematic toplevel ) )
( use-modules ( netlist package ) )


( define ( nets_in_pinseq_order refdes pins_nets )
( let
    (
    ( len     (length pins_nets) )
    ( pinseq  1   )
    ( pinnum  #f  )
    ( netname #f  )
    ( res     '() )
    )

    ( while ( <= pinseq len )

        ( set! pinnum
            ( gnetlist:get-attribute-by-pinseq
                refdes
                ( number->string pinseq )
                "pinnumber"
            )
        )

        ( set! netname ( package-pin-netname refdes pinnum ) )
        ( set! res ( append res (list netname) ) )

        ( set! pinseq ( 1+ pinseq ) )

    ) ; while

    ; return:
    res

) ; let
) ; nets_in_pinseq_order()


( define ( spice-dmn output-filename ) ; backend's entry point
( let
    (
    ( pkgs ( schematic-package-names (toplevel-schematic) ) ) ; list of refdes's
    ( nets ( schematic-nets          (toplevel-schematic) ) )
    ( pinnum    #f )
    ( netnames  #f )
    ( attr      #f )
    ( pins_nets '() )
    )

    ( format #t "* spice-dmn lepton-netlist backend:~%" )
    ( format #t "*~%" )

    ( for-each
    ( lambda( refdes )

        ( set! pins_nets ( get-pins-nets refdes ) )

        ( if ( > (length pins_nets) 0 ) ; pkg has pins
        ( begin

            ( set! netnames ( nets_in_pinseq_order refdes pins_nets ) )
            ( set! attr (gnetlist:get-package-attribute refdes "value") )

            ( format #t "~a~{~,15t~a~}~,15t~a" refdes netnames attr )
            ( format #t "~%" )

        )
        ) ; if

    )
    pkgs
    )

    ( format #t ".end~%" )

) ; let
) ; spice-dmn()

