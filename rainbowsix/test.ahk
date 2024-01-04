
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

;mouseXOutItemPass:=100
;mouseYOutItemPass:=200

mouseXOutPass:=50
mouseYOutPass:=50

mouseXOutItemPass:=50
mouseYOutItemPass:=50

mouseXClearClick:=50
mouseYClearClick:=50

mouseXExitClick:=50
mouseYExitClick:=50

mouseXLeaveQueue:=100
mouseYLeaveQueue:=190

mouseXEndQueue:=450
mouseYEndQueue:=275

mouseXContinueClick:=350
mouseYContinueClick:=250

mouseXClick:=250
mouseYClick:=250

mouseXQuitMM:=50
mouseYQuitMM:=50

mouseXKick:=900
mouseYKick:=750

mouseXLeave:=1200
mouseYLeave:=740

mouseXDifficulty:=1000
mouseYDifficulty:=350

Pause 

if WinExist("Rainbow Six"){

IfWinNotActive, Rainbow Six
{
WinActivate, Rainbow Six
}
}

MouseMove, mouseXOutItemPass, mouseYOutItemPass, 0
sleep, 1000

Send, {ClickDown}
sleep, 500
Send {ClickUp}

sleep, 2000

MouseMove, mouseXOutPass, mouseYOutPass, 0
sleep, 1000

Send, {ClickDown}
sleep, 500
Send {ClickUp}

sleep, 500

MouseMove, mouseXClear, mouseYClear, 0
sleep, 1000

;Send, {Enter Down} 
;sleep, 500
;tSend {Enter Up} 

sleep, 500

MouseMove, mouseXLeave, mouseYLeave, 0
sleep, 1000

Send, {ClickDown}
sleep, 500
Send {ClickUp}

sleep 1000

MouseMove, mouseXClick, mouseYClick, 0
sleep, 1500

Send, {ClickDown}
sleep, 500
Send {ClickUp}

sleep, 1000

;Send, {Enter Down} 

;sleep, 500

;Send, {Enter Up} 

MouseMove, mouseXDifficulty, mouseYDifficulty, 0
sleep, 2000

Send, {ClickDown}

sleep, 500

Send {ClickUp}

sleep, 500

sleep, 2000

MouseMove, mouseXClick, mouseYClick, 0
sleep, 2000
$]::Pause
$[::Reload

