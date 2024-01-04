full_command_line := DllCall("GetCommandLine", "str")

if not (A_IsAdmin or RegExMatch(full_command_line, " /restart(?!\S)"))
{
    try
    {
        if A_IsCompiled
            Run *RunAs "%A_ScriptFullPath%" /restart
        else
            Run *RunAs "%A_AhkPath%" /restart "%A_ScriptFullPath%"
    }
    
}

#MaxHotkeysPerInterval 2000

mouseXClearClick:=50
mouseYClearClick:=50

mouseXModeSelect:=125
mouseYModeSelect:=250

mouseXDifficulty:=300
mouseYDifficulty:=415

mouseXTHunt:=1100
mouseYTHunt:=350

mouseXOnlineTHunt:=1000
mouseYOnlineTHunt:=350

mouseXOnlineTHunt2:=950
mouseYOnlineTHunt2:=350

clearClicks:=0

while ( clearClicks < 60){

if WinExist("Rainbow Six"){

IfWinNotActive, Rainbow Six
{
WinActivate, Rainbow Six

MouseMove, mouseXClearClick, mouseYClearClick, 0
sleep,  1000

Send, {ClickDown}
sleep, 500
Send {ClickUp}

clearClicks++
}
}
}



MouseMove, mouseXClearClick, mouseYClearClick, 0
sleep, 2000

Send, {ClickDown}
sleep, 500
Send {ClickUp}

sleep, 5000

MouseMove, mouseXModeSelect, mouseYModeSelect, 0
sleep, 2000

Send, {ClickDown}
sleep, 500
Send {ClickUp}

sleep, 5000

MouseMove, mouseXTHunt, mouseYTHunt, 0
sleep, 2000

Send, {ClickDown}
sleep, 500
Send {ClickUp}

sleep, 5000

MouseMove, mouseXDifficulty, mouseYDifficulty, 0
sleep, 2000

Send, {ClickDown}
sleep, 500
Send {ClickUp}

sleep, 5000
MouseMove, mouseXOnlineTHunt, mouseYOnlineTHunt, 0
sleep, 2000

Send, {ClickDown}
sleep, 500
Send {ClickUp}

MouseMove, mouseXOnlineTHunt2, mouseYOnlineTHunt2, 0
sleep, 1000

Send, {ClickDown}
sleep, 500
Send {ClickUp}

sleep, 5000

MouseMove, mouseXClearClick, mouseYClearClick, 0
sleep, 2000

Send, {ClickDown}
sleep, 500
Send {ClickUp}


