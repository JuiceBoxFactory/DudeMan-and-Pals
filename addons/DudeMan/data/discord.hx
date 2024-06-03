import funkin.backend.utils.DiscordUtil;

function onReady() {
	DiscordUtil.changePresenceAdvanced({
		state: "Fortnite",
		details: "Battle Royale - In Lobby",
		smallImageText: "Made you look haha",
		smallImageKey: "icon",
		largeImageKey: "icon"
	});
}

function onDiscordPresenceUpdate(e) {
	var data = e.presence;

	if(data.button1Label == null)
		data.button1Label = "Join us <3";
	if(data.button1Url == null)
		data.button1Url = "https://discord.gg/2NTCdsQvx4";
}