; file: cstst.scm
; type: lepton-schematic Guile script
; copyright (c) 2021 dmn <graahnul.grom@gmail.com>
; license: GPLv2+
;
; Creates a set of boxes at the mouse pointer position.
; The number of boxes is equal to the number of colors
; available in lepton-schematic.
; Next to each box there's a text designating the
; color number, name and hex value.
; Both the box and the text are painted using that color.
; The text is repeated using the "attribute" color.
;
; Usage:
; Ensure that the mouse pointer is within the drawing area,
; and type in the ":" prompt:
;   ( primitive-load "/path/to/cstst.scm" )

( use-modules ( srfi srfi-1 ) )
( use-modules ( lepton color-map ) )
( use-modules ( lepton object ) )
( use-modules ( lepton page ) )
( use-modules ( schematic window ) )
( use-modules ( schematic undo ) )


; private:
; function: mk-color-boxes()
;
( define ( mk-color-boxes cmap pt )
( let
    (
    ( color_nam 0 )
    ( color_ndx 0 )
    ( color_hex 0 )
    ( x ( car pt ) )
    ( y ( cdr pt ) )
    ( box1 #f )
    ( box2 #f )
    ( txt1 #f )
    ( txt2 #f )
    ( color_ndx_attr ( color-map-name-to-index 'attribute ) )
    )

    ( for-each
    ( lambda( entry )
        ( set! color_nam ( first  entry ) )
        ( set! color_hex ( second entry ) ) ; NOTE: cdr() => "(#xxyyzz)"
        ( set! color_ndx ( color-map-name-to-index color_nam ) )

        ( set! box1 ( make-box (cons x y) (cons (+ x 600) (- y 500)) color_ndx ) )
        ( set-object-fill! box1 'solid )

        ( set! box2 ( make-box (cons x y) (cons (+ x 600) (- y 500)) color_ndx_attr ) )

        ( set! txt1
            ( make-text
                ( cons (+ x 700) ( - y 100 ) )
                'middle-left
                0
                ( format #f "~a=~d: ~a = ~a" color_nam color_ndx color_nam color_hex )
                10
                #t
                'value
                color_ndx_attr
            )
        )

        ( set! txt2
            ( make-text
                ( cons (+ x 700) (- y 400) )
                'middle-left
                0
                ( format #f "~a=~d: ~a = ~a" color_nam color_ndx color_nam color_hex )
                10
                #t
                'value
                color_ndx
            )
        )

        ( page-append! (active-page) box1 )
        ( page-append! (active-page) box2 )
        ( page-append! (active-page) txt1 )
        ( page-append! (active-page) txt2 )

        ( set! y ( - y 700 ) )

    ) ; lambda()

      cmap ; walk through [cmap] list

    ) ; for-each

) ; let
) ; mk-color-boxes()



; public:
; function: cstst-mk(): create color boxes
;
( define ( cstst-mk )
    ( when ( pointer-position )
        ( undo-save-state )
        ( mk-color-boxes
            ( display-color-map )
            ( snap-point (pointer-position) )
        )
    )
)



; public:
; function: cstst-up(): update color values
;
( define ( cstst-up )
( let*
    (
    ( page ( active-page ) )
    ( cont ( page-contents page ) )
    ( attrs ( filter attribute? cont ) )
    ( cmap ( display-color-map ) )
    ( sym #f )
    ( txt #f )
    )

    ( define ( color-valid? sym )
        ( assoc-ref cmap sym )
    )

    ( define ( color-val sym )
        ( list-ref (assoc-ref cmap sym) 0 )
    )

    ( define ( color-sym cname )
        ( eval-string (format #f "'~a" cname) )
    )

    ( define ( color-ndx sym )
        ( color-map-name-to-index sym )
    )

    ( define ( mk-str name ndx val )
        ( format #f "~a=~d: ~a = ~a" name ndx name val )
    )


    ( for-each
    ( lambda ( attr )
        ( set! sym ( color-sym (attrib-name attr) ) )
        ( when ( and (color-valid? sym) (not (attrib-attachment attr)) )
            ; ( format #t "[~a]~%" ( mk-str sym (color-ndx sym) (color-val sym) ) )
            ( set! txt ( mk-str sym (color-ndx sym) (color-val sym) ) )
            ( set-text-string! attr txt )
        )
    )
      attrs
    )

) ; let
) ; cstst-up()

