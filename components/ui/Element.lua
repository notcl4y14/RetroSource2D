local Element = {
	X = 0,
	Y = 0,
	Width = 0,
	Height = 0
}
Element.__index = Element

function Element.new(self, X, Y, Width, Height)
	local obj = setmetatable({}, self)

	obj.X = X
	obj.Y = Y
	obj.Width = Width
	obj.Height = Height

	return obj
end

return Element