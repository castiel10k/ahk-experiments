#Requires AutoHotkey 2.0+   ; With AHKv2 out, ALWAYS include a require with your script

F4::toggle_lbutton()      ; I usually avoid multi-line hotkeys and just associate a function instead

toggle_lbutton() {
    static is_down := 0     ; Create a permanent variable
    is_down := !is_down     ; toggle between true <-> false
    if is_down              ; if var is true
        Click('Down')       ;  Send lbutton down
    else Click('Up')        ; else send lbutton up
}