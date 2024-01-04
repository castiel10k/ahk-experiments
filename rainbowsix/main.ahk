
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

resetCounter:=0

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

playingLocation:="playing.ahk"

resetLocation:="reset.ahk"

gameLocation:="Tom Clancy's Rainbow Six Siege.url"


configLocation:=""

configFolder:=""

configTmpLocation:=""

configBackupLocation:=""

configTmpLocationBackup:=""

configLocalLocation:="configLocal.ini"

cleanupLocation:="cleanup.ahk"

middleManLocation:="middleMan.ahk"


;sleep, 3000


if FileExist(configLocalLocation){

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
			
	else if InStr(A_LoopReadLine, "configFolder=")
	{
	StringTrimLeft, configFolder, A_LoopReadLine, 13
    
	}
		
} 	

}



}

if !FileExist(configLocation) || !FileExist(gameLocation) {

FileDelete, %configLocalLocation%

}

while !FileExist(gameLocation){
		
		gameLocation := findGameLocation(gameLocation)
		
		
}	
	

configTmpLocationBackup = %configFolder%\GameSettings_backup.ini

while !FileExist(configLocation) || !FileExist(configTmpLocationBackup){
		
		
		configFolder := findConfigLocation(configLocation)
		configTmpLocation = %configFolder%\GameSettingsTmp.ini
		configBackupLocation = %configFolder%\GameSettings_backup.ini
		configLocation = %configFolder%\GameSettings.ini
		configTmpLocationBackup = %configFolder%\GameSettings_backup.ini
		
		FileDelete, %configLocalLocation%
		
		if !FileExist(configLocalLocation) {
		FileAppend, gameLocation=%gameLocation%`n, %configLocalLocation%
		FileAppend, configLocation=%configLocation%`n, %configLocalLocation%
		FileAppend, configTmpLocation=%configTmpLocation%`n, %configLocalLocation%
		FileAppend, configBackupLocation=%configBackupLocation%`n, %configLocalLocation%
		FileAppend, configFolder=%configFolder%, %configLocalLocation%
		
		backupChangeConfig(configLocation, configTmpLocation, configBackupLocation)	
		} 
		
		
		if FileExist(configLocalLocation){

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
			
	else if InStr(A_LoopReadLine, "configFolder=")
	{
	StringTrimLeft, configFolder, A_LoopReadLine, 13
    
	}
		
} 	

}



}
;MsgBox, %configLocation%
;MsgBox, %configTmpLocationBackup%
	
}

backupChangeConfig(configLocation, configTmpLocation, configBackupLocation)	



Send {Volume_Up 50}

OnExit, cleanup

Pause

