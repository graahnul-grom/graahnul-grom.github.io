( use-modules ( lepton log ) )
( use-modules ( lepton object type ) )
( use-modules ( schematic window ) )
( use-modules ( schematic selection ) )


( log! 'warning "sch/simple/sch/simple.scm" )

( define SEL ( page-selection (active-page) ) )
( unless (null? SEL)
    ( for-each
    ( lambda ( obj )
        ( log! 'message "obj: [~a]" (object-type obj) )
    )
      SEL
    )
)

