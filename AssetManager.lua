local AssetManager = {}

AssetManager.loaded = false

AssetManager.textures = {}

AssetManager.textureNotFoundTexture = {}

function AssetManager:load(directoryPath)
    local files = love.filesystem.getDirectoryItems(directoryPath)

    for i = 1, #files, 1 do
        files[i] = directoryPath .. "/" .. files[i]
    end

    for _,file in ipairs(files) do
        if love.filesystem.getInfo(file).type == "file" then
            if file:sub(-4) == ".png" or file:sub(-4) == ".jpg" then
                local fileName = file:match("^.+[/\\](.+)%.%w+$")
                self.textures[fileName] = love.graphics.newImage(file)
                require("DebugInfo"):addToOutputFile("assets", fileName)
            end
        elseif love.filesystem.getInfo(file).type == "directory" then
            require("DebugInfo"):addToOutputFile("assets", file)
            self:load(file)
        end
    end

    self.loaded = true
end

function AssetManager:get(textureName)
    if self.textures[textureName] then
        return self.textures[textureName]
    else
        if self.textureNotFoundTexture[textureName] == nil then
            self.textureNotFoundTexture[textureName] = self:createTexture(textureName)
            return self.textureNotFoundTexture[textureName]
        else
            return self.textureNotFoundTexture[textureName]  
        end
    end
end


local textureNotFoundWidth = love.graphics.getFont():getWidth("<textureNotFound>")

function AssetManager:createTexture(displayText)
    local canvas = love.graphics.newCanvas(textureNotFoundWidth,love.graphics.getFont():getHeight()*2)
    love.graphics.setCanvas(canvas)
    love.graphics.clear()
    love.graphics.setColor(1,1,1)
    love.graphics.rectangle("line", 0, 0, canvas:getWidth(), canvas:getHeight())
    displayText = "<textureNotFound>\n\"" .. displayText .. "\""
    love.graphics.print(displayText, 0, 0)
    love.graphics.setCanvas()
    return canvas
end


return AssetManager


