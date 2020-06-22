; file: select-locked.scm
; type: lepton-schematic Guile script
; version: 1.1
; copyright (c) 2020 dmn <graahnul.grom@gmail.com>
; license: GPLv2+
;
; Select locked components with keyboard shortcuts:
;   - select all locked components
;   - select next locked component
;   - select locked component under mouse cursor
;
; Usage:
; 1) customize the shortcuts defined below if needed (for examples
;    see $PREFIX/share/lepton-eda/scheme/conf/schematic/keys.scm),
;    or comment out to disable
; 2) type in the ":" prompt or add it to your gschemrc file:
;    ( primitive-load "/path/to/select-locked.scm" )
;
( define kbind-select-all          "<Control><Shift>L" )
( define kbind-select-next         "<Shift>L" )
( define kbind-select-under-mouse  "<Control>L" )
( define verbose #t ) ; replace "#t" with "#f" if needed



; no user serviceable parts below:
;
( use-modules ( srfi srfi-1 ) ) ; find()
( use-modules ( lepton page ) )
( use-modules ( lepton object ) )
( use-modules ( lepton attrib ) )
( use-modules ( lepton log ) )
( use-modules ( schematic window ) )
( use-modules ( schematic selection ) )
( use-modules ( schematic gui keymap ) )



( define ( dbg-print-comps comps ) ; [DEBUG]
  ( for-each
  ( lambda( comp )
    ( format #t "~a " (component-basename comp) )
  )
    comps
  )
  ( format #t "~%" )
)


( define ( dbg-mk-box-around-comp comp ) ; [DEBUG]
  ( define ( non-txt-obj? o )
    ( not (text? o) )
  )
( let*
  (
  ( cc ( component-contents comp ) )
  ( oo ( filter non-txt-obj? cc ) )
  ( bb ( map object-bounds oo ) )
  ( bounds    ( apply fold-bounds bb ) )
  ( top-left  ( car bounds ) )
  ( bot-right ( cdr bounds ) )
  ( box       ( make-box top-left bot-right ) )
  )

  ; 8: 'detached-attribute color:
  ;
  ( false-if-exception (set-object-color! box 8) )
  ( page-append! (active-page) box )

) ; let
) ; dbg-mk-box-around-comp()



( define ( locked-obj? obj )
  ( not (object-selectable? obj) )
)


( define ( locked-comp? obj )
  ( and (component? obj) (locked-obj? obj) )
)


( define ( locked-comps )
  ( filter locked-comp? (page-contents (active-page)) )
)


( define ( deselect-all )
  ( for-each deselect-object! (page-contents (active-page)) )
)


( define ( select-comp comp )
  ( when comp
    ( select-object! comp )
    ( for-each
      select-object!
      ( object-attribs comp )
    )
  )
)




; public:
;
( define ( select-next-locked-comp )
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
) ; select-next-locked-comp()




; public:
;
( define ( select-all-locked-comps )
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
) ; select-all-locked-comps()




; public:
;
( define ( select-locked-comp-under-mouse )

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


  ( define ( comp-bounds c ) ; comp's bounds w/o attrs
    ( define ( non-txt-obj? o )
        ( not (text? o) )
    )
  ( let*
    (
    ( cc ( component-contents c ) )
    ( oo ( filter non-txt-obj? cc ) )
    ( bb ( map object-bounds oo ) )
    )

    ; return:
    ( apply fold-bounds bb )

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

  ; function's body:

( let*
  (
  ; sort comps => the smallest will be found first, not a title block:
  ;
  ( comps ( sort (locked-comps) less-area? ) )
  ( comp  ( find comp-under-mouse? comps ) )
  )

  ( deselect-all )

  ( if comp
    ( select-comp comp ) ; if
    ( log! 'message      ; else
      "select-locked: no locked component under mouse cursor" )
  )

) ; let
) ; select-locked-comp-under-mouse()




; top-level code:
;
( if ( defined? 'kbind-select-all )
  ( global-set-key kbind-select-all
                   'select-all-locked-comps )
)

( if ( defined? 'kbind-select-next )
  ( global-set-key kbind-select-next
                   'select-next-locked-comp )
)

( if ( defined? 'kbind-select-under-mouse )
  ( global-set-key kbind-select-under-mouse
                   'select-locked-comp-under-mouse )
)


; vim: ft=scheme tabstop=2 softtabstop=2 shiftwidth=2 expandtab

