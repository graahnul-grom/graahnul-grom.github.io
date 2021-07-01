; file: lock-objs.scm
; type: lepton-schematic Guile script
; copyright (c) 2020-2021 dmn <graahnul.grom@gmail.com>
; license: GPLv2+
;
; Locks all objects with lock=yes attribute on startup.
; Allows to keep any objects locked (not only components).
;
; Usage:
; Add the following to your gschemrc file:
;   ( primitive-load "/path/to/lock-objs.scm" )
;



( use-modules ( lepton object  ) )
( use-modules ( lepton attrib  ) )
( use-modules ( lepton page    ) )
( use-modules ( lepton log     ) )
( use-modules ( schematic hook ) )



( define ( msg level msg . aa )
    ( format #t  "~a: lock.dmn.scm: ~a~%" level (apply format #f msg aa) )
    ( log!
        ( if (eq? level 'error) 'warning 'message )
        "lock.dmn.scm: ~a"
        ( apply format #f msg aa )
    )
) ; msg()



( define ( is_obj_lockable obj )

    ( define ( is_attr_lock_yes attr )
        ; return:
        ( and
            ( attribute? attr )
            ( string-ci=? (attrib-name attr)  "lock" )
            ( string-ci=? (attrib-value attr) "yes"  )
        )
    )

    ; return:
    ( find is_attr_lock_yes (object-attribs obj) )

) ; is_obj_lockable()



( define ( lock_objs_on_page page )

    ( define ( lock_obj o )
        ( set-object-selectable! o #f )
    )

    ( define ( lock_obj_attrs o )
        ( for-each lock_obj (object-attribs o) )
    )

    ( define ( is_page_symbol page )
        ; return:
        ( string-suffix-ci? ".sym" (page-filename page) )
    )

    ( define ( do_lock )
        ( for-each
        ( lambda( obj )
            ( msg 'info "locking [~a]..." (object-type obj) )
            ( lock_obj obj )
            ( lock_obj_attrs obj )
            ( set-page-dirty! page #f )
        )
        ( filter is_obj_lockable (page-contents page) )
        )
    )


    ( if ( is_page_symbol page )
        ( msg 'info "disable locking in symbol files" ) ; if
        ( do_lock )                                   ; else
    )

) ; lock_objs_on_page()



( define ( install_hook )
    ( add-hook! open-page-hook lock_objs_on_page #f ) ; #f => prepend
    ( msg 'info "open-page-hook installed" )
)




; open-page-hook:           added in    git 21a5b6b (20.12.2018)
; set-object-selectable!(): added circa git 4708547 (16.01.2019)
;
( if ( and (defined? 'open-page-hook) (defined? 'set-object-selectable!) )
    ( install_hook )
    ( msg 'error "need lepton-eda >= git:4708547 (16.01.2019)" )
)

