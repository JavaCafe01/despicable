local Date = require('discordia').Date

CLIENT:on('messageUpdate', function(msg)
	local channels = msg.guild.textChannels

	channels:get(CONFIG.log_channel):send {
		embed = {
			title = 'Edited by '.. msg.author.tag .. ' in #'.. msg.channel.name;
			color = 0x00ff00,
			thumbnail = {
				url = msg.author.avatarURL
			},
			image = {
				url = (msg.attachment and msg.attachment.url or '')
			},
			description = "`Original:` " .. msg.oldContent[msg.editedTimestamp] .. "\n `Edited:` " .. msg.content,
			footer = {
				text = Date(Date.parseISO(msg.timestamp)):toString("%a, %b %d %Y, %T GMT%z (%Z)")
			}
		}
	}
end)