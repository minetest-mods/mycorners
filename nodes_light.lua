function mycorners.register_all(material, descr, image, groupss, itm)
local cornerblock = {
{"wood_black",         "corners_wood_black.png",          "Black Wood"},
{"wood_brown", 	       "corners_wood_brown.png",          "Brown Wood"},
{"wood_dark_green",    "corners_wood_dark_green.png",     "Dark Green Wood"},
{"wood_grey",  	       "corners_wood_grey.png",           "Grey Wood"},
{"stone_black",           "corners_stone_black.png",          "Black Stone"},
{"stone_brown",           "corners_stone_brown.png",          "Brown Stone"},
{"stone_dark_green",      "corners_stone_dark_green.png",     "Dark Green Stone"},
{"stone_grey",            "corners_stone_grey.png",           "Grey Stone"},
{"stonebrick_black",          "corners_stonebrick_black.png",          "Black Stone Brick"},
{"stonebrick_brown", 	      "corners_stonebrick_brown.png",          "Brown Stone Brick"},
{"stonebrick_dark_green",     "corners_stonebrick_dark_green.png",     "Dark Green Stone Brick"},
{"stonebrick_grey",  	      "corners_stonebrick_grey.png",           "Grey Stone Brick"},
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
