-- Create a new project
fusion = Fusion()
fusion:LoadComp("")

-- Create a new timeline
comp = fusion:GetCurrentComp()
timeline = comp:AddTool("Timeline")

-- Import SVG files
filePaths = { "C:/Users/tkame/OneDrive/Afbeeldingen/img/cat.svg" } -- Replace with the appropriate file path of the SVG file
for i, filePath in ipairs(filePaths) do
    local success, loader = pcall(comp.AddTool, comp, "Loader", {
        Clip = filePath,
        Name = "SVG" .. i,
        ["Loader.Format"] = "SVG",
        ["Loader.ShowUI"] = 0, -- Set to 0 to hide the loader UI
    })
    if not success then
        print("Error loading SVG file: " .. filePath .. " - " .. loader)
        break
    end
    loader.Clip = filePath  --svgimporter
    print(loader.Clip)
    local loaderNode = loader[1]
    if loaderNode then
        -- Set attributes for the loaded SVG file
        loaderNode:SetAttrs({
            Width = 1920,
            Height = 1080,
            ["SVG Loader.Preserve Aspect Ratio"] = 1
        })
    else
        print("Error loading SVG file: " .. filePath)
    end
end
