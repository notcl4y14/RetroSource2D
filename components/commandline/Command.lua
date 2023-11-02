local Command = {
	Name = "",
	Action = function(self, args)end,
	Properties = {
		HelpInfo = ""
	}
}
Command.__index = Command

function Command.new(self, Name, Action, Properties)
	local obj = setmetatable({}, self)

	local Properties = Properties or {}

	obj.Name = Name
	obj.Action = Action or self.Action

	for key, val in pairs(Properties) do
		obj.Properties[key] = val
	end

	return obj
end

return Command