--------------------------------
--  Awesome WM theme by Egon  --
--     Updated 2013/12/11     --
--------------------------------

-- {{{ Main
theme = {}
-- }}}

theme.font       = "Fiery Turk 6"
theme.dir        = os.getenv("HOME") .. "/.config/awesome/themes/egon"

-- {{{ Colors
theme.fg_normal  = "#BABABA"
theme.fg_focus   = "#ECECEC"
theme.fg_urgent  = "#C1ACE8"
theme.bg_normal  = "#242424"
theme.bg_focus   = "#242424"
theme.bg_urgent  = "#242424"
theme.bg_systray = theme.bg_normal

-- widget colors
theme.bat_fg     = "#96BDAF"
theme.mem_fg     = "#A496BD"
theme.vol_fg     = "#BDB696"
theme.cpu_fg     = "#BD9696"
-- }}}

-- {{{ Borders
theme.border_width  = 1
theme.border_normal = "#242424"
theme.border_focus  = "#999999"
theme.border_marked = "#999999"
-- }}}

-- {{{ Menu
theme.menu_height = 15
theme.menu_width  = 100
-- }}}

-- {{{ Icons
-- {{{ Taglist
theme.taglist_squares_sel   = theme.dir .. "/icons/taglist/squarefz.png"
theme.taglist_squares_unsel = theme.dir .. "/icons/taglist/squarez.png"
--theme.taglist_squares_resize = "false"
-- }}}

-- {{{ Misc
theme.awesome_icon          = theme.dir .. "/icons/awesome-icon.png"
theme.menu_submenu_icon     = theme.dir .. "/icons/submenu.png"

theme.bat					= theme.dir .. "/icons/bat_full_02.png"
theme.bat_low				= theme.dir .. "/icons/bat_low_02.png"
theme.bat_no				= theme.dir .. "/icons/bat_empty_02.png"
theme.ac					= theme.dir .. "/icons/ac_01.png"
theme.cpu					= theme.dir .. "/icons/cpu.png"
theme.ram					= theme.dir .. "/icons/mem.png"
theme.wifi					= theme.dir .. "/icons/wifi_02.png"
theme.speaker_low			= theme.dir .. "/icons/spkr_02.png"
theme.speaker_high			= theme.dir .. "/icons/spkr_01.png"
theme.headphones			= theme.dir .. "/icons/phones.png"
theme.battery_bg			= theme.dir .. "/icons/bat_border.png"
theme.cpu_bg				= theme.dir .. "/icons/cpu_border.png"
theme.ram_bg				= theme.dir .. "/icons/ram_border.png"
theme.volume_bg				= theme.dir .. "/icons/vol_border.png"
-- }}}

-- {{{ Layouts
theme.layout_tile       = theme.dir .. "/icons/layouts/tile.png"
theme.layout_tileleft   = theme.dir .. "/icons/layouts/tileleft.png"
theme.layout_tilebottom = theme.dir .. "/icons/layouts/tilebottom.png"
theme.layout_tiletop    = theme.dir .. "/icons/layouts/tiletop.png"
theme.layout_fairv      = theme.dir .. "/icons/layouts/fairv.png"
theme.layout_fairh      = theme.dir .. "/icons/layouts/fairh.png"
theme.layout_spiral     = theme.dir .. "/icons/layouts/spiral.png"
theme.layout_dwindle    = theme.dir .. "/icons/layouts/dwindle.png"
theme.layout_max        = theme.dir .. "/icons/layouts/max.png"
theme.layout_fullscreen = theme.dir .. "/icons/layouts/fullscreen.png"
theme.layout_magnifier  = theme.dir .. "/icons/layouts/magnifier.png"
theme.layout_floating   = theme.dir .. "/icons/layouts/floating.png"
-- }}}

-- {{{ Titlebar
theme.titlebar_close_button_focus  = theme.dir .. "/icons/titlebar/close_focus.png"
theme.titlebar_close_button_normal = theme.dir .. "/icons/titlebar/close_normal.png"

theme.titlebar_ontop_button_focus_active  = theme.dir .. "/icons/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active = theme.dir .. "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive  = theme.dir .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive = theme.dir .. "/icons/titlebar/ontop_normal_inactive.png"

theme.titlebar_sticky_button_focus_active  = theme.dir .. "/icons/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active = theme.dir .. "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive  = theme.dir .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive = theme.dir .. "/icons/titlebar/sticky_normal_inactive.png"

theme.titlebar_floating_button_focus_active  = theme.dir .. "/icons/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active = theme.dir .. "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive  = theme.dir .. "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive = theme.dir .. "/icons/titlebar/floating_normal_inactive.png"

theme.titlebar_maximized_button_focus_active  = theme.dir .. "/icons/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active = theme.dir .. "/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = theme.dir .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = theme.dir .. "/icons/titlebar/maximized_normal_inactive.png"
-- }}}
-- }}}

return theme
