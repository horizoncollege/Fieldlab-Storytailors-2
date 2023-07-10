-- Load the Fusion 
fusion = Fusion() 
-- Create a MediaPool object 
mp = fusion:GetMediaPool() 
-- Import the SVG file 
mp:ImportFile("C:/Users/tkame/OneDrive/Afbeeldingen/img/cat.svg") 
-- Get the imported clip 
clip = mp:GetCurrentItem() 
-- Print some information about the clip 
print("Clip name:", clip:GetName()) 
print("Clip duration:", clip:GetDuration())