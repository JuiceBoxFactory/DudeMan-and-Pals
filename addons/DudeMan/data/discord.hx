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
}