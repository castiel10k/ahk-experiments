#MaxHotkeysPerInterval 2000


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

pause 

SetNumLockState, AlwaysOn


sleep,  1000

Send, {Numpad0} 







$]::Pause
$[::Reload