local discordia = require('discordia')
local despicable = discordia.Client()

local prefix = '!'
local logs = ''
local token = ''

despicable:on('ready', function()
	print('Logged in as '.. despicable.user.username)
end)

-- link awesome documentation
despicable:on('messageCreate', function(self)
	if self.content == prefix .. 'docs stable' then
		self.channel:send('https://awesomewm.org/doc/api/')
	end

<<<<<<< HEAD
	if self.content == prefix .. 'docs master' then
=======
	if self.content == prefix .. 'master' then
>>>>>>> 44d77bbc1e5d8df57aa53cf15a79e9e3a7561a08
		self.channel:send('https://awesomewm.org/apidoc/')
	end

end)

-- show user manual
despicable:on('messageCreate', function(self)
	if self.content == prefix .. 'man' then
		self.channel:send {
			embed = {
				title = '';
				color = 0x3498db;
				description = 'This is our bot for the AwesomeWM discord server. All commands are prefixed with `' ..prefix.. '`.';
				author = {
					name = despicable.user.username,
					icon_url = despicable.user.avatarURL
				},
                fields = {
					{
						name = 'docs stable',
						value = 'A link to AwesomeWM\'s stable API docs',
						inline = false
					},
					{
						name = 'docs master',
						value = 'A link to AwesomeWM\'s master API docs',
						inline = false
					},
					{
						name = 'man',
						value = 'Commands manual for this bot',
						inline = false
					},
				},
				footer = {
					text = self.guild.name
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
