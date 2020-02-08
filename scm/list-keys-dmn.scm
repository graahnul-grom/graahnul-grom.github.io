; file: list-keys-dmn.scm
; copyright (c) 2019-2020 dmn <graahnul.grom@gmail.com>
; license: GPLv2+
;
; print current lepton-schematic key bindings to stdout
; usage: type the following in the ":" prompt (or File->REPL):
;   ( primitive-load "/path/to/list-keys-dmn.scm" )
;

( use-modules ( schematic gui keymap ) )
( use-modules ( schematic keymap ) )
( use-modules ( schematic action ) )


; function: print-keymap()
;
( define* ( print-keymap kmap #:optional (indent 0) )

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
    ( action-obj (eval-string action-str) )
    ;             ^--- BLPP: do not pass #:module to eval-string()
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
( print-keymap %global-keymap )

