;menu tray,noicon


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

serverLocation:="E:\controller\scpserver\new\ScpServer.exe"

if ProcessExist("ScpService.exe"){

Process, Close, ScpService.exe

}




sleep, 5000


if FileExist(serverLocation) && !ProcessExist("scpservice.exe") {



Run, %serverLocation%



}



ProcessExist(Name){
	Process,Exist,%Name%
	return Errorlevel
}