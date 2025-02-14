local EventHandler = {}

EventHandler.guiElements = {}

EventHandler.activeScenes = {}

function EventHandler:addEventReactor(reactorElement)
	table.insert(self.guiElements, reactorElement)
end

function EventHandler:handle()
	for _, element in ipairs(self.guiElements) do
		if not element.enabled or not element.visible then
			goto continue
		end

		--mouse
		local mouseX, mouseY = love.mouse.getPosition()
		local mouseOnElement = element:mouseInArea(mouseX, mouseY)

		if element.onHover then
			element:onHover(mouseOnElement)
		end

		if mouseOnElement then
			local leftMouseWasDown = element.mouseDown.left
			local rightMouseWasDown = element.mouseDown.right
			local leftMouseUp = false
			local rightMouseUp = false

			if element.onMouseUp and leftMouseWasDown and not love.mouse.isDown(1) then
				element.mouseDown.left = false
				element:onMouseUp(1)
				leftMouseUp = true
			end
			if element.onMouseUp and rightMouseWasDown and not love.mouse.isDown(2) then
				element.mouseDown.right = false
				element:onMouseUp(2)
				rightMouseUp = true
			end

			if element.onMouseDown and love.mouse.isDown(1) then
				element.mouseDown.left = true
				element:onMouseDown(1)
			end
			if element.onMouseDown and love.mouse.isDown(2) then
				element.mouseDown.right = true
				element:onMouseDown(2)
			end

			if element.onClick and leftMouseWasDown and leftMouseUp then
				element:onClick(1)
			end
			if element.onClick and rightMouseWasDown and rightMouseUp then
				element:onClick(2)
			end
		end
		--
		-- keyboard

		::continue::
	end
end

return EventHandler

