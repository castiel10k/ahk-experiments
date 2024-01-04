mouseXTurn:=100
mouseYTurn:=340


if WinExist("Rainbow Six"){

IfWinNotActive, Rainbow Six
{
WinActivate, Rainbow Six
}

}

Send, {Ctrl Down} 
sleep, 1500
Send, {Ctrl Up} 
sleep, 500

Send, {w Down} 

Send, {4 Down}

sleep, 6000

Send, {4 Up}

Send, {w Up} 

sleep, 500

Send, {MButton Down} 

sleep,  500

Send, {MButton Up} 

sleep,  500

mouseMove, mouseXTurn, mouseYTurn, 0