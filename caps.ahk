; Autohotkey Capslock Remapping Script 
; Credit goes to Danik @ danikgames.com and Gustavo Duarte @ duartes.org
; 
; Functionality:
; - Deactivates capslock for normal use.
; - Access the following functions when pressing Capslock:
;	;, ', [ 	-> ö, ä, ü
;	Cursor Keys	-> hjkl (left, down, up, right)
;	Home, End 	-> u, o
;	PageUp, PageDown-> z, p
;	Delete		-> i
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
#Capslock::
If GetKeyState("CapsLock", "T") = 1
    SetCapsLockState, AlwaysOff
Else 
    SetCapsLockState, AlwaysOn
Return