
function onInit()
	if User.isHost() then
		tButton = {}
		tButton["class"]      = "PlayLang_wndclass"
		tButton["path"]       = ""
		tButton["sIcon"]       = "button_speak"
		tButton["sIcon_down"]  = "button_speak_down"
		DesktopManager.registerSidebarToolButton(tButton)
	end
end
