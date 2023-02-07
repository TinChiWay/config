#Requires AutoHotkey v2.0


>!i::Run "C:\Program Files\JetBrains\IntelliJ IDEA 2022.3.2\bin\idea64.exe"

>!w::Run "C:\Program Files (x86)\Tencent\WeChat\WeChat.exe"

>!q::Run "C:\Program Files (x86)\Tencent\QQMusic\QQMusic.exe"

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

ih := InputHook("L1 M T0.3","{Esc}")
RCtrl::{
	ih.Start()
	reason := ih.Wait()
	if(reason = "Stopped"){
		Send "{Esc}"
	}else if(ih.EndReason = "Max"){
		if(ih.Input = "A"){
			Send "{Home}"
		}else if(ih.Input = "B"){
			Send "{Left}"
		}else if (ih.Input = "E"){
			Send "{End}"
		}else if (ih.Input = "N"){
			Send "{Down}"
		}else if (ih.Input = "P"){
			Send "{Up}"
		}
		else{
			Send "{RCtrl Down}" ih.Input
		}
	}
}

RCtrl Up::{

	Send "{RCtrl up}"
	ih.stop()

}