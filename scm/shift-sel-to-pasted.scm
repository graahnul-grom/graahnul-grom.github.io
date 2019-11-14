; file: shift-sel-to-pasted.scm
; copyright (c) 2016-2019 dmn <graahnul.grom@gmail.com>
; license: GPLv2+
;
; make lepton-schematic shift selection to pasted objects
; posted on the geda-user mailing list:
; http://www.delorie.com/archives/browse.cgi?p=geda-user/2016/10/22/20:39:25
; usage: add the following to your gschemrc configuration file:
;   ( primitive-load "/path/to/shift-sel-to-pasted.scm" )
;


( use-modules ( gschem selection ) )
( use-modules ( gschem window    ) )
( use-modules ( gschem hook      ) )


( define ( select-pasted objs )

  ( for-each deselect-object! (page-selection (active-page)) )
  ( for-each select-object! objs )

) ; select-pasted()


; top-level code:
;
( add-hook! paste-objects-hook select-pasted )

