command.Register("docs", "Get the links for the AwesomeWM docs", function(msg, args)
	local total_arg = table.concat(args, " ")
    if total_arg == 'stable' then
		msg.channel:send('https://awesomewm.org/doc/api/')
	end
	if total_arg == 'master' then
		msg.channel:send('https://awesomewm.org/apidoc/')
	end
end)