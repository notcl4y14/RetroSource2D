local lovepatch = require("lib/lovepatch/lovepatch")
local MouseHover = require("utils/MouseHover")

local arrow = love.mouse.getSystemCursor("arrow")
local sizenwse = love.mouse.getSystemCursor("sizenwse")

local Panel = {
	X = 0,
	Y = 0,
	Width = 0,
	Height = 0,
	Patch = nil,

	MouseLock = "",
	MouseLockProps = {},
	Options = {
		Resizable = false,
		Movable = false
	}
}
Panel.__index = Panel

function Panel.new(self, X, Y, Width, Height, Patch, Options)
	local obj = setmetatable({}, self)

	local Patch = Patch or {}
	local Options = Options or {}
	local PatchImage = Patch.Image or "components/ui/assets/PanelResizable.png"
	local PatchWidth = Patch.Width or 11
	local PatchHeight = Patch.Height or 11

	obj.X = X
	obj.Y = Y
	obj.Width = Width
	obj.Height = Height

	obj.Patch = lovepatch.load(PatchImage, PatchWidth, PatchHeight)

	for key, val in pairs(Options) do
		-- if obj.Options[key] then
		obj.Options[key] = val
		-- end
	end

	return obj
end

function Panel.Update(self, dt)
	-- for some reason without calling this resizing won't work
	-- if you move the cursor quickly after clicking
	self:MouseMoved(0, 0)
end

function Panel.MouseMoved(self, dx, dy)
	love.mouse.setCursor(arrow)

	if self.MouseLock == "" then

		if self.Options.Movable then
			if MouseHover(self.X, self.Y, self.Width, 15) then
				if love.mouse.isDown(1) then
					self.MouseLock = "Move"
				end
			end
		end

		if self.Options.Resizable then
			if
				MouseHover(self.X + self.Width - 10, self.Y + self.Height - 10, 10, 10)
			then
				love.mouse.setCursor(sizenwse)

				if love.mouse.isDown(1) then
					self.MouseLock = "Size"
				end
			end
		end

	end

	if not love.mouse.isDown(1) then
		self.MouseLock = ""
		self.MouseLockProps = {}
	end

	if self.MouseLock ~= "" then
		if self.MouseLock == "Size" then
			love.mouse.setCursor(sizenwse)
			self.Width = self.Width + dx
			self.Height = self.Height + dy
		elseif self.MouseLock == "Move" then
			self.X = self.X + dx
			self.Y = self.Y + dy
		end
	end
end

function Panel.Draw(self)
	lovepatch.draw(self.Patch, self.X, self.Y, self.Width, self.Height)
end

return Panel