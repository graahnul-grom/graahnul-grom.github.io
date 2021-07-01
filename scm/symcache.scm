; file: symcache.scm
; type: lepton-schematic Guile script
; copyright (c) 2020-2021 dmn <graahnul.grom@gmail.com>
; license: GPLv2+
;
; Saves all symbols used in schematic(s) to "symcache"
; subdir in current schematic's directory.
;
; Usage:
; Type in the ":" prompt or add this to your gschemrc file:
;   ( primitive-load "/path/to/symcache.scm" )
; Type ( symcache ) in the ":" prompt to save current schematic's
; symbols to "symcache" directory or ( symcache-all ) to save
; symbols from all opened schematics.
;



( use-modules ( srfi srfi-1 ) ) ; delete-duplicates()
( use-modules ( lepton page ) )
( use-modules ( lepton object ) )
( use-modules ( schematic window ) )

( define outdir_name "symcache" )



( define ( geom-off )
    ( use-modules ( lepton config ) )
    ( set-config!
        ( path-config-context (getcwd) )
        "load-from-path"
        "restore-window-geometry"
        "false"
    )
)

( define ( symcache-all )
    ( for-each symcache-impl (active-pages) )
)

( define ( symcache )
    ( symcache-impl (active-page) )
)

( define ( symcache-impl page )
( let*
    (
    ( cont    ( page-contents page ) )
    ( comps   ( filter component? cont ) )
    ( fpaths0 ( map component-filename comps ) )
    ( fpaths  ( delete-duplicates fpaths0 ) )
    ( outdir  outdir_name )
    )

    ( define ( outpath srcpath )
        ( format #f "~a/~a" outdir (basename srcpath) )
    )

    ( define ( do_copy srcpath )
        ( if ( string-ci=? srcpath (outpath srcpath) )
            ( format #t "symcache.scm: EE: src == dest => NOOP~%" ) ; if
            ( copy-file srcpath (outpath srcpath) )                 ; else
        )
    )


    ( format #t "fpaths: count: [ ~a ]~%" (length fpaths) )
    ( format #t "fpaths:~%~{  ~a~%~}~%" fpaths )

    ( set! outdir ( format #f "~a/~a" (getcwd) outdir_name ) )
    ( format #t "outdir: [~a]~%" outdir )

    ( false-if-exception ( mkdir outdir ) )

    ( for-each
    ( lambda( fpath )
        ( if fpath
            ( do_copy fpath )                                      ; if
            ( format #t "symcache.scm: EE: !fpath: [~a]~%" fpath ) ; else
        )
    )
      fpaths
    )

) ; let
) ;

