; Autohotkey Capslock Remapping Script 
; Credit goes to Danik @ danikgames.com and Gustavo Duarte @ duartes.org
; 
; Functionality:
; - Deactivates capslock for normal use.
; - Access the following functions when pressing Capslock:
;	Cursor Keys	-> hjkl (left, down, up, right)
;	Home, End 	-> u,o
;	PageUp, PageDown-> p,ö
;	Delete		-> i
;	Escape		-> f
;	Windows 	-> Capslock
#Persistent
SetCapsLockState, AlwaysOff


; Capslock + hjkl (left, down, right, up)
Capslock & h::Send {Blind}{Left DownTemp}
Capslock & h up::Send {Blind}{Left Up}

Capslock & j::Send {Blind}{Down DownTemp}
Capslock & j up::Send {Blind}{Down Up}

Capslock & k::Send {Blind}{Up DownTemp}
Capslock & k up::Send {Blind}{Up Up}

Capslock & l::Send {Blind}{Right DownTemp}
Capslock & l up::Send {Blind}{Right Up}


; Capslock + iuopö (delete, home, end, pgdown, pgup)
Capslock & u::SendInput {Blind}{Home Down}
Capslock & u up::SendInput {Blind}{Home Up}

Capslock & i::SendInput {Blind}{Delete Down}
Capslock & i up::SendInput {Blind}{Delete Up}

Capslock & o::SendInput {Blind}{End Down}
Capslock & o up::SendInput {Blind}{End Up}

Capslock & p::SendInput {Blind}{PgUp Down}
Capslock & p up::SendInput {Blind}{PgUp Up}

Capslock & ö::SendInput {Blind}{PgDn Down}
Capslock & ö up::SendInput {Blind}{PgDn Up}

; Capslock + 7890 ( {[]} )
Capslock & 7::SendInput {Blind}{{ Down}
Capslock & 7 up::SendInput {Blind}{{ Up}

Capslock & 8::SendInput {Blind}{[ Down}
Capslock & 8 up::SendInput {Blind}{[ Up}

Capslock & 9::SendInput {Blind}{] Down}
Capslock & 9 up::SendInput {Blind}{] Up}

Capslock & 0::SendInput {Blind}{} Down}
Capslock & 0 up::SendInput {Blind}{} Up}

; Make Win Key + Capslock work like Capslock
#Capslock::
If GetKeyState("CapsLock", "T") = 1
    SetCapsLockState, AlwaysOff
Else 
    SetCapsLockState, AlwaysOn
Return

; Capslock + f (Escape)
Capslock & f::SendInput {Blind}{Escape Down}
Capslock & f up::SendInput {Blind}{Escape Up}