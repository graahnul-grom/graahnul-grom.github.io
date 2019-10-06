; file: list-keys-dmn.scm
; copyright (c) 2019 dmn <graahnul.grom@gmail.com>
; license: GPLv2+
;
; this Guile Scheme script prints current lepton-schematic
;   key bindings to stdout
; usage: in lepton-schematic ":" prompt or in File->REPL type:
;   ( primitive-load "/path/to/list-keys-dmn.scm" )
;
; vim: ft=scheme tabstop=2 softtabstop=2 shiftwidth=2 expandtab
;

( use-modules ( schematic gui keymap ) )
( use-modules ( gschem keymap ) )
( use-modules ( gschem action ) )


; function: print-keymap()
;
( define ( print-keymap kmap indent )

  ; auxiliary local functions:

  ( define ( print-indent ind )
    ( while ( > ind 0 )
      ( format #t "  " )
      ( set! ind (1- ind) )
    )
  )

  ( define ( print-key key )
    ( format #t "~a" (key->display-string key) )
  )

  ( define ( print-action action )
  ( let*
    (
    ( action-str (format #f "~a" action) )
    ( action-obj (eval-string action-str (current-module)) )
    )

    ( format #t "~20t= ~a" action )
    ( if ( action? action-obj )
      ( format #t " (~a)" ( action-property action-obj 'label ) )
    )
    ( format #t "~%" )
  )
  )


  ; function body:

  ( format #t "~%" )

  ( keymap-for-each
    ( lambda( key action-or-keymap )

      ( print-indent indent )
      ( print-key key )

      ( if ( keymap? action-or-keymap )
        ( print-keymap action-or-keymap (1+ indent) ) ; if
        ( print-action action-or-keymap )             ; else
      )

    )
    kmap
  )

) ; print-keymap()


; top-level code:
;
( print-keymap %global-keymap 0 )

