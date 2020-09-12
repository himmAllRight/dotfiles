import XMonad
import XMonad.Config.Desktop

main = xmonad desktopConfig
    { terminal    = "kitty"
    , modMask     = mod4Mask
    , borderWidth = 3
    }
