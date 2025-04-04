NumpadSub::
    if (state == 0) {
        state := 1
        Gui, DC: +AlwaysOnTop -Border -Caption +ToolWindow
        Gui, DC: Font, s12, Cambria bold
        Gui, DC: Color, FFA500
        Gui, DC: Add, Text, Cwhite, Auto Dock
        Gui, DC: Show, NoActivate x1640 y0 w100 h36
        WinSet, Transparent, 180, 1-9ALL
        WinSet, exstyle, ^0x20, 1-9ALL
        SetTimer, CheckPixel, 1000
    }
    else {
        state := 0
        Gui, DC: Destroy
        SetTimer, CheckPixel, Off
    }
return

CheckPixel() {
    PixelGetColor, checkColor, 1235, 186
    if (checkColor = 0x0000FF) {
        state := 0
        Gui, DC: Destroy
        SetTimer, CheckPixel, Off
        return
    }

    PixelGetColor, warpcolor, 387, 864
    if (warpcolor = 0xC40083) {
        SendInput, t
        Sleep, 2000 ; Adjust this value if needed
    }
}
