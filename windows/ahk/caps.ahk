; Inspired by / Credit goes to
; Danik @ http://danikgames.com/blog/?p=714
; Gustavo Duarte @ http://duartes.org/gustavo/blog/post/home-row-computing/
;
; This script relies on my custom qwertz based layout of the keyboard
;
; Functionality of this script:
; - Deactivates the normal Capslock functionality
; - Lets Capslock instead act like an additional modifier
; - Provides the following hotkey functions while Capslock is pressed:
;                ; -> ö
;                ' -> ä
;                [ -> ü
;       h, j, k, l -> left, down, up, right
;             u, o -> Home, End
;             z, p -> PageUp, PageDown
;                i -> Delete
;    Right Windows -> Capslock
#Requires AutoHotkey v2.0

; Prevents the script from exiting automatically
Persistent

; Forces Capslock to stay off permanently
SetCapsLockState("AlwaysOff")

; All following hotkeys are only active outside of Virtualbox
#HotIf !WinActive("ahk_exe VirtualBoxVM.exe")

; Capslock + h => left
Capslock & h:: Send("{Blind}{Left DownTemp}")
Capslock & h up:: Send("{Blind}{Left Up}")

; Capslock + j => down
Capslock & j:: Send("{Blind}{Down DownTemp}")
Capslock & j up:: Send("{Blind}{Down Up}")

; Capslock + k => down
Capslock & k:: Send("{Blind}{Up DownTemp}")
Capslock & k up:: Send("{Blind}{Up Up}")

; Capslock + l => right
Capslock & l:: Send("{Blind}{Right DownTemp}")
Capslock & l up:: Send("{Blind}{Right Up}")


; Capslock + u => home
Capslock & u:: SendInput("{Blind}{Home Down}")
Capslock & u up:: SendInput("{Blind}{Home Up}")

; Capslock + i => delete
Capslock & i:: SendInput("{Blind}{Delete Down}")
Capslock & i up:: SendInput("{Blind}{Delete Up}")

; Capslock + o => end
Capslock & o:: SendInput("{Blind}{End Down}")
Capslock & o up:: SendInput("{Blind}{End Up}")

; Capslock + p => page down
Capslock & p:: SendInput("{Blind}{PgDn Down}")
Capslock & p up:: SendInput("{Blind}{PgDn Up}")

; Capslock + z => page up
Capslock & z:: SendInput("{Blind}{PgUp Down}")
Capslock & z up:: SendInput("{Blind}{PgUp Up}")


; Capslock + ; => ö
Capslock & `;:: SendInput("{Blind}{ö Down}")
Capslock & `; up:: SendInput("{Blind}{ö Up}")

; Capslock + ' => ä
Capslock & ':: SendInput("{Blind}{ä Down}")
Capslock & ' up:: SendInput("{Blind}{ä Up}")

; Capslock + [ => ü
Capslock & [:: SendInput("{Blind}{ü Down}")
Capslock & [ up:: SendInput("{Blind}{ü Up}")


; Make RWin Key + Capslock toggle Capslock
RWin & Capslock::
{
    If GetKeyState("CapsLock", "T") = 1
        SetCapsLockState("AlwaysOff")
    Else
        SetCapsLockState("AlwaysOn")
    Return
}

; Rest is commented out as it does seem to work properly

; Following hotkeys are only active inside Virtualbox
;#HotIf WinActive("ahk_exe VirtualBoxVM.exe")

;setCapsLockState("Off")
;~Capslock::
;{
;    KeyWait("CapsLock")
;    SetCapsLockState("Off")
;    return
;}
