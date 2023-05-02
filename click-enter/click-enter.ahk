Pause


Sleep, 500
while (true){
WinActivate, Steam ahk_class vguiPopupWindow
Click, Left, Down
Sleep, 500
Click, Left, Up
Sleep, 500
Send, {Enter}
}

$]::Pause
$[::Reload