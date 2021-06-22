; file: gnet-dbg-dmn.scm
; copyright (c) 2020 dmn <graahnul.grom@gmail.com>
; license: GPLv2+
;
; lepton-netlist backend for netlister testing
;
; - use as is: 'lepton-netlist -g dbg-dmn'
; - call individual funcs from this file:
;   ( primitive-load-path "gnet-dbg-dmn.scm" )
;

( use-modules ( netlist schematic ) )
( use-modules ( netlist schematic toplevel ) )
( use-modules ( netlist package ) )
( use-modules ( netlist schematic-component ) )
( use-modules ( netlist package-pin ) )
; ( use-modules ( netlist ) )

;
; NOTE: vim: hit ff on file name:
;   netlist.scm
;   package.scm
;   package-pin.scm
;

( define ( dbg-dmn output-filename ) ; backend entry point
    ( format #t " >> gnet-dbg-dmn():~%" )
    ; ( dbg-args )
    ( dbg-pkgs )
    ; ( dbg-attrs )
    ; ( dbg-nets )
    ( dbg-pins )
)

( define ( request-netlist-mode ) ; called by netlister to set op mode
    ; return:
    ; 'geda
    'spice
)



( define ( dbg-args )
    ( format #t " >> dbg-args():~%" )
    ( format #t "program-arguments():~%" )
    ( format #t "~{  ~a~%~}~%" (program-arguments) )
)



( define ( dbg-pkgs )
( let*
    (
    ( TS    ( toplevel-schematic ) )
    ( pkgs  ( schematic-packages      TS ) ) ; => objects
    ( names ( schematic-package-names TS ) ) ; => refdes strings
    )

    ( format #t " >> dbg-pkgs():~%" )
    ( format #t "toplevel-schematic():       [~a]~%" TS )
    ( format #t "schematic-package-names(): ~{ ~a~}~%" names )

    ( format #t "~%" )

) ; let
) ; dbg-pkgs()



( define ( dbg-attrs )
( let*
    (
    ( TS   ( toplevel-schematic ) )
    ( pkgs ( schematic-packages TS ) )
    ; ( attrs ( package-attributes <pkg obj> 'source ) ) ; multi "source" attrs
    )

    ( define ( pa p a )
        ( package-attribute p a )
    )

    ( define ( pr p )
        ( package-refdes p )
    )

    ( define ( is_A p )
        ( string-prefix? "A" (pr p) )
    )


    ( format #t " >> dbg-attrs():~%" )
    ( for-each
    ( lambda( p )
        ( format #t "package-refdes():             [~a]~%" (pr p) )

        ( format #t "package-attribute( 'device ): [~a]~%" (pa p 'device) )
        ( format #t "package-attribute( 'file ):   [~a]~%" (pa p 'file) )
        ( format #t "package-attribute( 'author ): [~a]~%" (pa p 'author) )
    )
    ( filter is_A pkgs )
    )

    ( format #t "~%" )

) ; let
) ; dbg-attrs()



( define ( dbg-nets )
( let*
    (
    ( TS   ( toplevel-schematic ) )
    ( nets ( schematic-nets TS ) )
    )

    ( format #t " >> dbg-nets():~%" )
    ( format #t "schematic-nets(): ~{ ~a~}~%" nets )

    ( format #t "~%" )

) ; let
) ; dbg-nets()



( define ( dbg-pins )
( let*
    (
    ( TS    ( toplevel-schematic ) )
    ( comps ( schematic-components TS ) )
    ( rd #f )
    )

    ( define ( with_refdes c )
        ( schematic-component-refdes c )
    )

    ( define ( with_pins c )
        ( not ( null? (schematic-component-pins c) ) )
    )

    ( define ( not_gra c )
        ( not (schematic-component-graphical? c) )
    )

    ( define ( not_nc c )
        ( not (schematic-component-nc? c) )
    )

    ( define ( comp_ok c )
        ( and
            ( with_refdes c )
            ( with_pins c )
            ( not_gra c )
            ( not_nc c )
        )
    )

    ( define ( pins_sort_by_pinseq pp ) ; pp: <package-pin> objs
        ( define ( pin_pinseq_less p1 p2 )
            ( <
                ( string->number (assoc-ref (package-pin-attribs p1) 'pinseq) )
                ( string->number (assoc-ref (package-pin-attribs p2) 'pinseq) )
            )
        )
        ; return:
        ( sort pp pin_pinseq_less )
    )

    ( define ( dbg_print_pins pp )
        ( for-each
        ( lambda( p )
            ( format #t "  pin: [~a]~%" p )
            ( format #t
                "    lab: [~a]~%    seq: [~a]~%    num: [~a]~%"
                (assoc-ref (package-pin-attribs p) 'pinlabel)
                (assoc-ref (package-pin-attribs p) 'pinseq)
                (assoc-ref (package-pin-attribs p) 'pinnumber) )
            ( format #t "    net: [~a] // <= package-pin-name( pinobj )~%"
                (package-pin-name p) )
        )
        pp
        )
    ) ; dbg_print_pins()


    ;
    ; TODO: discover:
    ;   - <schematic-component>::net-maps
    ;   - <package-pin>::<named-connection>
    ;

    ( format #t " >> dbg-pins():~%" )
    ( for-each
    ( lambda( c )
        ( set! rd ( schematic-component-refdes c ) )
        ( format #t "schematic-component-refdes(): [~a]~%" rd )
        ; ( dbg_print_pins (schematic-component-pins c) )
        ( dbg_print_pins ( pins_sort_by_pinseq (schematic-component-pins c) ) )
    )
    ( filter comp_ok comps )
    ; ( filter schematic-component-refdes comps )
    ; comps
    )

    ( format #t "~%" )

) ; let
) ; dbg-pins()

