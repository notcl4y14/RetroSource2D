local CLI = {}

CLI.Command = require("components/commandline/command")
CLI.Commands = {}
CLI.AddCommand = function(self, command)
	table.insert(self.Commands, command)
end

return CLI