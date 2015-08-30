function mycorners.register_all(material, descr, image, groupss, itm)
local cornerblock = {
{"wood_black",         "corners_wood_black.png",          "Black Wood"},
{"wood_blue",  	       "corners_wood_blue.png",           "Blue Wood"},
{"wood_brown", 	       "corners_wood_brown.png",          "Brown Wood"},
{"wood_cyan",  	       "corners_wood_cyan.png",           "Cyan Wood"},
{"wood_dark_green",    "corners_wood_dark_green.png",     "Dark Green Wood"},
{"wood_dark_grey",     "corners_wood_dark_grey.png",      "Dark Grey Wood"},
{"wood_green",         "corners_wood_green.png",          "Green Wood"},
{"wood_grey",  	       "corners_wood_grey.png",           "Grey Wood"},
{"wood_magenta",       "corners_wood_magenta.png",        "Magenta Wood"},
{"wood_orange",        "corners_wood_orange.png",         "Orange Wood"},
{"wood_pink", 	       "corners_wood_pink.png",           "Pink Wood"},
{"wood_red", 	       "corners_wood_red.png",            "Red Wood"},
{"wood_violet",        "corners_wood_violet.png",         "Violet Wood"},
{"wood_white", 	       "corners_wood_white.png",          "White Wood"},
{"wood_yellow",        "corners_wood_yellow.png",         "Yellow Wood"},
{"stone_black",           "corners_stone_black.png",          "Black Stone"},
{"stone_blue",  	  "corners_stone_blue.png",           "Blue Brick"},
{"stone_brown",           "corners_stone_brown.png",          "Brown Stone"},
{"stone_cyan",            "corners_stone_cyan.png",           "Cyan Stone"},
{"stone_dark_green",      "corners_stone_dark_green.png",     "Dark Green Stone"},
{"stone_dark_grey",       "corners_stone_dark_grey.png",      "Dark Grey Stone"},
{"stone_green",           "corners_stone_green.png",          "Green Stone"},
{"stone_grey",            "corners_stone_grey.png",           "Grey Stone"},
{"stone_magenta",         "corners_stone_magenta.png",        "Magenta Stone"},
{"stone_orange",          "corners_stone_orange.png",         "Orange Stone"},
{"stone_pink", 	          "corners_stone_pink.png",           "Pink Stone"},
{"stone_red", 	          "corners_stone_red.png",            "Red Stone"},
{"stone_violet",          "corners_stone_violet.png",         "Violet Stone"},
{"stone_white",           "corners_stone_white.png",          "White Stone"},
{"stone_yellow",          "corners_stone_yellow.png",         "Yellow Stone"},
{"stonebrick_black",          "corners_stonebrick_black.png",          "Black Stone Brick"},
{"stonebrick_blue",  	      "corners_stonebrick_blue.png",           "Blue Stone Brick"},
{"stonebrick_brown", 	      "corners_stonebrick_brown.png",          "Brown Stone Brick"},
{"stonebrick_cyan",  	      "corners_stonebrick_cyan.png",           "Cyan Stone Brick"},
{"stonebrick_dark_green",     "corners_stonebrick_dark_green.png",     "Dark Green Stone Brick"},
{"stonebrick_dark_grey",      "corners_stonebrick_dark_grey.png",      "Dark Grey Stone Brick"},
{"stonebrick_green",          "corners_stonebrick_green.png",          "Green Stone Brick"},
{"stonebrick_grey",  	      "corners_stonebrick_grey.png",           "Grey Stone Brick"},
{"stonebrick_magenta",        "corners_stonebrick_magenta.png",        "Magenta Stone Brick"},
{"stonebrick_orange",         "corners_stonebrick_orange.png",         "Orange Stone Brick"},
{"stonebrick_pink", 	      "corners_stonebrick_pink.png",           "Pink Stone Brick"},
{"stonebrick_red", 	      "corners_stonebrick_red.png",            "Red Stone Brick"},
{"stonebrick_violet",         "corners_stonebrick_violet.png",         "Violet Stone Brick"},
{"stonebrick_white", 	      "corners_stonebrick_white.png",          "White Stone Brick"},
{"stonebrick_yellow",         "corners_stonebrick_yellow.png",         "Yellow Stone Brick"},
}
for i in ipairs(cornerblock) do
	local mat = cornerblock[i][1]
	local img = cornerblock[i][2]
	local desc = cornerblock[i][3]
--Makes the craft item corner
minetest.register_craftitem("mycorners:corner_"..mat, {
	description = desc.." Corner",
	inventory_image = img,
	groups = {not_in_creative_inventory=1},
})
local other_images = {
		{"top","bottom"},
		}
for i in ipairs (other_images) do
	local top = other_images[i][1]
	local bottom = other_images[i][2]
minetest.register_node("mycorners:cornerblock_"..material.."_"..mat, {
	description = descr.."_Corner"..desc,
	drawtype = "normal",
	tiles = {
		image.."^corners_"..mat.."_"..top..".png",
		image.."^corners_"..mat.."_"..bottom..".png",
		image,
		image.."^"..img.."^[transformFX",
		image,
		image.."^"..img,
		},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = groupss,
	drop = {
		max_items = 3,
		items = {
			{
			items = {itm},
			},
			{
			items = {"mycorners:corner_"..mat.." 2"},
			},
		}
		},
})
end
end
end
