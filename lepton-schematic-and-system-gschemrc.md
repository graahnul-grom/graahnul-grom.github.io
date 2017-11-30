## lepton-schematic: old-style configuration settings in `system-gschemrc`

This document lists current settings for `lepton-schematic`
defined in `system-gschemrc` file, along with some implementation details.
It's intended to assist us in migration to new configuration system.

#### Files involved:
- [system-gschemrc](https://github.com/lepton-eda/lepton-eda/blob/master/schematic/lib/system-gschemrc.scm)
- lepton-schematic:
  - [schematic/src/g_register.c](https://github.com/lepton-eda/lepton-eda/blob/master/schematic/src/g_register.c)
  - [schematic/src/g_rc.c](https://github.com/lepton-eda/lepton-eda/blob/master/schematic/src/g_rc.c)
  - [schematic/src/i_vars.c](https://github.com/lepton-eda/lepton-eda/blob/master/schematic/src/i_vars.c)
  - [schematic/src/globals.c](https://github.com/lepton-eda/lepton-eda/blob/master/schematic/src/globals.c)
  - [schematic/include/gschem_defines.h](https://github.com/lepton-eda/lepton-eda/blob/master/schematic/include/gschem_defines.h)
  - [schematic/include/gschem_options.h](https://github.com/lepton-eda/lepton-eda/blob/master/schematic/include/gschem_options.h)
- liblepton:
  - [liblepton/include/liblepton/defines.h](https://github.com/lepton-eda/lepton-eda/blob/master/liblepton/include/liblepton/defines.h)
  - [liblepton/include/liblepton/geda_text_object.h](https://github.com/lepton-eda/lepton-eda/blob/master/liblepton/include/liblepton/geda_text_object.h)
- liblepton (`bus-ripper-symname` option):
  - [liblepton/src/g_register.c](https://github.com/lepton-eda/lepton-eda/blob/master/liblepton/src/g_register.c)
  - [liblepton/src/g_rc.c](https://github.com/lepton-eda/lepton-eda/blob/master/liblepton/src/g_rc.c)


#### Tags:
- *`ivar`*: global variable name in [schematic/src/i_vars.c](https://github.com/lepton-eda/lepton-eda/blob/master/schematic/src/i_vars.c)
- *`topl`*: member of `struct st_gschem_toplevel` (typedef: `GschemToplevel`) - [schematic/include/gschem_toplevel.h](https://github.com/lepton-eda/lepton-eda/blob/master/schematic/include/gschem_toplevel.h)
- *`opt`*:  member of `struct _GschemOptions` (typedef: `GschemOptions`) - [schematic/include/gschem_options.h](https://github.com/lepton-eda/lepton-eda/blob/master/schematic/include/gschem_options.h)
- *`glob`*: global variable defined in [schematic/src/globals.c](https://github.com/lepton-eda/lepton-eda/blob/master/schematic/src/globals.c)<br />
- *`val`*:  values: [C value] - [Guile value] or [type] or one of possible values
- *`dflt`*: default value assigned in [schematic/src/i_vars.c](https://github.com/lepton-eda/lepton-eda/blob/master/schematic/src/i_vars.c)
- *`fbck`*: fallback value
- *`[gschem_defines]`*:   values are defined in [schematic/include/gschem_defines.h](https://github.com/lepton-eda/lepton-eda/blob/master/schematic/include/gschem_defines.h)
- *`[defines]`*:          values are defined in [liblepton/include/liblepton/defines.h](https://github.com/lepton-eda/lepton-eda/blob/master/liblepton/include/liblepton/defines.h)
- *`[geda_text_object]`*: values are defined in [liblepton/include/liblepton/geda_text_object.h](https://github.com/lepton-eda/lepton-eda/blob/master/liblepton/include/liblepton/geda_text_object.h)
- *`[gschem_options]`*:   values are defined in [schematic/include/gschem_options.h](https://github.com/lepton-eda/lepton-eda/blob/master/schematic/include/gschem_options.h)
- <u>underlined</u>:      default values set in `i_vars.c` and `system-gschemrc` are different

#### Notes:
- `[H]`: values are hardcoded (e.g. numbers are used instead of `#define`'d constants)
- `[N]`: not implemented
<br />
<br />


#### A: The only option from `system-gschemrc` implemented in `liblepton`:
`#`         |  notes          | liblepton/src/{g_register,g_rc}.c            | system-gschemrc expr                        | TODO                | TODO
------------|-----------------|----------------------------------------------|---------------------------------------------|---------------------|------------------
[1](#d1)    |                 | **bus-ripper-symname**                       | ( bus-ripper-symname "busripper-1.sym" )    |                     |
<br />
<br />


#### B: Global variables defined in `schematic/src/globals.c`:
`#`         |  notes          | g_register.c, g_rc.c                         | system-gschemrc expr                        | new cfg: group name | new cfg: key name
------------|-----------------|----------------------------------------------|---------------------------------------------|---------------------|------------------
[2](#d2)    |                 | **logging-destination**                      | ( logging-destination "log_window" )        |                     |
|           |                 | *ivar*: default_logging_dest                 |                                             |                     |
|           |                 | *glob*: logging_dest                         |                                             |                     |
|           |                 | *val*:  LOG_WINDOW         - "log_window"    |                                             |                     |
|           |                 | *val*:  STDOUT_TTY         - "tty"           |                                             |                     |
|           |                 | *val*:  BOTH_LOGWIN_STDOUT - "both"          |                                             |                     |
|           |                 | *dflt*: LOG_WINDOW                           |                                             |                     |
|           |                 | *[defines]*                                  |                                             |                     |
<br />
<br />


#### C: Global variables defined in `schematic/src/i_vars.c`:
`#`         |  notes          | g_register.c, g_rc.c                         | system-gschemrc expr                        | new cfg: group name | new cfg: key name
------------|-----------------|----------------------------------------------|---------------------------------------------|---------------------|------------------
[3](#d3)    |`[H]`            | **window-size**                              | ( window-size <u>900</u> <u>650</u> )       |                     |
|           |                 | *ivar_1*: default_width                      |                                             |                     |
|           |                 | *ivar_2*: default_height                     |                                             |                     |
|           |                 | *val_1*:  [int]                              |                                             |                     |
|           |                 | *val_2*:  [int]                              |                                             |                     |
|           |                 | *dflt_1*: <u>800</u>                         |                                             |                     |
|           |                 | *dflt_2*: <u>600</u>                         |                                             |                     |
[4](#d4)    |`[H]`            | **mousepan-gain**                            | ( mousepan-gain <u>1</u> )                  |                     |
|           |                 | *ivar*: default_mousepan_gain                |                                             |                     |
|           |                 | *topl*: mousepan_gain                        |                                             |                     |
|           |                 | *val*:  [int]                                |                                             |                     |
|           |                 | *fbck*: 5                                    |                                             |                     |
|           |                 | *dflt*: <u>5</u>                             |                                             |                     |
[5](#d5)    |`[H]`            | **keyboardpan-gain**                         | ( keyboardpan-gain 20 )                     |                     |
|           |                 | *ivar*: default_keyboardpan_gain             |                                             |                     |
|           |                 | *topl*: keyboardpan_gain                     |                                             |                     |
|           |                 | *val*:  [int]                                |                                             |                     |
|           |                 | *fbck*: 20                                   |                                             |                     |
|           |                 | *dflt*: 20                                   |                                             |                     |
[6](#d6)    |`[H]`            | **select-slack-pixels**                      | ( select-slack-pixels <u>10</u> )           |                     |
|           |                 | *ivar*: default_select_slack_pixels          |                                             |                     |
|           |                 | *topl*: select_slack_pixels                  |                                             |                     |
|           |                 | *val*:  [int]                                |                                             |                     |
|           |                 | *fbck*: 4                                    |                                             |                     |
|           |                 | *dflt*: <u>4</u>                             |                                             |                     |
[7](#d7)    |`[H]`            | **zoom-gain**                                | ( zoom-gain 20 )                            |                     |
|           |                 | *ivar*: default_zoom_gain                    |                                             |                     |
|           |                 | *topl*: zoom_gain                            |                                             |                     |
|           |                 | *val*:  [int]                                |                                             |                     |
|           |                 | *fbck*: 20                                   |                                             |                     |
|           |                 | *dflt*: 20                                   |                                             |                     |
[8](#d8)    |`[H]`            | **scrollpan-steps**                          | ( scrollpan-steps 8 )                       |                     |
|           |                 | *ivar*: default_scrollpan_steps              |                                             |                     |
|           |                 | *topl*: scrollpan_steps                      |                                             |                     |
|           |                 | *val*:  [int]                                |                                             |                     |
|           |                 | *fbck*: 8                                    |                                             |                     |
|           |                 | *dflt*: 8                                    |                                             |                     |
[9](#d9)    |`[H]`            | **auto-save-interval**                       | ( auto-save-interval 120 )                  |                     |
|           |                 | *ivar*: default_auto_save_interval           |                                             |                     |
|           |                 | *topl*: auto_save_interval                   |                                             |                     |
|           |                 | *val*:  [int]                                |                                             |                     |
|           |                 | *fbck*: 120                                  |                                             |                     |
|           |                 | *dflt*: 120                                  |                                             |                     |
<br />
<br />


#### D: Members of `struct _GschemOptions` (`schematic/include/gschem_options.h`):
`#`         |  notes          | g_register.c, g_rc.c                         | system-gschemrc expr                        | new cfg: group name | new cfg: key name
------------|-----------------|----------------------------------------------|---------------------------------------------|---------------------|------------------
[10](#d10)  |                 | **snap-size**                                | ( snap-size 100 )                           |                     |
|           |                 | *ivar*: default_snap_size                    |                                             |                     |
|           |                 | *opt*:  snap_size                            |                                             |                     |
|           |                 | *val*:  [int]                                |                                             |                     |
|           |                 | *val*:  MINIMUM_SNAP_SIZE = 1                |                                             |                     |
|           |                 | *val*:  MAXIMUM_SNAP_SIZE = 102400           |                                             |                     |
|           |`[H]`            | *fbck*: 100                                  |                                             |                     |
|           |                 | *dflt*: DEFAULT_SNAP_SIZE = 100              |                                             |                     |
|           |                 | *[gschem_options]*                           |                                             |                     |
[11](#d11)  |                 | **netconn-rubberband**                       | ( netconn-rubberband <u>"enabled"</u> )     |                     |
|           |                 | *ivar*: default_netconn_rubberband           |                                             |                     |
|           |                 | *opt*:  net_rubber_band_mode                 |                                             |                     |
|           |                 | *val*:  TRUE  - "enabled"                    |                                             |                     |
|           |                 | *val*:  FALSE - "disabled"                   |                                             |                     |
|           |                 | *dflt*: <u>DEFAULT_NET_RUBBER_BAND_MODE = FALSE</u> |                                      |                     |
|           |                 | *[gschem_options]*                           |                                             |                     |
[12](#d12)  |                 | **magnetic-net-mode**                        | ( magnetic-net-mode "enabled" )             |                     |
|           |                 | *ivar*: default_magnetic_net_mode            |                                             |                     |
|           |                 | *opt*:  magnetic_net_mode                    |                                             |                     |
|           |                 | *val*:  TRUE  - "enabled"                    |                                             |                     |
|           |                 | *val*:  FALSE - "disabled"                   |                                             |                     |
|           |                 | *dflt*: DEFAULT_MAGNETIC_NET_MODE = TRUE     |                                             |                     |
|           |                 | *[gschem_options]*                           |                                             |                     |
[13](#d13)  |                 | **grid-mode**                                | ( grid-mode "mesh" )                        |                     |
|           |                 | *ivar*: default_grid_mode                    |                                             |                     |
|           |                 | *opt*:  grid_mode                            |                                             |                     |
|           |                 | *val*:  GRID_MODE_NONE - "none"              |                                             |                     |
|           |                 | *val*:  GRID_MODE_DOTS - "dots"              |                                             |                     |
|           |                 | *val*:  GRID_MODE_MESH - "mesh"              |                                             |                     |
|           |                 | *dflt*: DEFAULT_GRID_MODE = GRID_MODE_MESH   |                                             |                     |
|           |                 | *[gschem_options]*                           |                                             |                     |
<br />
<br />


#### E: Members of  `struct st_gschem_toplevel` (`schematic/include/gschem_toplevel.h`):
`#`         |  notes          | g_register.c, g_rc.c                         | system-gschemrc expr                        | new cfg: group name | new cfg: key name
------------|-----------------|----------------------------------------------|---------------------------------------------|---------------------|------------------
[14](#d14)  |                 | **net-direction-mode**                       | ( net-direction-mode "enabled" )            |                     |
|           |                 | *ivar*: default_net_direction_mode           |                                             |                     |
|           |                 | *topl*: net_direction_mode                   |                                             |                     |
|           |                 | *val*:  TRUE  - "enabled"                    |                                             |                     |
|           |                 | *val*:  FALSE - "disabled"                   |                                             |                     |
|           |                 | *dflt*: TRUE                                 |                                             |                     |
[15](#d15)  |                 | **net-selection-mode**                       | ( net-selection-mode <u>"enabled_net"</u> ) |                     |
|           |                 | *ivar*: default_net_selection_mode           |                                             |                     |
|           |`[H]`            | *topl*: net_selection_mode                   |                                             |                     |
|           |                 | *val*:  0 - "disabled"                       |                                             |                     |
|           |                 | *val*:  2 - "enabled_net"                    |                                             |                     |
|           |                 | *val*:  3 - "enabled_all"                    |                                             |                     |
|           |                 | *dflt*: <u>0</u>                             |                                             |                     |
[16](#d16)  |                 | **zoom-with-pan**                            | ( zoom-with-pan "enabled" )                 |                     |
|           |                 | *ivar*: default_zoom_with_pan                |                                             |                     |
|           |                 | *topl*: zoom_with_pan                        |                                             |                     |
|           |                 | *val*:  TRUE  - "enabled"                    |                                             |                     |
|           |                 | *val*:  FALSE - "disabled"                   |                                             |                     |
|           |                 | *dflt*: TRUE                                 |                                             |                     |
[17](#d17)  |                 | **action-feedback-mode**                     | ( action-feedback-mode "outline" )          |                     |
|           |                 | *ivar*: default_actionfeedback_mode          |                                             |                     |
|           |                 | *topl*: actionfeedback_mode                  |                                             |                     |
|           |                 | *val*:  OUTLINE     - "outline"              |                                             |                     |
|           |                 | *val*:  BOUNDINGBOX - "boundingbox"          |                                             |                     |
|           |                 | *dflt*: OUTLINE                              |                                             |                     |
|           |                 | *[gschem_defines]*                           |                                             |                     |
[18](#d18)  |                 | **scrollbars**                               | ( scrollbars "enabled" )                    |                     |
|           |                 | *ivar*: default_scrollbars_flag              |                                             |                     |
|           |                 | *topl*: scrollbars_flag                      |                                             |                     |
|           |                 | *val*:  TRUE  - "enabled"                    |                                             |                     |
|           |                 | *val*:  FALSE - "disabled"                   |                                             |                     |
|           |                 | *dflt*: TRUE                                 |                                             |                     |
[19](#d19)  |                 | **embed-components**                         | ( embed-components "disabled" )             |                     |
|           |                 | *ivar*: default_embed_complex                |                                             |                     |
|           |                 | *topl*: embed_complex                        |                                             |                     |
|           |                 | *val*:  TRUE  - "enabled"                    |                                             |                     |
|           |                 | *val*:  FALSE - "disabled"                   |                                             |                     |
|           |                 | *dflt*: FALSE                                |                                             |                     |
[20](#d20)  |                 | **logging**                                  | ( logging "enabled" )                       |                     |
|           |                 | *ivar*: default_do_logging                   |                                             |                     |
|           |                 | *topl*: do_logging                           |                                             |                     |
|           |                 | *val*:  TRUE  - "enabled"                    |                                             |                     |
|           |                 | *val*:  FALSE - "disabled"                   |                                             |                     |
|           |                 | *dflt*: TRUE                                 |                                             |                     |
[21](#d21)  |                 | **text-size**                                | ( text-size 10 )                            |                     |
|           |                 | *ivar*: default_text_size                    |                                             |                     |
|           |                 | *topl*: text_size                            |                                             |                     |
|           |                 | *val*:  [int]                                |                                             |                     |
|           |                 | *val*:  MINIMUM_TEXT_SIZE = 1                |                                             |                     |
|           |                 | *dflt*: DEFAULT_TEXT_SIZE = 10               |                                             |                     |
|           |                 | *[geda_text_object]*                         |                                             |                     |
[22](#d22)  |                 | **text-caps-style**                          | ( text-caps-style <u>"both"</u> )           |                     |
|           |                 | *ivar*: default_text_caps                    |                                             |                     |
|           |                 | *topl*: text_caps                            |                                             |                     |
|           |                 | *val*:  LOWER - "lower"                      |                                             |                     |
|           |                 | *val*:  UPPER - "upper"                      |                                             |                     |
|           |                 | *val*:  BOTH  - "both"                       |                                             |                     |
|           |                 | *dflt*: <u>LOWER</u>                         |                                             |                     |
|           |                 | *[gschem_defines]*                           |                                             |                     |
[23](#d23)  |                 | **image-color**                              | ( image-color <u>"enabled"</u> )            |                     |
|           |                 | *ivar*: default_image_color                  |                                             |                     |
|           |                 | *topl*: image_color                          |                                             |                     |
|           |                 | *val*:  TRUE  - "enabled"                    |                                             |                     |
|           |                 | *val*:  FALSE - "disabled"                   |                                             |                     |
|           |                 | *dflt*: <u>FALSE</u>                         |                                             |                     |
[24](#d24)  |                 | **log-window**                               | ( log-window "startup" )                    |                     |
|           |                 | *ivar*: default_log_window                   |                                             |                     |
|           |                 | *topl*: log_window                           |                                             |                     |
|           |                 | *val*:  MAP_ON_STARTUP - "startup"           |                                             |                     |
|           |                 | *val*:  MAP_LATER      - "later"             |                                             |                     |
|           |                 | *dflt*: MAP_ON_STARTUP                       |                                             |                     |
|           |                 | *[gschem_defines]*                           |                                             |                     |
[25](#d25)  |                 | **log-window-type**                          | ( log-window-type "decorated" )             |                     |
|           |                 | *ivar*: default_log_window_type              |                                             |                     |
|           |                 | *topl*: log_window_type                      |                                             |                     |
|           |                 | *val*:  TRANSIENT - "transient"              |                                             |                     |
|           |                 | *val*:  DECORATED - "decorated"              |                                             |                     |
|           |                 | *dflt*: DECORATED                            |                                             |                     |
|           |                 | *[gschem_defines]*                           |                                             |                     |
[26](#d26)  |                 | **third-button**                             | ( third-button "popup" )                    |                     |
|           |                 | *ivar*: default_third_button                 |                                             |                     |
|           |                 | *topl*: third_button                         |                                             |                     |
|           |                 | *val*:  POPUP_ENABLED    - "popup"           |                                             |                     |
|           |                 | *val*:  MOUSEPAN_ENABLED - "mousepan"        |                                             |                     |
|           |                 | *dflt*: POPUP_ENABLED                        |                                             |                     |
|           |                 | *[gschem_defines]*                           |                                             |                     |
[27](#d27)  |                 | **third-button-cancel**                      | ( third-button-cancel "enabled" )           |                     |
|           |                 | *ivar*: default_third_button_cancel          |                                             |                     |
|           |                 | *topl*: third_button_cancel                  |                                             |                     |
|           |                 | *val*:  TRUE  - "enabled"                    |                                             |                     |
|           |                 | *val*:  FALSE - "disabled"                   |                                             |                     |
|           |                 | *dflt*: TRUE                                 |                                             |                     |
[28](#d28)  |                 | **middle-button**                            | ( middle-button <u>"mousepan"</u> )         |                     |
|           |                 | *ivar*: default_middle_button                |                                             |                     |
|           |                 | *topl*: middle_button                        |                                             |                     |
|           |                 | *val*:  STROKE - "stroke"                    |                                             |                     |
|           |                 | *val*:  REPEAT - "repeat"                    |                                             |                     |
|           |                 | *val*:  ACTION - "action"                    |                                             |                     |
|           |                 | *val*:  MID_MOUSEPAN_ENABLED - "mousepan"    |                                             |                     |
|           |                 | *dflt*: <u>HAVE_LIBSTROKE ? STROKE : REPEAT</u> |                                          u                     u
|           |                 | *[gschem_defines]*                           |                                             |                     |
[29](#d29)  |                 | **scroll-wheel**                             | ( scroll-wheel "classic" )                  |                     |
|           |                 | *ivar*: default_scroll_wheel                 |                                             |                     |
|           |                 | *topl*: scroll_wheel                         |                                             |                     |
|           |                 | *val*:  SCROLL_WHEEL_CLASSIC - "classic"     |                                             |                     |
|           |                 | *val*:  SCROLL_WHEEL_GTK     - "gtk"         |                                             |                     |
|           |                 | *dflt*: SCROLL_WHEEL_CLASSIC                 |                                             |                     |
|           |                 | *[gschem_defines]*                           |                                             |                     |
[30](#d30)  |                 | **net-consolidate**                          | ( net-consolidate "enabled" )               |                     |
|           |                 | *ivar*: default_net_consolidate              |                                             |                     |
|           |                 | *topl*: net_consolidate                      |                                             |                     |
|           |                 | *val*:  TRUE  - "enabled"                    |                                             |                     |
|           |                 | *val*:  FALSE - "disabled"                   |                                             |                     |
|           |                 | *dflt*: TRUE                                 |                                             |                     |
[31](#d31)  |                 | **file-preview**                             | ( file-preview <u>"enabled"</u> )           |                     |
|           |                 | *ivar*: default_file_preview                 |                                             |                     |
|           |                 | *topl*: file_preview                         |                                             |                     |
|           |                 | *val*:  TRUE  - "enabled"                    |                                             |                     |
|           |                 | *val*:  FALSE - "disabled"                   |                                             |                     |
|           |                 | *dflt*: <u>FALSE</u>                         |                                             |                     |
[32](#d32)  |                 | **enforce-hierarchy**                        | ( enforce-hierarchy "enabled" )             |                     |
|           |                 | *ivar*: default_enforce_hierarchy            |                                             |                     |
|           |                 | *topl*: enforce_hierarchy                    |                                             |                     |
|           |                 | *val*:  TRUE  - "enabled"                    |                                             |                     |
|           |                 | *val*:  FALSE - "disabled"                   |                                             |                     |
|           |                 | *dflt*: TRUE                                 |                                             |                     |
[33](#d33)  |                 | **fast-mousepan**                            | ( fast-mousepan "enabled" )                 |                     |
|           |                 | *ivar*: default_fast_mousepan                |                                             |                     |
|           |                 | *topl*: fast_mousepan                        |                                             |                     |
|           |                 | *val*:  TRUE  - "enabled"                    |                                             |                     |
|           |                 | *val*:  FALSE - "disabled"                   |                                             |                     |
|           |                 | *dflt*: TRUE                                 |                                             |                     |
[34](#d34)  |                 | **raise-dialog-boxes-on-expose**             | ( raise-dialog-boxes-on-expose "disabled" ) |                     |
|           |                 | *ivar*: default_raise_dialog_boxes           |                                             |                     |
|           |                 | *topl*: raise_dialog_boxes                   |                                             |                     |
|           |                 | *val*:  TRUE  - "enabled"                    |                                             |                     |
|           |                 | *val*:  FALSE - "disabled"                   |                                             |                     |
|           |                 | *dflt*: FALSE                                |                                             |                     |
[35](#d35)  |                 | **continue-component-place**                 | ( continue-component-place "enabled" )      |                     |
|           |                 | *ivar*: default_continue_component_place     |                                             |                     |
|           |                 | *topl*: continue_component_place             |                                             |                     |
|           |                 | *val*:  TRUE  - "enabled"                    |                                             |                     |
|           |                 | *val*:  FALSE - "disabled"                   |                                             |                     |
|           |                 | *dflt*: TRUE                                 |                                             |                     |
[36](#d36)  |`[H]`            | **undo-levels**                              | ( undo-levels <u>10</u> )                   |                     |
|           |                 | *ivar*: default_undo_levels                  |                                             |                     |
|           |                 | *topl*: undo_levels                          |                                             |                     |
|           |                 | *val*:  [int]                                |                                             |                     |
|           |                 | *fbck*: 10                                   |                                             |                     |
|           |                 | *dflt*: <u>20</u>                            |                                             |                     |
[37](#d37)  |                 | **undo-control**                             | ( undo-control "enabled" )                  |                     |
|           |                 | *ivar*: default_undo_control                 |                                             |                     |
|           |                 | *topl*: undo_control                         |                                             |                     |
|           |                 | *val*:  TRUE  - "enabled"                    |                                             |                     |
|           |                 | *val*:  FALSE - "disabled"                   |                                             |                     |
|           |                 | *dflt*: TRUE                                 |                                             |                     |
[38](#d38)  |                 | **undo-type**                                | ( undo-type "disk" )                        |                     |
|           |                 | *ivar*: default_undo_control                 |                                             |                     |
|           |                 | *topl*: undo_control                         |                                             |                     |
|           |                 | *val*:  UNDO_DISK   - "disk"                 |                                             |                     |
|           |                 | *val*:  UNDO_MEMORY - "memory"               |                                             |                     |
|           |                 | *dflt*: UNDO_DISK                            |                                             |                     |
|           |                 | *[gschem_defines]*                           |                                             |                     |
[39](#d39)  |                 | **undo-panzoom**                             | ( undo-panzoom <u>"enabled"</u> )           |                     |
|           |                 | *ivar*: default_undo_panzoom                 |                                             |                     |
|           |                 | *topl*: undo_panzoom                         |                                             |                     |
|           |                 | *val*:  TRUE  - "enabled"                    |                                             |                     |
|           |                 | *val*:  FALSE - "disabled"                   |                                             |                     |
|           |                 | *dflt*: <u>FALSE</u>                         |                                             |                     |
[40](#d40)  |                 | **draw-grips**                               | ( draw-grips "enabled" )                    |                     |
|           |                 | *ivar*: default_draw_grips                   |                                             |                     |
|           |                 | *topl*: draw_grips                           |                                             |                     |
|           |                 | *val*:  TRUE  - "enabled"                    |                                             |                     |
|           |                 | *val*:  FALSE - "disabled"                   |                                             |                     |
|           |                 | *dflt*: TRUE                                 |                                             |                     |
[41](#d41)  |                 | **warp-cursor**                              | ( warp-cursor "enabled" )                   |                     |
|           |                 | *ivar*: default_warp_cursor                  |                                             |                     |
|           |                 | *topl*: warp_cursor                          |                                             |                     |
|           |                 | *val*:  TRUE  - "enabled"                    |                                             |                     |
|           |                 | *val*:  FALSE - "disabled"                   |                                             |                     |
|           |                 | *dflt*: TRUE                                 |                                             |                     |
[42](#d42)  |                 | **toolbars**                                 | ( toolbars "enabled" )                      |                     |
|           |                 | *ivar*: default_toolbars                     |                                             |                     |
|           |                 | *topl*: toolbars                             |                                             |                     |
|           |                 | *val*:  TRUE  - "enabled"                    |                                             |                     |
|           |                 | *val*:  FALSE - "disabled"                   |                                             |                     |
|           |                 | *dflt*: TRUE                                 |                                             |                     |
[43](#d43)  |                 | **handleboxes**                              | ( handleboxes "enabled" )                   |                     |
|           |                 | *ivar*: default_handleboxes                  |                                             |                     |
|           |                 | *topl*: handleboxes                          |                                             |                     |
|           |                 | *val*:  TRUE  - "enabled"                    |                                             |                     |
|           |                 | *val*:  FALSE - "disabled"                   |                                             |                     |
|           |                 | *dflt*: TRUE                                 |                                             |                     |
[44](#d44)  |`[H]`            | **bus-ripper-size**                          | ( bus-ripper-size 200 )                     |                     |
|           |                 | *ivar*: default_bus_ripper_size              |                                             |                     |
|           |                 | *topl*: bus_ripper_size                      |                                             |                     |
|           |                 | *val*:  [int]                                |                                             |                     |
|           |                 | *fbck*: 200                                  |                                             |                     |
|           |                 | *dflt*: 200                                  |                                             |                     |
[45](#d45)  |                 | **bus-ripper-type**                          | ( bus-ripper-type "component" )             |                     |
|           |                 | *ivar*: default_bus_ripper_type              |                                             |                     |
|           |                 | *topl*: bus_ripper_type                      |                                             |                     |
|           |                 | *val*:  COMP_BUS_RIPPER - "component"        |                                             |                     |
|           |                 | *val*:  NET_BUS_RIPPER  - "net"              |                                             |                     |
|           |                 | *dflt*: COMP_BUS_RIPPER                      |                                             |                     |
|           |                 | *[gschem_defines]*                           |                                             |                     |
[46](#d46)  |                 | **bus-ripper-rotation**                      | ( bus-ripper-rotation "non-symmetric" )     |                     |
|           |                 | *ivar*: default_bus_ripper_rotation          |                                             |                     |
|           |                 | *topl*: bus_ripper_rotation                  |                                             |                     |
|           |                 | *val*:  SYMMETRIC     - "symmetric"          |                                             |                     |
|           |                 | *val*:  NON_SYMMETRIC - "non-symmetric"      |                                             |                     |
|           |                 | *dflt*: NON_SYMMETRIC                        |                                             |                     |
|           |                 | *[gschem_defines]*                           |                                             |                     |
[47](#d47)  |                 | **force-boundingbox**                        | ( force-boundingbox "disabled" )            |                     |
|           |                 | *ivar*: default_force_boundingbox            |                                             |                     |
|           |                 | *topl*: force_boundingbox                    |                                             |                     |
|           |                 | *val*:  TRUE  - "enabled"                    |                                             |                     |
|           |                 | *val*:  FALSE - "disabled"                   |                                             |                     |
|           |                 | *dflt*: FALSE                                |                                             |                     |
[48](#d48)  |`[H]`            | **dots-grid-dot-size**                       | ( dots-grid-dot-size 1 )                    |                     |
|           |                 | *ivar*: default_dots_grid_dot_size           |                                             |                     |
|           |                 | *topl*: dots_grid_dot_size                   |                                             |                     |
|           |                 | *val*:  [int]                                |                                             |                     |
|           |                 | *fbck*: 1                                    |                                             |                     |
|           |                 | *dflt*: 1                                    |                                             |                     |
[49](#d49)  |                 | **dots-grid-mode**                           | ( dots-grid-mode "variable" )               |                     |
|           |                 | *ivar*: default_dots_grid_mode               |                                             |                     |
|           |                 | *topl*: dots_grid_mode                       |                                             |                     |
|           |                 | *val*:  DOTS_GRID_VARIABLE_MODE - "variable" |                                             |                     |
|           |                 | *val*:  DOTS_GRID_FIXED_MODE    - "fixed"    |                                             |                     |
|           |                 | *dflt*: DOTS_GRID_VARIABLE_MODE              |                                             |                     |
|           |                 | *[gschem_defines]*                           |                                             |                     |
[50](#d50)  |`[H]`            | **dots-grid-fixed-threshold**                | ( dots-grid-fixed-threshold 10 )            |                     |
|           |                 | *ivar*: default_dots_grid_fixed_threshold    |                                             |                     |
|           |                 | *topl*: dots_grid_fixed_threshold            |                                             |                     |
|           |                 | *val*:  [int]                                |                                             |                     |
|           |                 | *fbck*: 10                                   |                                             |                     |
|           |                 | *dflt*: 10                                   |                                             |                     |
[51](#d51)  |`[H]`            | **mesh-grid-display-threshold**              | ( mesh-grid-display-threshold 3 )           |                     |
|           |                 | *ivar*: default_mesh_grid_display_threshold  |                                             |                     |
|           |                 | *topl*: mesh_grid_display_threshold          |                                             |                     |
|           |                 | *val*:  [int]                                |                                             |                     |
|           |                 | *fbck*: 3                                    |                                             |                     |
|           |                 | *dflt*: 3                                    |                                             |                     |
[52](#d52)  |`[H]` `[N]`      | **add-attribute-offset**                     | ( add-attribute-offset 50 )                 |                     |
|           |                 | *ivar*: default_add_attribute_offset         |                                             |                     |
|           |                 | *topl*: add_attribute_offset                 |                                             |                     |
|           |                 | *val*:  [int]                                |                                             |                     |
|           |                 | *fbck*: 50                                   |                                             |                     |
|           |                 | *dflt*: 50                                   |                                             |                     |
<br />
<br />




#### Description (copy/paste from `system-gschemrc`):

- <a id="d1"></a>1: **bus-ripper-symname**: Bus ripper controls<br />
If above [45: bus-ripper-type - dmn] is set to component, specify the symbol name.<br />
The symbol must exist in a component library<br />


- <a id="d2"></a>2: **logging-destination**: string<br />
Specifies where log message go during run time.<br />
Possible options are:<br />
  - log_window:      The log window (if it's visible)
  - tty:             The stdout of the terminal where gschem was run from
  - both:            Both of the above locations
<br />Message are always written to the log file (unless logging is disabled)<br />
by the above keyword<br />


- <a id="d3"></a>3: **window-size**: width height<br />
Specifies the size of the drawing area window.  The width and height<br />
are specified in pixels and do not include the three menu bars and<br />
scrollbars (so the window will be larger than the specified<br />
measurements). Try to keep an aspect ratio of 1.333333 if at all possible.<br />
These numbers are NOT the true size of the window, but of the drawing area.<br />


- <a id="d4"></a>4: **mousepan-gain**: integer<br />
Controls how much the display pans when using mousepan.  A larger value<br />
provides greater pan distance when moving the mouse, while a smaller value<br />
provides a smoother, but smaller pan distance when moving the mouse.<br />


- <a id="d5"></a>5: **keyboardpan-gain**: integer<br />
Controls how much the display pans when using the keyboard cursor keys.<br />
A larger value provides greater pan distance when pressing the cursor<br />
keys, while a smaller value provides a smoother, but smaller pan<br />
distance when moving the cursor keys.<br />


- <a id="d6"></a>6: **select-slack-pixels**: integer<br />
Controls how many pixels around an object can still be clicked as part of that object.<br />
A larger value gives greater ease in selecting small, or narrow objects.<br />


- <a id="d7"></a>7: **zoom-gain**: integer<br />
Controls the percentage size increase when zooming into the page.<br />
Un-zooming uses the inverse factor such that a zoom in / zoom out<br />
pair will return the schematic to the same size.<br />
 E.g:<br />
   20% increment => x 1.2 original size when zooming in<br />
                 => x 1 / 1.2 x original size when zooming out<br />


- <a id="d8"></a>8: **scrollpan-steps**: integer<br />
Controls the number of scroll pan events required to traverse the viewed<br />
schematic area. Larger numbers mean more scroll steps are required to<br />
pan across the viewed area and giving finer control over positioning.<br />


- <a id="d9"></a>9: **auto-save-interval**<br />
Controls if a backup copy is made every "interval" seconds.<br />
Note that the backup copy is made when you make some change to the schematic,<br />
and there were more than "interval" seconds from the last autosave.<br />
Autosaving will not be allowed if setting it to zero.<br />


- <a id="d10"></a>10: **snap-size**: number<br />
Sets the default grid spacing at start-up of gschem.<br />


- <a id="d11"></a>11: **netconn-rubberband**: string<br />
Controls if net connections are maintained when you move a connecting component or net.<br />


- <a id="d12"></a>12: **magnetic-net-mode**: string<br />
Controls the initial setting of the magnetic net mode. The magnetic<br />
net mode marks a possible connection that is close to the current cursor position<br />


- <a id="d13"></a>13: **grid-mode**<br />
The grid-mode keyword controls which mode of grid is used by default in gschem.<br />


- <a id="d14"></a>14: **net-direction-mode**: string<br />
Controlls if the net direction mode is used. This mode tries to guess<br />
the best continuation direction of a L-shape net when adding a net.<br />


- <a id="d15"></a>15: **net-selection-mode**: string<br />
Controls how many net segments are selected when you click at a net<br />
If one of the enabled items is used, the selection state will toggle<br />
through all selection states. The mode defines the maximum search depth<br />
for the net selection mode<br />


- <a id="d16"></a>16: **zoom-with-pan**: string<br />
Sets the zoom in and zoom out functions to pan the display and then zoom.<br />
Basically zoom in / out where the mouse pointer sits on the display.<br />
Comment out if you want the default mode.<br />


- <a id="d17"></a>17: **action-feedback-mode**: string<br />
Set the default action feedback mode (for copy/move/component place).<br />
Set to outline to get an outline of the selection.<br />
Set to boundingbox to get a bounding box of the selection.<br />
For a fast machines with fast video use outline (it looks good).<br />
For a slow machine use boundingbox; it is much faster.<br />
Comment out if you want the default mode.<br />


- <a id="d18"></a>18: **scrollbars**: string<br />
Controls if the scrollbars are displayed (enabled) or not (disabled)<br />
If you disable the scrollbars, you will not be able to use the scroll<br />
wheel on your mouse.  This is an unfortunate side effect of how the<br />
code is implemented.<br />


- <a id="d19"></a>19: **embed-components**: string<br />
Determines if the newly placed components are embedded in the schematic<br />
or if only the filename is specified and the component is searched for<br />
instead.  If it is enabled, then all new components will be embedded<br />
otherwise they are not embedded.  This can be controlled on the fly during<br />
runtime with the "Embed Component" checkbox on the select component dialog box<br />


- <a id="d20"></a>20: **logging**: string<br />
Determines if the logging mechanism is enabled or disabled.<br />
Possible options: enabled or disabled. Default is enabled.<br />
See below for the logging-destination keyword for control over<br />
where the messages go.<br />


- <a id="d21"></a>21: **text-size**: number<br />
Sets the default text size.<br />


- <a id="d22"></a>22: **text-caps-style**: string<br />
Sets the default caps style used for the input of text
  - lower specifies that all inputed text is in lowercase
  - upper specifies that all inputed text is in uppercase
  - both specifies that all inputed text is used as is (no case conversion).<br />


- <a id="d23"></a>23: **image-color**: string<br />
Controls if image (png) is color (enabled) or black/white (disabled)<br />


- <a id="d24"></a>24: **log-window**: string<br />
Controls if the log message window is mapped when gschem is started up<br />
Possible options:
  - startup - opened up when gschem starts
  - later   - NOT opened up when gschem starts (can be opened by Options/Show Log Window)


- <a id="d25"></a>25: **log-window-type**: string<br />
Controls if the log message window is mapped when gschem is started up<br />
Controls if the log message window is a transient or if it is decorated<br />
as a normal window (this is dependant on the window manager doing decoration right)<br />
Possible options:
  - decorated       - log window is a normal decorated window
  - transient       - log window is a transient dialog box, typically not decorated by the window manager


- <a id="d26"></a>26: **third-button**: string<br />
Controls if the third mouse button performs the popup ("popup") or<br />
if it does the mouse panning ("mousepan")<br />


- <a id="d27"></a>27: **third-button-cancel**: string<br />
Controls if the third mouse in mousepan mode cancels draw actions such as<br />
placing of a component or drawing of a primitive<br />


- <a id="d28"></a>28: **middle-button**: string<br />
Controls if the middle mouse button draws strokes, repeats the last<br />
command, does an action (move and copy (holding down the ALT key)<br />
are supported) on a single objects, or if it does the mouse panning.<br />


- <a id="d29"></a>29: **scroll-wheel**: string<br />
Controls the binding of the mouse scroll wheel.<br />
"classic" style is the gschem default, where scrolling with no modifier<br />
key is mapped to zoom, + CTRL -> x-axis pan, + SHIFT -> y-axis pan.<br />
"gtk" style changes the behaviour to be more like other GTK applications,<br />
no modifier -> y-axis pan, + CTRL -> zoom, + SHIFT -> x-axis pan.<br />


- <a id="d30"></a>30: **net-consolidate**: string<br />
Controls if the net consolidation code is used when schematics are read<br />
in, written to disk, and when nets are being drawn (does not consolidate<br />
when things are being copied or moved yet).  Net consolidation is the<br />
connection of nets which can be combined into one.<br />
Comment out if you want the default mode<br />


- <a id="d31"></a>31: **file-preview**: string<br />
Controls if the preview area in the File Open/Save As and Component<br />
dialog boxes is enabled by default or not<br />


- <a id="d32"></a>32: **enforce-hierarchy**: string<br />
Controls if the movement between hierarchy levels (of the same underlying<br />
schematics) is allowed or not.<br />
If this is enabled, then the user cannot (without using the page manager)<br />
move between hierarchy levels otherwise, if enabled, the user sees all<br />
the hierarchy levels as being flat.<br />


- <a id="d33"></a>33: **fast-mousepan**: string<br />
Controls if text is drawn properly or if a simplified version (a line which<br />
represents the text string) is drawn during mouse pan.  Drawing a simple<br />
line speeds up mousepan a lot for big schematics<br />


- <a id="d34"></a>34: **raise-dialog-boxes-on-expose**: string<br />
Controls if dialog boxes are raised whenever an expose event happens<br />
Default is disabled since gtk2 supposedly handles the raising of these<br />
dialogs correctly now.<br />


- <a id="d35"></a>35: **continue-component-place**: string<br />
If this enabled then multiple instances of the same component can be placed<br />
immediately without having to click on the name or Apply in the Component<br />
Place... dialog box.  If this is disabled then only one component can be<br />
placed (the user must then press Apply in the dialog box to place multiple<br />
instances of the same component)<br />


- <a id="d36"></a>36: **undo-levels**: number<br />
Determines the number of levels of undo.  Basically this number decides<br />
how many backup schematics are saved on disk.<br />


- <a id="d37"></a>37: **undo-levels**: string<br />
Controls if the undo is enabled or not<br />


- <a id="d38"></a>38: **undo-type**: string<br />
Controls which kind of undo is used.  The default is to use the disk as<br />
the storing medium (ie after every action the undo information is stored<br />
to disk).  The other mechanism uses only memory.  The disk mechanism is<br />
nice because you get undo-level number of backups of the schematic written<br />
to disk as backups so you should never lose a schematic due to a crash.<br />


- <a id="d39"></a>39: **undo-panzoom**: string<br />
Controls if pan or zoom commands are saved in the undo list.  If this<br />
is enabled then a pan or zoom command will be considered a command and<br />
can be undone.  If this is false, then panning and zooming is not saved<br />
in the undo list and cannot be undone.  Note, the current viewport<br />
information is saved for every command, so the display will change to the<br />
viewport before a command is executed.<br />


- <a id="d40"></a>40: **draw-grips**: string<br />
Controls if the editing grips are drawn when selecting objects<br />


- <a id="d41"></a>41: **warp-cursor**: string<br />
Controls if the cursor is warped (or moved) when you zoom in and out.<br />
Some people find this forced cursor movement annoying.<br />


- <a id="d42"></a>42: **toolbars**: string<br />
Controls if the toolbars are visible or not.<br />


- <a id="d43"></a>43: **handleboxes**: string<br />
Controls if the handleboxes (which contain the menu and toolbar) are visible or not.<br />


- <a id="d44"></a>44: **bus-ripper-size**: Bus ripper controls<br />
Sets the size of the auto bus rippers.<br />


- <a id="d45"></a>45: **bus-ripper-type**: Bus ripper controls<br />
Sets the bus ripper type either a "component" or plain "net"<br />


- <a id="d46"></a>46: **bus-ripper-rotation**: Bus ripper controls<br />
Either "symmetric" or "non-symmetric".  This deals<br />
with how the bus ripper symbol is rotated when it<br />
is auto added to a schematic.<br />


- <a id="d47"></a>47: **force-boundingbox**: string<br />
Controls if the entire bounding box of a symbol is used when figuring out<br />
whichend of the pin is considered the active port.  Enable this when<br />
gschem is guessing incorrectly.<br />


- <a id="d48"></a>48: **dots-grid-dot-size**: Dots grid dot size<br />
The dots-grid-dot-size keyword controls the size of the grid dots in the<br />
dots grid display. The units are in pixels. The default (min) value of 1<br />
is the best performing as the grid dot size is rendered as a single pixel.<br />
Values of 2 and 3 are good values to try if the default grid dot size is<br />
too small for your tastes. Anything larger than 3 is probably too large.<br />


- <a id="d49"></a>49: **dots-grid-mode**: Dots grid mode<br />
The dots-grid-mode keyword controls the mode of the dotted grid, either<br />
variable or fixed. In the variable mode, the grid spacing changes<br />
depending on the zoom factor. In the fixed mode, the grid always<br />
represents the same number of units as the snap-spacing. You can<br />
control the density of the grid using the dots-grid-fixed-threshold.<br />


- <a id="d50"></a>50: **dots-grid-fixed-threshold**: Dots grid fixed threshold<br />
The dots-grid-fixed-threshold specifies the minimum number of pixels<br />
grid-spacing for the grid to be displayed. Using this parameter you can<br />
control thedensity of the displayed grid (smaller numbers will cause the<br />
grid to be drawn denser). This mode is only used when grid-mode is fixed.<br />


- <a id="d51"></a>51: **mesh-grid-display-threshold**: Mesh grid display threshold<br />
The mesh-grid-display-threshold specifies the minimum line pitch for a the<br />
grid to be displayed. Using this parameter you can control maximum density<br />
of the displayed before the minor, then major grid-lines are switched off.<br />


- <a id="d52"></a>52: **add-attribute-offset**: integer<br />
This has not been implemented/debugged yet.<br />
Controls a offset which is added to the location of text items that are<br />
added to an object as an attribute.  This offset is added when the following<br />
conditions occur:
  1. Add/Attribute... has been invoked via the hotkey
  2. It is the "netname" attribute being added
  3. It is being attached to a horizontal or vertical net segment
  4. The initial mouse position is at or near the actual net (with one grid unit).
If these four conditions are not met, then this offset is not added.<br />
<br />
<br />




<!-- TODO:
1    |         | **gschem-version**                           | -
2    |         | **display-color-map**                        | -
3    |         | **display-outline-color-map**                | -
15   |         | **attribute-name**                           | -
17   |         | **image-size**                               | -
37   |         | **add-menu**                                 | -
-->

#### TODO:

<!--
- `_GschemOptions::snap_mode` (`SNAP_STATE` enum)
-->
<br />
<br />

