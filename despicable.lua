local discordia = require('discordia')
local despicable = discordia.Client()

local prefix = ''
local logs = ''
local token = ''

despicable:on('ready', function()
	print('Logged in as '.. despicable.user.username)
end)

-- link awesome documentation
despicable:on('messageCreate', function(self)
	if self.content == prefix .. 'stable' then
		self.channel:send('https://awesomewm.org/doc/api/')
	end

	if self.content == prefix .. 'master' then
		self.channel.send('https://awesomewm.org/apidoc/')
	end

end)

-- show user manual
despicable:on('messageCreate', function(self)
	if self.content == prefix .. 'man' then
		self.channel:send {
			embed = {
				title = 'man despicable';
				color = 0x3498db;
				description = 'Manual for our Awesome bot, all commands are prefixed with `' ..prefix.. '`';
				fields = {
					{
						name = 'stable',
						value = 'link stable API docs',
						inline = false
					},
					{
						name = 'master',
						value = 'link master API docs',
						inline = false
					},
					{
						name = 'man',
						value = 'Manual for this bot',
						inline = false
					},
				},
				footer = {
					text = self.guild.name,
					icon_url = self.guild.iconURL
				},
				timestamp = discordia.Date():toISO('T', 'Z')
			}
		}
	end
end)

-- log deleted messages
despicable:on('messageDelete', function(self)
	local channels = self.guild.textChannels

	channels:get(logs):send {
		embed = {
			title = 'Deleted by '.. self.author.tag .. ' In #'.. self.channel.name;
			color = 0xff0000;
			thumbnail = {
				url = self.author.avatarURL
			},
			image = {
				url = self.attachment.url
			},
			description = self.content,
		}
	}
end)

despicable:run("Bot " .. token)
