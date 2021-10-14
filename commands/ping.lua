command.Register("ping", "Pong", function(msg, args)
	msg.channel:send("Pong")
end)