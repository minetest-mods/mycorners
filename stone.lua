local stone_corners = {   --Material , Description , Image
	{ "default_cobble" , "Cobble" , "default_cobble"},
	{ "default_stone" , "Stone" , "default_stone"},	
	{ "default_stone_brick" , "Stone Brick" , "default_stone_brick"},	
	{ "default_brick" , "brick" , "default_brick"},
--	{ "default_wood" , "Wood" , "default_wood"},
--	{ "default_pinewood" , "Pine Wood" , "default_pinewood"},
--	{ "default_sandstone" , "Sandstone " , "default_sandstone"},
--	{ "default_sandstone_brick" , "Sandstone Brick" , "default_sandstone_brick"},
}

for i in ipairs(stone_corners) do
	local mat = stone_corners[i][1]
	local desc = stone_corners[i][2]
	local img = stone_corners[i][3]

minetest.register_node("mycorners:stone_"..mat.."_corner", {
	description = "Stone "..desc.." Corner",
	drawtype = "normal",
	paramtype = "light",
	tiles = {
		img..".png",
		img..".png",
		img..".png",
		img..".png^corners_stone2.png",
		img..".png",
		img..".png^corners_stone1.png",
		},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky = 2},

})
end
