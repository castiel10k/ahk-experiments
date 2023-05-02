#MaxHotkeysPerInterval 2000

timerCounter:=0

timerExpire:=1

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

while (timerCounter < timerExpire){

send {[}
sleep, 1000
send {]}
sleep, 59000
timerCounter++
}