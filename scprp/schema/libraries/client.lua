local color_682 = {}

color_682[ "$pp_colour_addr" ] = 0,
color_682[ "$pp_colour_addg" ] = 0,
color_682[ "$pp_colour_addb" ] = 0,
color_682[ "$pp_colour_brightness" ] = -0.7 or -0.3,
color_682[ "$pp_colour_contrast" ] = 1,
color_682[ "$pp_colour_colour" ] = 1,
color_682[ "$pp_colour_mulr" ] = 5,
color_682[ "$pp_colour_mulg" ] = 0,
color_682[ "$pp_colour_mulb" ] = 0
function SCHEMA:RenderScreenspaceEffects()
	if LocalPlayer():getClass() == CLASS_SCP_682 then
		DrawColorModify(color_682)
	end
end