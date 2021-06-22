; file: quick.scm
; type: lepton-schematic Guile script
; copyright (c) 2020-2021 dmn <graahnul.grom@gmail.com>
; license: GPLv2+
;
; Quickly access schematic objects from the ":" prompt.
;



( use-modules ( lepton log    ) )
( use-modules ( lepton config ) )
( use-modules ( lepton page   ) )
( use-modules ( lepton object ) )
( use-modules ( schematic window    ) )
( use-modules ( schematic selection ) )



( define ( Q ) ; display list of funcs in this file
    ( define (oo str) (log! 'message str) )
    ( oo "" )
    ( oo "Functions defined in [quick.scm]:" )
    ( oo " - prn(str):        print str to the log" )
    ( oo " - pstr():          page contents as string" )
    ( oo " - sobjs():         list of selected objects" )
    ( oo " - sobj():          first selected object (#f if none)" )
    ( oo " - scomps():        list of selected componenets" )
    ( oo " - scomp():         first selected component (#f if none)" )
    ( oo " - cfgget(grp, key):      get cfg key" )
    ( oo " - cfgset(grp, key, val): set cfg key in local ctx w/o save" )
    ( &options-show-log-window )
)


( define ( prn str )
    ( log! 'message str )
)


( define ( pstr ) ; page contents as string
    ; return:
    ( page->string (active-page) )
)


( define ( sobjs ) ; list of selected objects
    ; return:
    ( page-selection (active-page) )
)


( define ( sobj ) ; first selected object (#f if none selected)
    ; return:
    ( if ( null? (sobjs) )
        #f             ; if
        ( car (sobjs) ) ; else
    )
)


( define ( scomps ) ; list of selected componenets
    ; return:
    ( filter component? (sobjs) )
)


( define ( scomp ) ; first selected component (#f if none selected)
    ; return:
    ( if ( null? (scomps) )
        #f               ; if
        ( car (scomps) ) ; else
    )
)



( define ( cfgget grp key ) ; get cfg key
    ( catch #t
        ( lambda()
            ( config-string (path-config-context (getcwd)) grp key )
        )
        ( lambda( e . aa )
            ( log! 'warning "!cfgget(~s,~s): '~a~%  ~a" grp key e aa )
        )
    )
)

( define ( cfgset grp key val ) ; set cfg key in local context w/o save
    ( catch #t
        ( lambda()
            ( set-config! (path-config-context (getcwd)) grp key val )
        )
        ( lambda( e . aa )
            ( log! 'warning "!cfgset(~s,~s,~a): '~a~%  ~a" grp key val e aa )
        )
    )
)

