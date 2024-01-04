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


playingLocation:="playing.ahk"
resetLocation:="reset.ahk"

gameLocation:=""

configLocation:=""

configTmpLocation:=""

configBackupLocation:=""

configLocalLocation:="configLocal.ini"

cleanupLocation:="cleanup.ahk"

middleManLocation:="middleMan.ahk"

while (gameLocation = "" || configLocation = ""){



Loop, read, %configLocalLocation%
{

     if InStr(A_LoopReadLine, "gameLocation=")
	 	{
	
	StringTrimLeft, gameLocation, A_LoopReadLine, 13
	
	}
	
	else if InStr(A_LoopReadLine, "configLocation=")
	{

	StringTrimLeft, configLocation, A_LoopReadLine, 15
    
	}
	
	else if InStr(A_LoopReadLine, "configTmpLocation=")
	{

	StringTrimLeft, configTmpLocation, A_LoopReadLine, 18
    
	}
	
	else if InStr(A_LoopReadLine, "configBackupLocation=")
	{
	
	StringTrimLeft, configBackupLocation, A_LoopReadLine, 21
    
	} 
		
} 	

}



if ProcessExist("cleanup.exe"){

	ExitApp
	
} else {

Run, %cleanupLocation%

}



ProcessExist(Name){

	Process,Exist,%Name%
	return Errorlevel

}
