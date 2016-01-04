local USES = 200
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
local default_material = {
		{"default:cobble", "default_cobble"},
		{"default:sandstone","default_sandstone"},
		{"default:clay","default_clay"},
		{"default:stone","default_stone"},
		{"default:desert_stone","default_desert_stone"},
		{"default:wood","default_wood"},
		{"default:pine_wood","default_pine_wood"},
		{"default:acacia_wood","default_acacia_wood"},
		{"default:brick","default_brick"},
		{"default:desert_cobble","default_desert_cobble"},
		{"default:junglewood","default_junglewood"},
		{"default:mossycobble","default_mossycobble"},
		{"default:sandstonebrick","default_sandstone_brick"},
		{"default:stonebrick","default_stone_brick"},
		{"default:desert_stonebrick","default_desert_stone_brick"},
		}
minetest.register_tool( "mycorners:corner_tool",{
	description = "Corner Tool",
	inventory_image = "mycorners_cornertool.png",
	wield_image = "mycorners_cornertool.png",
	on_use = function(itemstack, user, pointed_thing)
	if pointed_thing.type ~= "node" then
		return
	end
	if minetest.is_protected(pos, user:get_player_name()) then
		return
	end
for i in ipairs(cornerblock) do
	local mat = cornerblock[i][1]
	local img = cornerblock[i][2]
	local desc = cornerblock[i][3]
for i in ipairs(default_material) do
	local material = default_material[i][1]
	local iname = default_material[i][2]
	local beside = user:get_wield_index()+1
	local inv = user:get_inventory()
  	local istack = inv:get_stack("main", beside)
	local pos = pointed_thing.under
	local node = minetest.get_node(pos)
	local cornr = "mycorners:corner_"..mat
	if node.name == material and
           istack:get_name() == cornr
	then
		minetest.set_node(pos,{name = "mycorners:cornerblock_"..iname.."_"..mat, param2=minetest.dir_to_facedir(user:get_look_dir())})
        	user:get_inventory():remove_item("main", cornr.." 2");
	break
	end
end
end
	if not minetest.setting_getbool("creative_mode") then
		itemstack:add_wear(65535 / (USES - 1))
	end
	return itemstack
end,
on_place = function(itemstack, placer, pointed_thing)
	local pos = pointed_thing.under
	local node = minetest.get_node(pos).name
	local para = minetest.get_node(pos).param2
	local newpara = para + 1
		if newpara > 3 then
		newpara = 0
		end
	minetest.set_node(pos,{name = ""..node, param2 = newpara})
	if not minetest.setting_getbool("creative_mode") then
		itemstack:add_wear(65535 / (USES - 1))
	end
	return itemstack
	end,
})
minetest.register_craft({
		output = 'mycorners:corner_tool',
		recipe = {
			{'default:steel_ingot', 'default:steel_ingot', 'default:steel_ingot'},
			{'', 'default:steel_ingot', ''},
			{'', 'wool:blue', ''},		
		},
})
