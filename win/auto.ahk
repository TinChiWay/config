#Requires AutoHotkey v2.0


>!i::Run "C:\Program Files\JetBrains\IntelliJ IDEA 2022.3.2\bin\idea64.exe"

;>!w::Run "C:\Program Files (x86)\Tencent\WeChat\WeChat.exe"

>!q::Run "C:\Program Files (x86)\Tencent\QQMusic\QQMusic.exe"

>!d::
{
	if WinExist("datagrip")
		WinActivate
	else
		Run "C:\Program Files\JetBrains\DataGrip 2022.3.3\bin\datagrip64.exe"
}

>!g::
{
	if WinExist("Google Chrome")
		WinActivate
	else
		Run "C:\Program Files\Google\Chrome\Application\chrome.exe"
}

>!s::
{
	if WinExist("Sublime Text")
		WinActivate
	else
		Run "C:\Program Files\Sublime Text\sublime_text.exe"
}

>!t::Run "wt.exe"
