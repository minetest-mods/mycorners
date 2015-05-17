local material = {}
local matr = {}
local matr2 = {}
local shape = {}
local shape2 = {}
local make_ok = 0
local anzahl = {}
local anzahlz = {}

local dye_colors = {
		{"dye:black","black"},
		{"dye:blue","blue"},
		{"dye:brown","brown"},
		{"dye:cyan","cyan"},
		{"dye:dark_green","dark_green"},
		{"dye:dark_grey","dark_grey"},
		{"dye:green","green"},
		{"dye:grey","grey"},
		{"dye:magenta","magenta"},
		{"dye:orange","orange"},
		{"dye:pink","pink"},
		{"dye:red","red"},
		{"dye:violet","violet"},
		{"dye:white","white"},
		{"dye:yellow","yellow"},
		}
local nodes_of_corners = {
			{"default:brick","default_brick"},
			{"default:bronzeblock","default_bronze_block"},
			{"default:cactus","default_cactus"},
			{"default:clay","default_clay"},
			{"default:coalblock","default_coal_block"},
			{"default:cobble","default_cobble"},
			{"default:copperblock","default_copper_block"},
			{"default:desert_cobble","default_desert_cobble"},
			{"default:desert_sand","default_desert_sand"},
			{"default:desert_stone","default_desert_stone"},
			{"default:diamondblock","default_diamond_block"},
			{"default:dirt","default_dirt"},
			{"default:glass","default_glass"},
			{"default:goldblock","default_gold_block"},
			{"default:gravel","default_gravel"},
			{"default:ice","default_ice"},
			{"default:jungletree","default_jungletree"},
			{"default:junglewood","default_junglewood"},
			{"default:lava_source","default_lava"},
			{"default:mese","default_mese"},
			{"default:mossycobble","default_mossycobble"},
			{"default:obsidian","default_obsidian"},
			{"default:obsidian_glass","default_obsidian_glass"},
			{"default:obsidianbrick","default_obsidian_brick"},
			{"default:pinetree","default_pinetree"},
			{"default:pinewood","default_pinewood"},
			{"default:sand","default_sand"},
			{"default:sandstone","default_sandstone"},
			{"default:sandstonebrick","default_sandstone_brick"},
			{"default:snowblock","default_snow"},
			{"default:steelblock","default_steel_block"},
			{"default:stone","default_stone"},
			{"default:stonebrick","default_stone_brick"},
			{"default:tree","default_tree"},
			{"default:water_source","default_water"},
			{"default:wood","default_wood"},
			{"farming:straw","farming_straw"},
			{"wool:black","wool_black"},
			{"wool:blue","wool_blue"},
			{"wool:brown","wool_brown"},
			{"wool:cyan","wool_cyan"},
			{"wool:dark_green","wool_dark_green"},
			{"wool:dark_grey","wool_dark_grey"},
			{"wool:green","wool_green"},
			{"wool:grey","wool_grey"},
			{"wool:magenta","wool_magenta"},
			{"wool:orange","wool_orange"},
			{"wool:pink","wool_pink"},
			{"wool:red","wool_red"},
			{"wool:violet","wool_violet"},
			{"wool:white","wool_white"},
			{"wool:yellow","wool_yellow"},
			}
local corner_items = {
		{"_wood_black"},
		{"_wood_blue"},
		{"_wood_brown"},
		{"_wood_cyan"},
		{"_wood_dark_green"},
		{"_wood_dark_grey"},
		{"_wood_green"},
		{"_wood_grey"},
		{"_wood_magenta"},
		{"_wood_orange"},
		{"_wood_pink"},
		{"_wood_red"},
		{"_wood_violet"},
		{"_wood_white"},
		{"_wood_yellow"},

		{"_stone_black"},
		{"_stone_blue"},
		{"_stone_brown"},
		{"_stone_cyan"},
		{"_stone_dark_green"},
		{"_stone_dark_grey"},
		{"_stone_green"},
		{"_stone_grey"},
		{"_stone_magenta"},
		{"_stone_orange"},
		{"_stone_pink"},
		{"_stone_red"},
		{"_stone_violet"},
		{"_stone_white"},
		{"_stone_yellow"},

		{"_stonebrick_black"},
		{"_stonebrick_blue"},
		{"_stonebrick_brown"},
		{"_stonebrick_cyan"},
		{"_stonebrick_dark_green"},
		{"_stonebrick_dark_grey"},
		{"_stonebrick_green"},
		{"_stonebrick_grey"},
		{"_stonebrick_magenta"},
		{"_stonebrick_orange"},
		{"_stonebrick_pink"},
		{"_stonebrick_red"},
		{"_stonebrick_violet"},
		{"_stonebrick_white"},
		{"_stonebrick_yellow"},
		}

