local stone_corners = {   --Material , Description , Image , Item
	{ "default_cobble" , "Cobble" , "default_cobble", "default:cobble"},
	{ "default_stone" , "Stone" , "default_stone", "default:stone"},	
	{ "default_stone_brick" , "Stone Brick" , "default_stone_brick", "default:stonebrick"},
	{ "default_brick" , "brick" , "default_brick", "default:brick"},
	{ "default_wood" , "Wood" , "default_wood", "default:wood"},
	{ "default_pinewood" , "Pine Wood" , "default_pinewood", "default:pinewood"},
	{ "default_sandstone" , "Sandstone " , "default_sandstone", "default:sandstone"},
	{ "default_sandstone_brick" , "Sandstone Brick" , "default_sandstone_brick", "default:sandstonebrick"},
}

for i in ipairs(stone_corners) do
	local mat = stone_corners[i][1]
	local desc = stone_corners[i][2]
	local img = stone_corners[i][3]
	local item = stone_corners[i][4]

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

minetest.register_craft({
	output = "mycorners:stone_"..mat.."_corner 1",
	recipe = {
		{item,"mycorners:stone_corner_block",""},
		{"mycorners:stone_corner_block","",""},
		{"","",""},
	}
})
end

--stone corner
minetest.register_craftitem("mycorners:stone_corner_block", {
	description = "Stone Corner Block",
	inventory_image = "corners_stone1.png",
})

minetest.register_craft({
	output = "mycorners:stone_corner_block 16",
	recipe = {
		{"default:cobble","",""},
		{"default:cobble","default:cobble",""},
		{"default:cobble","",""},
	}
})