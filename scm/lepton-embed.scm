#!/usr/bin/env sh
# export GUILE_LOAD_COMPILED_PATH="/home/dmn/lepton/bin.tb/share/lepton-eda/ccache:${GUILE_LOAD_COMPILED_PATH}"
# export GUILE_LOAD_COMPILED_PATH="@ccachedir@:${GUILE_LOAD_COMPILED_PATH}"
exec guile -s "$0" "$@"
!#

;;
;; Lepton EDA
;; lepton-embed - schematic components and pictures embedding utility
;; Copyright (C) 2019 dmn <graahnul.grom@gmail.com>
;; License: GPLv2+. See the COPYING file
;;

( load-extension
  ( or (getenv "LIBLEPTON") "/home/dmn/lepton/bin.tb/lib/liblepton" )
  ; ( or (getenv "LIBLEPTON") "@libdir@/liblepton" )
  "libgeda_init"
)

( use-modules ( ice-9 getopt-long ) )
( use-modules ( ice-9 format ) )

( primitive-eval '(use-modules (geda core toplevel)) )
( primitive-eval '(use-modules (geda object)) )
( primitive-eval '(use-modules (lepton page)) )
( primitive-eval '(use-modules (lepton version)) )



; command line options:
;
( define cmd-line-args-spec
( list
  ( list ; --embed (-e)
    'embed
    ( list 'single-char #\e )
    ( list 'value        #f )
  )
  ( list ; --unembed (-u)
    'unembed
    ( list 'single-char #\u )
    ( list 'value        #f )
  )
  ( list ; --help (-h)
    'help
    ( list 'single-char #\h )
    ( list 'value        #f )
  )
  ( list ; --version (-V)
    'version
    ( list 'single-char #\V )
    ( list 'value        #f )
  )
)
) ; cmd-line-args-spec



( define ( usage exit-code )
  ( format #t "~
Usage: lepton-embed OPTIONS FILE ...

Lepton EDA component embedding/unembedding utility.

Options:
  -e, --embed      Embed all components and pictures
  -u, --unembed    Unembed all components and pictures
  -h, --help       Show usage information
  -V, --version    Show version information

Report bugs at <~a>
Lepton EDA homepage: <~a>
"
    ( lepton-version 'bugs )
    ( lepton-version 'url )
  )

  ( primitive-exit exit-code )
)



( define ( version )
  ( format #t "~a~%" ( lepton-version 'msg ) )
  ( primitive-exit 0 )
)



( define ( page-open file )
  ( catch #t
  ( lambda()
    ; return:
    ( file->page file )
  )
  ( lambda( ex . args )
    ( format (current-error-port)
              "Cannot open file [~a]:~%  '~a: ~a ~%"
              file ex args )
    ; return:
    #f
  )
  ) ; catch
) ; page-open()



( define* ( page-save page #:optional (suffix "") )
( let
  (
  ( file ( page-filename page ) )
  )

  ( catch #t
  ( lambda()
    ( with-output-to-file
      ( format #f "~a~a" file suffix )
      ( lambda()
        ; return:
        ( format #t "~a" (page->string page) )
      )
    )
  )
  ( lambda( ex . args )
    ( format (current-error-port)
              "Cannot save file [~a]:~%  '~a: ~a ~%"
              file ex args )
    ; return:
    #f
  )
  ) ; catch

) ; let
) ; page-save()



( define ( do-embed page embed )

  ( define ( embeddable? obj )
    ( or (component? obj) (picture? obj) )
  )

  ( for-each
  ( lambda( comp )
      ( set-object-embedded! comp embed )
  )
  ( filter embeddable? (page-contents page) )
  )

) ; do-embed()



( define ( process-file file embed )
( let
  (
  ( page ( page-open file ) )
  )

  ( when page
    ( do-embed page embed )
    ( if ( and (page-dirty? page) (page-save page) )
      ( format #t "Saved: [~a]~%" file )
    )
  )

) ; let
) ; process-file()



( define ( main )
( let
  (
  ( cmd-line-args '() )
  ( files         '() )
  ( arg-embed      #f )
  ( arg-unembed    #f )
  )

  ( set! cmd-line-args
    ( getopt-long (program-arguments) cmd-line-args-spec )
  )

  ( if ( option-ref cmd-line-args 'help #f )
    ( usage 0 )
  )
  ( if ( option-ref cmd-line-args 'version #f )
    ( version )
  )

  ( set! arg-embed   ( option-ref cmd-line-args 'embed #f ) )
  ( set! arg-unembed ( option-ref cmd-line-args 'unembed #f ) )

  ( if ( and arg-embed arg-unembed )
    ( usage 1 )
  )
  ( if ( and (not arg-embed) (not arg-unembed) )
    ( usage 2 )
  )

  ( set! files ( option-ref cmd-line-args '() '() ) )
  ( if ( null? files )
    ( usage 3 )
  )


  ( (@@ (guile-user) parse-rc) "lepton-embed" "gafrc" )

  ( for-each
  ( lambda( file )
    ( process-file file arg-embed )
  )
    files
  )

) ; let
) ; main()




( %with-toplevel
  ( %make-toplevel )
  ( lambda()
    ( main )
  )
)

