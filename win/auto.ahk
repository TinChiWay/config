#Requires AutoHotkey v2.0


>!i::Run "C:\Program Files\JetBrains\IntelliJ IDEA 2022.3.2\bin\idea64.exe"

>!w::Run "C:\Program Files (x86)\Tencent\WeChat\WeChat.exe"

>!g::Run "C:\Program Files\Google\Chrome\Application\chrome.exe"

>!s::Run "C:\Program Files\Sublime Text\sublime_text.exe"

>!t::Run "C:\Program Files\PowerShell\7\pwsh.exe"



ih := InputHook("L1 M T0.3","{Esc}")
Ctrl::{
	ih.Start()
	reason := ih.Wait()
	if(reason = "Stopped"){
		Send "{Esc}"
	}
	if(ih.EndReason = "Max"){
		Send "{Blind}{Ctrl Down}" ih.Input
	}
}

Ctrl Up::{

	Send "{Ctrl up}"
	ih.stop()

}