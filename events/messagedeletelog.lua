local Date = require('discordia').Date

CLIENT:on('messageDelete', function(msg)
	local channels = msg.guild.textChannels

	channels:get(CONFIG.log_channel):send {
		embed = {
			title = 'Deleted by '.. msg.author.tag .. ' in #'.. msg.channel.name;
			color = 0xff0000,
			thumbnail = {
				url = msg.author.avatarURL
			},
			image = {
				url = (msg.attachment and msg.attachment.url or '')
			},
			description = msg.content,
			footer = {
				text = Date(Date.parseISO(msg.timestamp)):toString("%a, %b %d %Y, %T GMT%z (%Z)")
			}
		}
	}
end)