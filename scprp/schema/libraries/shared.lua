lia.chat.register("mind", {
	onChatAdd = function(_, text)
		chat.AddText(Color(115, 115, 115), "**\""..text.."\"")
	end,
	onCanHear = 1,
	prefix = {"/mind"},
	font = "liaChatFontItalics",
	filter = "actions",
	deadCanChat = true
})