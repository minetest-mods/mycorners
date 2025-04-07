local corn = core.settings:get_bool("mycorners.allcolors", true)


if corn == false then
	minetest.setting_set("mycorners_all_colors","false")
end
mycorners = {}

dofile(minetest.get_modpath("mycorners").."/cornertool.lua")
dofile(minetest.get_modpath("mycorners").."/machine.lua")

local settings = corn or nil
	if settings == nil then
		settings = minetest.setting_set("mycorners_all_colors","false") 
		settings = "false"
	end

if settings == true then

	dofile(minetest.get_modpath("mycorners").."/nodes.lua")
	dofile(minetest.get_modpath("mycorners").."/machine.lua")
	dofile(minetest.get_modpath("mycorners").."/register.lua")

else

	dofile(minetest.get_modpath("mycorners").."/nodes_light.lua")
	dofile(minetest.get_modpath("mycorners").."/machine_light.lua")
	dofile(minetest.get_modpath("mycorners").."/register_light.lua")

end

