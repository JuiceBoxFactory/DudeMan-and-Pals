import funkin.backend.utils.DiscordUtil;

function onReady() {
	DiscordUtil.changePresenceAdvanced({
		details: "Play My Mod",
		state: "pls",
		largeImageKey: "icon"
	});
}

function onDiscordPresenceUpdate(e) {
	var data = e.presence;

	if(data.button1Label == null)
		data.button1Label = "DOWNLOAD MY MOD NOW - dudeman";
	if(data.button1Url == null)
		data.button1Url = "https://gamebanana.com/mods/518286";
	if(data.button2Label == null)
		data.button2Label = "wait follow our twitter pllssss";
	if(data.button2Url == null)
		data.button2Url = "https://x.com/JuiceBoxFactory";
}