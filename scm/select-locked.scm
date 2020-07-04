; file: select-locked.scm
; type: lepton-schematic Guile script
; version: 1.3
; copyright (c) 2020 dmn <graahnul.grom@gmail.com>
; license: GPLv2+
;
; Extends lepton-schematic functionality by providing
; keyboard shortcuts to select locked objects.
;
; - Ctrl+Shift+L: select all locked components
; - Shift+L:      select next locked component
; - Ctrl+L:       select locked component under the mouse cursor
;
; Usage:
; Type in the ":" prompt or add this to your gschemrc file:
;   ( primitive-load "/path/to/select-locked.scm" )
;
; It's possible to use different keyboard shortcuts. Add the
; following to the gschemrc file and modify key definitions:
;
; ( global-set-key "<Control><Shift>L" 'select-locked-all )
; ( global-set-key "<Shift>L"          'select-locked-next )
; ( global-set-key "<Control>L"        'select-locked-under-mouse )
;

; Replace "#t" with "#f" to get less verbose log messages:
;
( define verbose #t )



; no user serviceable parts below:

( use-modules ( srfi srfi-1 ) ) ; find()
( use-modules ( lepton page ) )
( use-modules ( lepton object ) )
( use-modules ( lepton attrib ) )
( use-modules ( lepton log ) )
( use-modules ( lepton config ) )
( use-modules ( schematic window ) )
( use-modules ( schematic selection ) )
( use-modules ( schematic gui keymap ) )



; private:
;
( define ( locked-comps )

  ( define ( locked-comp? obj )
    ( and
      ( component? obj )
      ( not (object-selectable? obj) )
    )
  )


  ; return:
  ( filter locked-comp? (page-contents (active-page)) )

) ; locked-comps()



; private:
;
( define ( deselect-all )
  ( for-each deselect-object! (page-contents (active-page)) )
)



; private:
;
( define ( select-comp comp )
  ( select-object! comp )
  ( for-each select-object! (object-attribs comp) )
)




; public:
;
( define ( select-locked-all )
( let
  (
  ( comps ( locked-comps ) )
  )

  ( unless ( null? comps )
    ( deselect-all )
    ( for-each select-comp comps )
  )

  ( if ( null? comps )
    ( log! ; if
      'message
      "select-locked: no locked components found"
    )
    ( log! ; else
      'message
      "select-locked: ~a locked component(s) selected~a"
      ( length comps )
      ( if verbose ". press <E Shift+L> to unlock" "" )
    )
  )


) ; let
) ; select-locked-all()




; public:
;
( define ( select-locked-next )
( let*
  (
  ( comps ( locked-comps ) )
  ( len   ( length comps ) )
  ( sel   ( page-selection (active-page) ) )
  ( ndx   0 )
  ( comp #f )
  )

  ; helper functions:

  ( define ( print-msg i c ) ; i: index, c: component
    ( log! 'message
      "select-locked: ~a of ~a (~a)~a"
      ( 1+ i )
      len
      ( component-basename c )
      ( if verbose
        ". press <E E> to edit, <E Shift+L> to unlock" ; if
        ""                                             ; else
      )
    )
  )


  ( define ( next-ndx i )
    ; return:
    ( if ( = i (1- len) )
      0        ; if
      ( 1+ i ) ; else
    )
  )

  ( define ( locked-obj? obj )
    ; return:
    ( not (object-selectable? obj) )
  )


  ( define ( go? c )
    ; return:
    ( or
      ( null? sel )                  ; nothing selected
      ( not (find locked-obj? sel) ) ; no locked comps selected
      ( object-selected? c )         ; locked comp c selected
    )
  )

  ; function's body:

  ( when ( null? comps )
    ( log! 'message "select-locked: no locked components found" )
  )

  ( while ( < ndx len )
    ( set! comp ( list-ref comps ndx ) )

    ( when ( go? comp )
      ( deselect-all )
      ( set! comp (list-ref comps (next-ndx ndx) ) )
      ( select-comp comp )
      ( print-msg ndx comp )
      ( break )
    )

    ( set! ndx (1+ ndx) )
  )

) ; let
) ; select-locked-next()




; private:
; see liblepton/src/geda_component_object.c:
;     create_placeholder_small()
;
( define ( placeholder-bounds-small c )
( let*
  (
  ( pt ( component-position c ) )
  ( x ( car pt ) )
  ( y ( cdr pt ) )
  ( bounds1 ( cons (cons x (+ y 50)) (cons (+ x 50) y) ) )
  ( str ( component-basename c ) )
  ( txt
    ( make-text
      (cons (+ x 100) (+ y 100)) 'lower-left 0 str 6 #t 'both ) )
  ( bounds2 ( object-bounds txt ) )
  )

  ; return:
  ( fold-bounds bounds1 bounds2 )

) ; let
) ; placeholder-bounds-small()


; private:
; see liblepton/src/geda_component_object.c:
;     create_placeholder_classic()
;
( define ( placeholder-bounds-big c )
( let*
  (
  ( pt ( component-position c ) )
  ( x ( car pt ) )
  ( y ( cdr pt ) )
  ( bounds1 ( cons (cons x (+ y 100)) (cons (+ x 100) y) ) )
  ( str
    ( format #f "Component not found:\n~a" (component-basename c) ) )
  ( txt
    ( make-text
      (cons (+ x 100) (+ y 100)) 'lower-left 0 str 8 #t 'both ) )
  ( bounds2 ( object-bounds txt ) )
  ( b2-top-left  ( car bounds2 ) )
  ( b2-bot-right ( cdr bounds2 ) )
  ( x1 ( car b2-top-left ) )
  ( x2 ( car b2-bot-right ) )
  ( dx ( / (- x2 x1) 4 ) )
  ( y1 ( cdr b2-top-left ) )
  ( dy 100 )
  ( triangle-top-left  ( cons (+ x1 dx) (+ y1 dy 500) ) )
  ( triangle-bot-right ( cons (+ x1 dx 600) (+ y1 dy) ) )
  ( bounds3 ( cons triangle-top-left triangle-bot-right ) )
  )

  ; [debug]:
  ; ( page-append! (active-page)
    ; ( make-box (car bounds1) (cdr bounds1) ) )
  ; ( page-append! (active-page)
    ; ( make-box (car bounds2) (cdr bounds2) ) )
  ; ( page-append! (active-page)
    ; ( make-box (car bounds3) (cdr bounds3) ) )
  ; ( bb ( fold-bounds bounds1 bounds2 bounds3 ) )
  ; ( page-append! (active-page) (make-box (car bb) (cdr bb)) )

  ; return:
  ( fold-bounds bounds1 bounds2 bounds3 )

) ; let
) ; placeholder-bounds-big()


; private:
;
( define ( placeholder-bounds c )
( let*
  (
  ( cfg ( path-config-context (getcwd) ) )
  ( small #t )
  )

  ( catch #t
    ( lambda()
      ( set! small
        ( config-boolean cfg "schematic.gui" "small-placeholders" )
      )
    )
    ( lambda( ex . args )
      ( log! 'message
        "select-locked: assuming small placeholders used" )
    )
  )

  ; return:
  ( if small
    ( placeholder-bounds-small c ) ; if
    ( placeholder-bounds-big c )   ; else
  )

) ; let
) ; placeholder-bounds()




; public:
;
( define ( select-locked-under-mouse )

  ; helper functions:

  ( define ( point-in-bounds? pt bounds )
  ( let*
    (
    ( top-left  ( car bounds ) )
    ( bot-right ( cdr bounds ) )
    ( x1  ( car top-left ) )
    ( x2  ( car bot-right ) )
    ( y1  ( cdr bot-right ) )
    ( y2  ( cdr top-left ) )
    ( ptx ( car pt ) )
    ( pty ( cdr pt ) )
    )

    ; return:
    ( and
      ( >= ptx x1 ) ( <= ptx x2 )
      ( >= pty y1 ) ( <= pty y2 )
    )

  ) ; let
  ) ; point-in-bounds?()


  ( define ( comp-contents c ) ; {pre}: [c] is not a placeholder
    ( define ( non-txt-obj? o )
        ( not (text? o) )
    )
  ( let*
    (
    ( cc ( component-contents c ) )
    ( oo ( filter non-txt-obj? cc ) )
    )

    ; return:
    ( if ( null? oo )
      cc ; if
      oo ; else
    )

  ) ; let
  ) ; comp-contents()


  ( define ( placeholder? c )
    ( null? (component-contents c) )
  )


  ( define ( comp-bounds c )
    ; return:
    ( if ( placeholder? c )
      ( placeholder-bounds c ) ; if
      ( apply fold-bounds      ; else
        ( map object-bounds (comp-contents c) ) )
    )
  )


  ( define ( comp-area c )
  ( let*
    (
    ( bounds    ( comp-bounds c ) )
    ( top-left  ( car bounds ) )
    ( bot-right ( cdr bounds ) )
    ( x1 ( car top-left ) )
    ( x2 ( car bot-right ) )
    ( y1 ( cdr bot-right ) )
    ( y2 ( cdr top-left ) )
    )

    ; return:
    ( * (- x2 x1) (- y2 y1) )

  ) ; let
  ) ; comp-area()


  ( define ( less-area? c1 c2 )
    ( < (comp-area c1) (comp-area c2) )
  )


  ( define ( comp-under-mouse? c )
    ; return:
    ( if ( and (pointer-position) (comp-bounds c) )
      ( point-in-bounds? (pointer-position) (comp-bounds c) ) ; if
      #f                                                      ; else
    )
  )


  ; function's body:

( let*
  (
  ;
  ; - sort => the smallest will be found first, and not e.g. title
  ;
  ( comps ( sort (locked-comps) less-area? ) )
  ( comp  ( find comp-under-mouse? comps ) )
  )

  ( deselect-all )

  ( if comp
    ( select-comp comp ) ; if
    ( log! 'message      ; else
      "select-locked: no locked components under mouse" )
  )

) ; let
) ; select-locked-under-mouse()




; top-level code:
;
( global-set-key "<Control><Shift>L" 'select-locked-all )
( global-set-key "<Shift>L"          'select-locked-next )
( global-set-key "<Control>L"        'select-locked-under-mouse )


; vim: ft=scheme tabstop=2 softtabstop=2 shiftwidth=2 expandtab

