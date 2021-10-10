local fs = require('fs')
local json = require('json')
local discordia = require('discordia')
local client = discordia.Client()

local cfg = json.decode(fs.readFileSync('config.json'))

client:on('ready', function()
	print('Logged in as '.. client.user.username)
end)

client:on('messageCreate', function(message)
	if message.content == '!ping' then
		message.channel:send('Pong!')
	end
end)

client:run("Bot " .. cfg.token)