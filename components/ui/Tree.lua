local Tree = {
	ID = nil,
	Body = {}
}
Tree.__index = Tree

function Tree.new(self, ID)
	local obj = setmetatable({}, self)

	obj.ID = ID

	return obj
end

function Tree.Add(self, element)
	table.insert(self.Body, element)
end

function Tree.Update(self, dt)
	for _, element in pairs(self.Body) do
		element:Update(dt)
	end
end

function Tree.MouseMoved(self, dx, dy)
	for _, element in pairs(self.Body) do
		element:MouseMoved(dx, dy)
	end
end

function Tree.Draw(self)
	for _, element in pairs(self.Body) do
		element:Draw()
	end
end

return Tree