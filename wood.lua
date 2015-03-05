local wood_corners = {   --Material , Description , Image , Item
	{ "default_cobble" , "Cobble" , "default_cobble", "default:cobble"},
	{ "default_stone" , "Stone" , "default_stone", "default:stone"},	
	{ "default_stone_brick" , "Stone Brick" , "default_stone_brick", "default:stonebrick"},
	{ "default_brick" , "brick" , "default_brick", "default:brick"},
	{ "default_wood" , "Wood" , "default_wood", "default:wood"},
	{ "default_pinewood" , "Pine Wood" , "default_pinewood", "default:pinewood"},
	{ "default_sandstone" , "Sandstone " , "default_sandstone", "default:sandstone"},
	{ "default_sandstone_brick" , "Sandstone Brick" , "default_sandstone_brick", "default:sandstonebrick"},
}

for i in ipairs(wood_corners) do
	local mat = wood_corners[i][1]
	local desc = wood_corners[i][2]
	local img = wood_corners[i][3]
	local item = wood_corners[i][4]

minetest.register_node("mycorners:wood_"..mat.."_corner", {
	description = "Wood "..desc.." Corner",
	drawtype = "normal",
	paramtype = "light",
	tiles = {
		img..".png",
		img..".png",
		img..".png",
		img..".png^corners_wood1.png",
		img..".png",
		img..".png^corners_wood2.png",
		},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky = 2},

})

minetest.register_craft({
	output = "mycorners:wood_"..mat.."_corner 1",
	recipe = {
		{item,"mycorners:board",""},
		{"mycorners:board","",""},
		{"","",""},
	}
})

end

--boards
minetest.register_craftitem("mycorners:board", {
	description = "Board",
	inventory_image = "corners_wood1.png",
})

minetest.register_craft({
	output = "mycorners:board 18",
	recipe = {
		{"default:wood","",""},
		{"default:wood","",""},
		{"default:wood","",""},
	}
})
