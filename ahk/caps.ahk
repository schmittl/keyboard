; Inspired by / Credit goes to
; Danik @ http://danikgames.com/blog/?p=714
; Gustavo Duarte @ http://duartes.org/gustavo/blog/post/home-row-computing/
;
; Functionality of this script:
; - Deactivates the normal Capslock functionality
; - Lets Capslock instead act like an additional modifier
; - Provides the following functions while Capslock is pressed:
;	            ; -> ö
;               ' -> ä
;	            [ -> ü
;	   h, j, k, l -> left, down, up, right
;	         u, o -> Home, End
;            z, p -> PageUp, PageDown
;	            i -> Delete
;	      Windows -> Capslock
; - This script relies on a custom qwertz based layout of the keyboard

#Persistent
SetCapsLockState, AlwaysOff

; Programs in which the Key mappings are disabled
GroupAdd, Virtual_Software_Window, ahk_exe VirtualBox.exe
GroupAdd, Virtual_Software_Window, ahk_exe vmware.exe

Loop
{
IfWinActive, ahk_group Virtual_Software_Window
	Suspend, On
WinWaitNotActive, ahk_group Virtual_Software_Window
	Suspend, Off
}

; Key mappings

; Capslock + hjkl (left, down, right, up)
Capslock & h::Send {Blind}{Left DownTemp}
Capslock & h up::Send {Blind}{Left Up}

Capslock & j::Send {Blind}{Down DownTemp}
Capslock & j up::Send {Blind}{Down Up}

Capslock & k::Send {Blind}{Up DownTemp}
Capslock & k up::Send {Blind}{Up Up}

Capslock & l::Send {Blind}{Right DownTemp}
Capslock & l up::Send {Blind}{Right Up}


; Capslock + iuop; (delete, home, end, pgdown, pgup)
Capslock & u::SendInput {Blind}{Home Down}
Capslock & u up::SendInput {Blind}{Home Up}

Capslock & i::SendInput {Blind}{Delete Down}
Capslock & i up::SendInput {Blind}{Delete Up}

Capslock & o::SendInput {Blind}{End Down}
Capslock & o up::SendInput {Blind}{End Up}

Capslock & p::SendInput {Blind}{PgDn Down}
Capslock & p up::SendInput {Blind}{PgDn Up}

Capslock & z::SendInput {Blind}{PgUp Down}
Capslock & z up::SendInput {Blind}{PgUp Up}

; Capslock + ;'[ (öäü)
Capslock & `;::SendInput {Blind}{ö Down}
Capslock & `; up::SendInput {Blind}{ö Up}

Capslock & '::SendInput {Blind}{ä Down}
Capslock & ' up::SendInput {Blind}{ä Up}

Capslock & [::SendInput {Blind}{ü Down}
Capslock & [ up::SendInput {Blind}{ü Up}


; Make Win Key + Capslock work like Capslock
RWin & Capslock::
If GetKeyState("CapsLock", "T") = 1
    SetCapsLockState, AlwaysOff
Else
    SetCapsLockState, AlwaysOn
Return

; Make Ctrl + Space force always-on-top on a window
; ^SPACE::  Winset, Alwaysontop, , A