minetest.register_alias("mycorners:machine_installer", 	"mycorners:machine_corner")

minetest.register_node("mycorners:machine_corner", {
	description = "Corner Machine",
	tiles = {
		"mycorners_machine_top.png",
		"mycorners_machine_bottom.png",
		"mycorners_machine_sider.png",
		"mycorners_machine_sidel.png",
		"mycorners_machine_back.png",
		"mycorners_machine_front.png"
		},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky=2},
	node_box = {
		type = "fixed",
		fixed = {
			{0.3125, -0.5, -0.5, 0.5, -0.1875, -0.3125}, 
			{0.3125, -0.5, 0.3125, 0.5, -0.1875, 0.5}, 
			{-0.5, -0.5, 0.3125, -0.3125, -0.1875, 0.5}, 
			{-0.5, -0.5, -0.5, -0.3125, -0.1875, -0.3125}, 
			{-0.5, -0.1875, -0.5, 0.5, -0.0625, 0.5}, 
			{-0.0625, -0.0625, -0.25, 0, 0.0625, -0.1875}, 
			{-0.1875, -0.4375, -0.3125, 0.125, -0.1875, -0.125}, 
			{-0.125, -0.4375, -0.375, 0.0625, -0.1875, -0.0625}, 
			{-0.25, -0.0625, -0.1875, 0.1875, 0.125, 0.0625}, 
			{-0.4375, -0.0625, 0.125, 0.4375, 0.0625, 0.25}, 
			{-0.4375, -0.0625, -0, 0.4375, 0.1875, 0.125}, 
			{-0.1875, -0.25, -0.375, 0.125, -0.1875, -0.0625}, 
		}
	},

	after_place_node = function(pos, placer)
	local meta = minetest.env:get_meta(pos);
			meta:set_string("owner",  (placer:get_player_name() or ""));
			meta:set_string("infotext",  "Corner Machine (owned by " .. (placer:get_player_name() or "") .. ")");
		end,

can_dig = function(pos,player)
	local meta = minetest.env:get_meta(pos);
	local inv = meta:get_inventory()
	if not inv:is_empty("matblock") then
		return false
	elseif not inv:is_empty("dye") then
		return false
	elseif not inv:is_empty("res") then
		return false
	end
	return true
end,

on_construct = function(pos)
	local meta = minetest.env:get_meta(pos)
	meta:set_string("formspec", "invsize[10,11;]"..
		"background[-0.15,-0.25;10.40,11.75;mycorners_background.png]"..
		"label[0,0;Corner Machine]"..
		"label[1.5,0.5;Material:]"..
		"list[current_name;matblock;1.5,1;1,1;]"..
		"label[3,0.5;Dye:]"..
		"list[current_name;dye;3,1;1,1;]"..
		"button[4.5,1;1,1;make;Make]"..
		"label[6,0.5;Output:]"..
		"list[current_name;res;6,1;1,1;]"..
		"label[1,2;Material can only be wood, stone or stone brick]"..
		"vertlabel[9.5,0.5;All dye colors are supported]"..

		"label[1.5,3;Material]"..
		"list[current_name;mat;1.5,3.5;1,1; ]"..
		"list[current_name;corner1;1.5,4.5;1,1; ]"..
		"list[current_name;corner2;2.5,3.5;1,1; ]"..
		"button[4.5,3.5;1,1;make2;Make]"..
		"label[6,3;Output:]"..
		"list[current_name;res2;6,3.5;1,1;]"..
		"label[1,5.5;Add a block to the top left and corner items in the other 2]"..

		"list[current_player;main;1,7;8,4;]")
	meta:set_string("infotext", "Corner Machine")
	local inv = meta:get_inventory()
	inv:set_size("matblock", 1)
	inv:set_size("dye", 1)
	inv:set_size("res", 1)
	inv:set_size("mat", 1)
	inv:set_size("corner1", 1)
	inv:set_size("corner2", 1)
	inv:set_size("res2", 1)
end,

on_receive_fields = function(pos, formname, fields, sender)
	local meta = minetest.env:get_meta(pos)
	local inv = meta:get_inventory()

if fields["make"] 
then

		make_ok = 0
		anzahl = 4
		shape = "mycorners:corner_"
		if inv:is_empty("matblock") or
		   inv:is_empty("dye") then
			return
		end
	

		local ingotstack1 = inv:get_stack("matblock", 1)
		local ingotstack2 = inv:get_stack("dye", 1)
		local resstack = inv:get_stack("res", 1)
----------------------------------------------------------------------------------
--register nodes
----------------------------------------------------------------------------------

	for i in ipairs (dye_colors) do
	local dyecol = dye_colors[i][1]
	local color = dye_colors[i][2]

		if ingotstack1:get_name()=="default:wood" and
		   ingotstack2:get_name()==dyecol then
				material = "wood_"..color
				make_ok = 1
		end

		if ingotstack1:get_name()=="default:stone" and
		   ingotstack2:get_name()==dyecol then
				material = "stone_"..color
				make_ok = 1
		end

		if ingotstack1:get_name()=="default:stonebrick" and
		   ingotstack2:get_name()==dyecol then
				material = "stonebrick_"..color
				make_ok = 1
		end
	end

----------------------------------------------------------------------
		if make_ok == 1 then
			local give = {}
			for i = 0, anzahl-1 do
				give[i+1]=inv:add_item("res",shape..material)
			end
			ingotstack1:take_item()
			inv:set_stack("matblock",1,ingotstack1)
			ingotstack2:take_item()
			inv:set_stack("dye",1,ingotstack2)
		end            	
end
------------------------------------------------------------------------
------------------------------------------------------------------------
if fields["make2"] 
then

		make_ok = 0
		anzahlz = 1
		shape2 = "mycorners:cornerblock_"
		if inv:is_empty("mat") or
		   inv:is_empty("corner1") or
		   inv:is_empty("corner2") then
			return
		end
	

		local ingotstack4 = inv:get_stack("mat", 1)
		local ingotstack5 = inv:get_stack("corner1", 1)
		local ingotstack6 = inv:get_stack("corner2", 1)
		local resstack2 = inv:get_stack("res2", 1)

----------------------------------------------------------------------------------
--register nodes
----------------------------------------------------------------------------------

	for i in ipairs (nodes_of_corners) do
		local nodeitem = nodes_of_corners[i][1]
		local nodedesc = nodes_of_corners[i][2]

	for i in ipairs (corner_items) do
		local ctype = corner_items[i][1]


		if ingotstack4:get_name()== nodeitem and
		   ingotstack5:get_name()=="mycorners:corner"..ctype and
		   ingotstack6:get_name()=="mycorners:corner"..ctype then
				matr = nodedesc..ctype
				make_ok = 1
		end
	end
	end



----------------------------------------------------------------------
----------------------------------------------------------------------
  
		if make_ok == 1 then
			local give = {}
			for i = 0, anzahlz-1 do
				give[i+1]=inv:add_item("res2",shape2..matr)
			end
			ingotstack4:take_item()
			inv:set_stack("mat",1,ingotstack4)
			ingotstack5:take_item()
			inv:set_stack("corner1",1,ingotstack5)
			ingotstack6:take_item()
			inv:set_stack("corner2",1,ingotstack6)
		end

end

end

})


--Craft

minetest.register_craft({
		output = 'mycorners:machine_corner',
		recipe = {
			{'', 'default:steel_ingot', 'default:wood'},
			{'default:steelblock', 'default:steelblock', ''},
			{'default:steelblock', "default:steelblock", ''},		
		},
})













