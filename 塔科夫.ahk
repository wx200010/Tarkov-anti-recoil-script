#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
$F9::Reload
$F11::suspend
SearchIdx := 0

$F3::
    Send {Shift Down}
    Loop
    {
        If Not GetKeyState("F3", "P")
        {
            Break
        }
        Click
        Sleep 60
    }

    Send {Shift Up}
    Sleep 50
Return


+F2::
    BlockInput, MouseMove
    Click
    Sleep 50
    Send {Tab}
    Sleep 50
    Send {Ctrl Down}
    Sleep 50
    MouseMove, 833, 783
    Sleep 150
    Click
    Sleep 40
    Click
    Sleep 40
    Click
    Sleep 40
    Click
    Sleep 40
    Click
    Sleep 40
    Click
    Sleep 40
    Click
    Sleep 40
    Click
    Sleep 40
    Click
    Sleep 40
    Send {Ctrl Up}
    Sleep 100
    BlockInput, MouseMoveOff

Return
#MaxThreadsPerHotkey 1
CapsLock::	;快速搜尋
    Loop 
    {
        Loop
        {
            MouseGetPos, tx , ty
            MouseMove , tx-28 ,  ty
            Sleep 30
            If Not GetKeyState("CapsLock", "P")
            {
                MouseGetPos, tx , ty
                Return
            }
            Click
            Sleep 30
            MouseMove , tx ,  ty
            Sleep 30
            Click
            If Not GetKeyState("CapsLock", "P")
            {
                MouseGetPos, tx , ty
                Return
            }
            Sleep 30
        }
    }
Return
$F2::
    Send {Ctrl Down}
    Loop
    {
        If Not GetKeyState("F2", "P")
        {
            Break
        }
        Click
        Sleep 60
    }

    Send {Ctrl Up}
Return

#MaxThreadsPerHotkey 1
$F1::	;清背包
    MouseGetPos, tx , ty
    MouseGetPos, Target1x , Target1y
    ItemStartX := 1266
    ItemStartY := 82
    BoxX := 748
    BoxY := 355
    ItemError := 63
    BlockInput, MouseMove
    i := (Target1y-(ItemStartY) )//ItemError
    j := (Target1x-(ItemStartX) )//ItemError
    if(i<=0 )
        i := 0
    if(j<=0)
        j := 0  

    Loop 
    {
        Loop
        {
            If Not GetKeyState("F1", "P")
            {
                BlockInput, MouseMoveOff
                MouseMove , tx , ty
                Return
            }
            X := ItemStartX + ItemError*j + ItemError//2
            Y := ItemStartY + ItemError*i + ItemError//2
            MouseMove , X ,  Y 
            Sleep 30
            Click, Down
            Sleep 30
            MouseMove , BoxX ,  BoxY 
            Sleep 30
            Click, Up
            Sleep 30

            j := j+1
            if(j>=10)
                Break
        }
        j := 0
        i := i+1
        if (i>=15)
            Break
    }
    BlockInput, MouseMoveOff
    MouseMove , tx , ty
Return

; +G::	;檢查顏色跟座標, 血水擺1
;     PressKey := ! PressKey
;     If ! PressKey 
;         Return
;     ToolTip , MouseGetPos On
;     SetTimer , RemoveToolTip , 1000
;     Loop{
;         If ! PressKey{
;             Break
;         } 
;         MouseGetPos , xpos , ypos 
;         PixelGetColor, color , %xpos%, %ypos%

;         ; PixelGetColor, color , 1010, 588    
;         Blue:="0x" SubStr(color,3,2)
;         Blue:=Blue+0
;         Green:="0x" SubStr(color,5,2)
;         Green:=Green+0
;         Red:="0x" SubStr(color,7,2)
;         Red:=Red + 0
;         ToolTip , "123123123123" %xpos% %ypos% %Blue% %Green% %Red% %color%

;     }

;     ToolTip , MouseGetPos Off
;     SetTimer , RemoveToolTip , 1000
; Return
$F4::
    Send {Alt Down}
    Sleep 20
    Send {F4}
    Sleep 20
    Send {Alt Up}
    Sleep 20
Return
RemoveToolTip:
    SetTimer, RemoveToolTip, Off
    ToolTip
return
