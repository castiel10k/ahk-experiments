#MaxHotkeysPerInterval 2000

SetKeyDelay, 1

menu tray,noicon

SetNumLockState, Off

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

LWin::Return

#If WinActive("Counter-Strike: Global Offensive") 
{

LWin::i
LCtrl & Escape::SendInput {Escape Down}
CapsLock::i  
LAlt::o




}


#If WinActive("Rainbow Six") 
{

LWin::i
LCtrl & Escape::SendInput {Escape Down}
CapsLock::i  
LAlt::o

*wheelup::Send {Blind} {space Down} {space Up}

*wheeldown::Send {Blind} {space Down} {space Up}



}
;LAlt & Tab::Send {Tab Down}
;LAlt & Tab Up::Send {Tab Up}
;#Tab::Return


