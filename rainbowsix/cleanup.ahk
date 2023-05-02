



playingLocation:="playing.ahk"

resetLocation:="reset.ahk"

gameLocation:=""

configLocation:=""

configTmpLocation:=""

configBackupLocation:=""

configLocalLocation:="configLocal.ini"

cleanupLocation:="cleanup.ahk"

middleManLocation:="middleMan.ahk"

SetTitleMatchMode, 2
DetectHiddenWindows, On
If WinExist("main.ahk" . " ahk_class AutoHotkey"){
ExitApp      
}





Send {Volume_Up 50}

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


if ProcessExist("RainbowSix.exe"){

	Process, WaitClose, RainbowSix.exe
}


if FileExist(configBackupLocation){

		FileCopy, %configBackupLocation%, %configLocation%, 1
		
		}
		
		ExitApp


ProcessExist(Name){

	Process,Exist,%Name%
	return Errorlevel

}
