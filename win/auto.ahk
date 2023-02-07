#Requires AutoHotkey v2.0


>!i::Run "C:\Program Files\JetBrains\IntelliJ IDEA 2022.3.2\bin\idea64.exe"

>!w::Run "C:\Program Files (x86)\Tencent\WeChat\WeChat.exe"

>!g::Run "C:\Program Files\Google\Chrome\Application\chrome.exe"

>!s::
{
	if WinExist("Sublime Text")
		WinActivate
	else
		Run "C:\Program Files\Sublime Text\sublime_text.exe"
}

>!t::Run "C:\Program Files\PowerShell\7\pwsh.exe"

PgDn::End


ih := InputHook("L1 M T0.3","{Esc}")
RCtrl::{
	ih.Start()
	reason := ih.Wait()
	if(reason = "Stopped"){
		Send "{Esc}"
	}
	if(ih.EndReason = "Max"){
		Send "{Blind}{RCtrl Down}" ih.Input
	}
}

RCtrl Up::{

	Send "{RCtrl up}"
	ih.stop()

}