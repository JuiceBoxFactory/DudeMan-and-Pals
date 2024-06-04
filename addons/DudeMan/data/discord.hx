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

	preStateSwitch();

	if(data.button1Label == null)
		data.button1Label = "wait follow our twitter pllssss";
	if(data.button1Url == null)
		data.button1Url = "https://x.com/JuiceBoxFactory";
}