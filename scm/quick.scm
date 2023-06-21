; file: quick.scm
; type: lepton-schematic Guile script
; copyright (c) 2020-2023 dmn <graahnul.grom@ya.ru>
; license: GPLv2+
;
; Quickly access schematic objects from the ":" prompt.
; For the list of functions, see the Q() function below.
;
; Usage:
; Add the following to your gschemrc file:
;   ( primitive-load "/path/to/quick.scm" )
;



( use-modules ( srfi srfi-1 ) )
( use-modules ( ice-9 format ) )
( use-modules ( lepton log ) )
( use-modules ( lepton config ) )
( use-modules ( lepton page   ) )
( use-modules ( lepton object ) )
( use-modules ( lepton attrib ) )
( use-modules ( schematic selection ) )
( use-modules ( schematic window ) )



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
    ( oo " - next[c,n,a,t](): select next comp, net, attr, text; ~
                              keys: q [c,n,a,t]" )
    ( &options-show-log-window )
)



( define ( nextobj pred )
    ( define ( select-obj comp )
        ( select-object! comp )
        ( for-each select-object! (object-attribs comp) )
    )

    ( define ( next-in-list val lst )
        ( if ( eq? val (last lst) )
            ( first lst )             ; if
            ( cadr (member val lst) ) ; else (cadr: car of cdr)
        )
    )

    ( define p ( active-page ) )
    ( define s ( page-selection p ) )
    ( define soo ( filter pred s ) )
    ( define so ( if (null? soo) #f (first soo) ) )
    ( define oo ( filter pred (page-contents p) ) )

    ( &edit-deselect )
    ( if so
        ( select-obj (next-in-list so oo) )
        ( if ( null? oo )
            ( prn (format #f "quick.scm: no objs, pred: [~s]" pred) )
            ( select-obj (first oo) )
        )
    )
) ; nextobj()

( define ( nextc ) ( nextobj component? ))
( define ( nextn ) ( nextobj net? ))
( define ( nexta )
    ( define ( attr? obj )
        ( and (attribute? obj) (text-visible? obj) )
    )
    ( nextobj attr? )
)
( define ( nextt )
    ( define ( txt? obj )
        ( and (text? obj) (not (attribute? obj)) (text-visible? obj) )
    )
    ( nextobj txt? )
)

( global-set-key "q c" 'nextc )
( global-set-key "q n" 'nextn )
( global-set-key "q a" 'nexta )
( global-set-key "q t" 'nextt )



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

