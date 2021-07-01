; file: load-gschemrc.scm
; type: lepton-schematic Guile script
; copyright (c) 2021 dmn <graahnul.grom@gmail.com>
; license: GPLv2+
;
; When opening a page, load gschemrc file from the page's directory
; (unlike gafrc, gschemrc file doesn't automatically loaded unless
; you start lepton-schematic in the directory where gschemrc resides).
;
; Usage:
; Add the following to the ~/.config/lepton-eda/gschemrc file:
;   ( primitive-load "/path/to/load-gschemrc.scm" )
;



( use-modules ( lepton rc      ) )
( use-modules ( lepton page    ) )
( use-modules ( lepton log     ) )
( use-modules ( schematic hook ) )


( define ( load-gschemrc-file page )
( let*
    (
    ( dir ( dirname (page-filename page) ) )
    ( gschemrc (format #f "~a/gschemrc" dir) )
    )

    ( when ( access? gschemrc R_OK )
        ( chdir dir )
        ( parse-rc "lepton-schematic" "gschemrc" )
        ( log!   'warning "load-gschemrc.scm: Loaded [~a/gschemrc]"   gschemrc )
        ( format #t       "load-gschemrc.scm: Loaded [~a/gschemrc]~%" gschemrc )
    )

) ; let
)


( define ( install_hooks )
    ( add-hook! open-page-hook load-gschemrc-file #f ) ; #f => prepend
)


( install_hooks )

