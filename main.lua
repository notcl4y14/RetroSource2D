function love.load()
	love.graphics.setDefaultFilter("nearest")
	Source = require("components/Source")
	tree = Source.UI.Tree:new("main")
	tree:Add(Source.UI.Panel:new(20, 20, 200, 50, nil, {Resizable = true, Movable = true}))
end

function love.update(dt)
	tree:Update(dt)
end

function love.draw()
	love.graphics.clear(0.9, 0.9, 0.9)
	tree:Draw()
end

function love.mousemoved(x, y, dx, dy, istouch)
	tree:MouseMoved(dx, dy)
end