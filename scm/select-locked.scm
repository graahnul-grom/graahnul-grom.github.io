; file: select-locked.scm
; type: lepton-schematic Guile script
; version: 1.2
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
( define select-locked:verbose #t )



; no user serviceable parts below:

( use-modules ( srfi srfi-1 ) ) ; find()
( use-modules ( lepton page ) )
( use-modules ( lepton object ) )
( use-modules ( lepton attrib ) )
( use-modules ( lepton log ) )
( use-modules ( schematic window ) )
( use-modules ( schematic selection ) )
( use-modules ( schematic gui keymap ) )



( define ( select-locked:locked-comps ) ; private:

  ( define ( locked-comp? obj )
    ( and
      ( component? obj )
      ( not (object-selectable? obj) )
    )
  )

  ; return:
  ( filter locked-comp? (page-contents (active-page)) )

)



( define ( select-locked:deselect-all ) ; private:
  ( for-each deselect-object! (page-contents (active-page)) )
)



( define ( select-locked:select-comp comp ) ; private:
  ( select-object! comp )
  ( for-each select-object! (object-attribs comp) )
)




; public:
;
( define ( select-locked-all )
( let
  (
  ( comps ( select-locked:locked-comps ) )
  )

  ( unless ( null? comps )
    ( select-locked:deselect-all )
    ( for-each select-locked:select-comp comps )
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
      ( if select-locked:verbose ". press <E Shift+L> to unlock" "" )
    )
  )


) ; let
) ; select-locked-all()




; public:
;
( define ( select-locked-next )
( let*
  (
  ( comps ( select-locked:locked-comps ) )
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
      ( if select-locked:verbose
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
      ( select-locked:deselect-all )
      ( set! comp (list-ref comps (next-ndx ndx) ) )
      ( select-locked:select-comp comp )
      ( print-msg ndx comp )
      ( break )
    )

    ( set! ndx (1+ ndx) )
  )

) ; let
) ; select-locked-next()




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
    ( cc ( component-contents c ) ) ; NOTE: empty list for placeholders
    ( oo ( filter non-txt-obj? cc ) )
    )

    ; return:
    ( if ( null? oo )
      cc ; if
      oo ; else
    )

  ) ; let
  ) ; comp-contents()


  ( define ( comp-bounds c )
  ( let*
    (
    ( oo ( comp-contents c ) )
    ( bb ( map object-bounds oo ) )
    )

    ; return:
    ( apply fold-bounds bb ) ; NOTE: returns #f if bb is empty list

  ) ; let
  ) ; comp-bounds()


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

  ( define ( comp-not-empty? c ) ; i.e. not a placeholder
    ( not ( null? (comp-contents c) ) )
  )

  ; function's body:

( let*
  (
  ;
  ; - filter out placeholders
  ; - sort => the smallest will be found first, and not e.g. title
  ;
  ( locked-comps    ( select-locked:locked-comps ) )
  ( non-empty-comps ( filter comp-not-empty? locked-comps ) )
  ( comps           ( sort non-empty-comps less-area? ) )
  ( comp            ( find comp-under-mouse? comps ) )
  )

  ( select-locked:deselect-all )

  ( if comp
    ( select-locked:select-comp comp ) ; if
    ( log! 'message                    ; else
      "select-locked: no locked component under mouse cursor" )
  )

) ; let
) ; select-locked-under-mouse()




; top-level code:
;
( global-set-key "<Control><Shift>L" 'select-locked-all )
( global-set-key "<Shift>L"          'select-locked-next )
( global-set-key "<Control>L"        'select-locked-under-mouse )


; vim: ft=scheme tabstop=2 softtabstop=2 shiftwidth=2 expandtab

