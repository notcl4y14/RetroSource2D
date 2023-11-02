local CheckCollision = require("utils/CheckCollision")

local function MouseHover(x1, y1, w1, h1, mouseX, mouseY)
	local mouseX = mouseX or love.mouse.getX()
	local mouseY = mouseY or love.mouse.getY()

	return CheckCollision(x1, y1, w1, h1, mouseX, mouseY, 0, 0)
end

return MouseHover