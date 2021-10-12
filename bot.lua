local fs = require('fs')
local json = require('json')
local discordia = require('discordia')
local client = discordia.Client()

require "secrets"

client:on('ready', function()
	print('Logged in as '.. client.user.username)
end)

client:on('messageCreate', function(message)
	if message.content == '!ping' then
		message.channel:send('Pong!')
	end
end)

client:run("Bot " .. BOT_TOKEN)