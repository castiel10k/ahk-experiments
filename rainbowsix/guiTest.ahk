Gui, Add, Radio, vMyRadioGroup, asia east
Gui, Add, Radio, , asia south east
Gui, Add, Radio, , japan west
Gui, Add, Radio, , brazil sout
Gui, Add, Button, default xm, OK
Gui, Show
return



ButtonOK:

GuiClose:
GuiEscape:
Gui, Submit

IfWinNotExist Inbox - Microsoft Outlook
return ; Outlook isn't open to the right section, so do nothing.
WinActivate ; Activate the window found by the above command.
Send ^n ; Create new/blank e-mail via Control+N.
WinWaitActive Untitled Message
Send {Tab 2}Data Fix Estimate: XXX: WO 00000: ; Set the subject line.
}
else if vMyRadioGroup=2
{
Send ^n ; Create new/blank e-mail via Control+N.
WinWaitActive Untitled Message
Send {Tab 2}Non-Billable Data Fix: XXX: WO 00000: ; Set the subject line.
}
else
{
Send ^n ; Create new/blank e-mail via Control+N.
WinWaitActive Untitled Message
Send {Tab 2}ASAP Data Fix Estimate: XXX: WO 00000: ; Set the subject line.
}
return