Send {Volume_Down 50}
Loop,
{

FormatTime, time,, HHmm

;checkTime(time)




SetNumLockState, On


if FileExist(gameLocation){

;ChangeResolution(1920, 1080)

IfWinNotExist, Rainbow Six
{

if ProcessExist("upc.exe"){

Process, Close, upc.exe

}

sleep, 10000


Run, %gameLocation%



sleep, 30000

launchCounter:=0

if (0 != Mod(resetCounter, 7)) {

while(launchCounter < 150){


if WinExist("Rainbow Six"){

IfWinNotActive, Rainbow Six
{
WinActivate, Rainbow Six
}

}

if ((0 = Mod(launchCounter, 25)) && (launchCounter != 0)){

if WinExist("Rainbow Six"){

IfWinNotActive, Rainbow Six
{
WinActivate, Rainbow Six


MouseMove, mouseXExitClick, mouseYExitClick, 0
sleep, 2000

Send, {ClickDown}
sleep, 500
Send {ClickUp}

sleep, 500

Send, {MButton Down} 

sleep,  500

Send, {MButton Up} 

sleep,  500

MouseMove, mouseXKick, mouseYKick, 0
sleep, 1000

Send, {ClickDown}
sleep, 500
Send {ClickUp}

sleep, 500

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

MouseMove, mouseXExitClick, mouseYExitClick, 0
sleep, 2000

Send, {ClickDown}
sleep, 500
Send {ClickUp}

sleep, 500

MouseMove, mouseXQuitMM, mouseYQuitMM, 0
sleep, 1000

Send, {ClickDown}
sleep, 500
Send {ClickUp}

sleep 500

MouseMove, mouseXLeaveQueue, mouseYLeaveQueue, 0
sleep, 1000

Send, {ClickDown}
sleep, 500
Send {ClickUp}

sleep 500

MouseMove, mouseXEndQueue, mouseYEndQueue, 0
sleep, 1000

Send, {ClickDown}
sleep, 500
Send {ClickUp}

sleep 500

}
}

if FileExist("gameLocation")
 &&  FileExist("playingLocation") && WinActive("Rainbow Six") {



Run, %playingLocation%



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

MouseMove, mouseXClick, mouseYClick, 0
sleep, 2000

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

MouseMove, mouseXContinueClick, mouseYContinueClick, 0
sleep, 2000

Send, {ClickDown}
sleep, 500
Send {ClickUp}

sleep, 500

launchCounter++
} 

}else{

Run, %resetLocation%

sleep 130000

}

resetCounter++

} 
else

if WinExist("Rainbow Six"){

IfWinNotActive, Rainbow Six
{
WinActivate, Rainbow Six
}

}

if WinExist("Rainbow Six"){

enterCounter:=0

while(enterCounter < 45){



if WinExist("Rainbow Six"){

IfWinNotActive, Rainbow Six
{
WinActivate, Rainbow Six
}

}

MouseMove, mouseXContinueClick, mouseYContinueClick, 0
sleep, 2000

Send, {ClickDown}
sleep, 500
Send {ClickUp}

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

;Send, {Enter Down} 

;sleep, 500

;Send, {Enter Up} 

sleep, 1000

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
;Send {Enter Up} 

sleep, 500

if WinExist("Rainbow Six"){

IfWinNotActive, Rainbow Six
{
WinActivate, Rainbow Six
}

}

if ((0 = Mod(enterCounter, 5)) && (enterCounter != 0)){

MouseMove, mouseXExitClick, mouseYExitClick, 0
sleep, 2000

Send, {ClickDown}
sleep, 500
Send {ClickUp}

sleep, 500

Send, {MButton Down} 

sleep,  500

Send, {MButton Up} 

sleep,  500

MouseMove, mouseXKick, mouseYKick, 0
sleep, 1000

Send, {ClickDown}
sleep, 500
Send {ClickUp}

sleep, 500

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

MouseMove, mouseXExitClick, mouseYExitClick, 0
sleep, 2000

Send, {ClickDown}
sleep, 500
Send {ClickUp}

sleep, 500

MouseMove, mouseXQuitMM, mouseYQuitMM, 0
sleep, 1000

Send, {ClickDown}
sleep, 500
Send {ClickUp}

sleep 500

MouseMove, mouseXLeaveQueue, mouseYLeaveQueue, 0
sleep, 1000

Send, {ClickDown}
sleep, 500
Send {ClickUp}

sleep 500

MouseMove, mouseXEndQueue, mouseYEndQueue, 0
sleep, 1000

Send, {ClickDown}
sleep, 500
Send {ClickUp}

sleep 500

if WinExist("Rainbow Six"){

IfWinNotActive, Rainbow Six
{
WinActivate, Rainbow Six
}

}

Run, %playingLocation%

MouseMove, mouseXKick, mouseYKick, 0
sleep, 1000

Send, {ClickDown}
sleep, 500
Send {ClickUp}

sleep, 500

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

MouseMove, mouseXClick, mouseYClick, 0
sleep, 2000

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

}

if WinExist("Rainbow Six"){

IfWinNotActive, Rainbow Six
{
WinActivate, Rainbow Six
}

}

MouseMove, mouseXDifficulty, mouseYDifficulty, 0
sleep, 2000

Send, {ClickDown}
sleep, 500
Send {ClickUp}

sleep, 500

MouseMove, mouseXContinueClick, mouseYContinueClick, 0
sleep, 2000

Send, {ClickDown}
sleep, 500
Send {ClickUp}

sleep, 500

enterCounter++

}

}
else
{

sleep, 30000

}

}
else
{

sleep, 30000

}

if ProcessExist("RainbowSix.exe"){

Process, Close, RainbowSix.exe

}

if ProcessExist("upc.exe"){

Process, Close, upc.exe

}

if ProcessExist("steam.exe"){

Process, Close, steam.exe

}


sleep 5000

}

$\::
	Suspend, Toggle
	SetNumLockState, Off
return

$]::Pause
$[::Reload


ProcessExist(Name){

	Process,Exist,%Name%
	return Errorlevel

}



checkTime(time){
If ( ( time <= 2200 ) or ( time >= 1000 )  )
{

Process, Close, RainbowSix.exe

sleep, 10000

Shutdown,1

sleep, 60000

Shutdown, 8
}
}







ChangeResolution(Screen_Width := 1920, Screen_Height := 1080, Color_Depth := 32)
{
	VarSetCapacity(Device_Mode,156,0)
	NumPut(156,Device_Mode,36) 
	DllCall( "EnumDisplaySettingsA", UInt,0, UInt,-1, UInt,&Device_Mode )
	NumPut(0x5c0000,Device_Mode,40) 
	NumPut(Color_Depth,Device_Mode,104)
	NumPut(Screen_Width,Device_Mode,108)
	NumPut(Screen_Height,Device_Mode,112)
	Return DllCall( "ChangeDisplaySettingsA", UInt,&Device_Mode, UInt,0 )
}







backupChangeConfig(configLocation, configTmpLocation, configBackupLocation)
{

FileDelete, %configTmpLocation%

if !FileExist(configBackupLocation){
FileCopy, %configLocation%, %configBackupLocation%, 1
}



Loop, read, %configLocation%, %configTmpLocation% 
{

     if InStr(A_LoopReadLine, "ResolutionWidth=")
	 	{
    FileAppend ,ResolutionWidth=1366`n
    
	}
	
	else if InStr(A_LoopReadLine, "ResolutionHeight=")
	{
    FileAppend, ResolutionHeight=768`n
    
	}
	
	else if InStr(A_LoopReadLine, "WindowMode=")
	{
    FileAppend, WindowMode=1`n
    
	}
	
	else if InStr(A_LoopReadLine, "VSync=")
	{
    FileAppend, VSync=2`n
    
	} 
	
	else if InStr(A_LoopReadLine, "DataCenterHint=")
	{
    FileAppend, DataCenterHint=playfab/eastasia`n
    
	}

	else if InStr(A_LoopReadLine, "FPSLimit=")
	{
    FileAppend, FPSLimit=30`n
    
	}

	else if InStr(A_LoopReadLine, "Monitor=")
	{
	
	SysGet, OutputVar, MonitorPrimary
	SysGet, OutputVar2, MonitorCount
	OutputVar2 -= OutputVar
	
    FileAppend, Monitor=%OutputVar2%`n
    
	}
	else{
	
	FileAppend, %A_LoopReadLine%`n
	
	}
	
	} 	 
			
		
	FileMove, %configTmpLocation%, %configLocation%, 1
}

findGameLocation(gameLocation){

FileSelectFile, gameLocation,,, "Select the game executable "RainbowSix.exe" or the game shortcut"

if FileExist(gameLocation){
return gameLocation
}else {
return
}
}

findConfigLocation(configLocation){

FileSelectFolder, configLocation, 0,0, "Select your RainbowSix - Siege config folder of your profile"

configCheckLocation = %configLocation%\GameSettings.ini

if FileExist(configCheckLocation){
return configLocation
}else {
return
}

}


cleanup:

if FileExist(cleanupLocation){


Run, %middleManLocation%

ExitApp

} else {

ExitApp

}


      

	  








