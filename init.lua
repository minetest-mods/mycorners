--Change this to true is you want all the colors and false for 4 colors
local all_colors = false

mycorners = {}

dofile(minetest.get_modpath("mycorners").."/cornertool.lua")
dofile(minetest.get_modpath("mycorners").."/machine.lua")



if all_colors == true then

	dofile(minetest.get_modpath("mycorners").."/nodes.lua")
	dofile(minetest.get_modpath("mycorners").."/machine.lua")
	dofile(minetest.get_modpath("mycorners").."/register.lua")

else

	dofile(minetest.get_modpath("mycorners").."/nodes_light.lua")
	dofile(minetest.get_modpath("mycorners").."/machine_light.lua")
	dofile(minetest.get_modpath("mycorners").."/register_light.lua")

end

