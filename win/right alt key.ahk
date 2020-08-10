#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SetTitleMatchMode 2    

Activate(t)
{
  IfWinActive,%t%
  {
    WinMinimize
    return
  }
  SetTitleMatchMode 2    
  DetectHiddenWindows,on
  IfWinExist,%t%
  {
    WinShow
    WinActivate           
    return 1
  }
  return 0
}

ActivateAndOpen(t,p)
{
  if Activate(t)==0
  {
    Run %p%
    WinActivate
    return
  }
}

>!i::ActivateAndOpen("IntelliJ IDEA","C:\Program Files\JetBrains\IntelliJ IDEA 2020.1\bin\idea64.exe")

>!o::ActivateAndOpen("Notion","C:\Users\tinchiway\AppData\Local\Programs\Notion\Notion.exe")

>!t::ActivateAndOpen("Windows Terminal","wt")

>!w::ActivateAndOpen("微信","C:\Program Files (x86)\Tencent\WeChat\WeChat.exe")

>!g::ActivateAndOpen("Google Chrome","C:\Program Files (x86)\Google\Chrome\Application\chrome.exe")

>!s::ActivateAndOpen("Sublime Text 3","C:\Program Files\Sublime Text 3\sublime_text.exe")

>!b::ActivateAndOpen("京东读书","C:\Program Files (x86)\JdReader\JdReader.exe")

CapsLock::Esc
CapsLock & e::End
CapsLock & a::Home
CapsLock & v::^v
CapsLock & c::^c
CapsLock & x::^x
CapsLock & z::^z
CapsLock & p::Up
CapsLock & n::Down
CapsLock & b::Left
CapsLock & f::Right