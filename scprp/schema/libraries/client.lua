function SCHEMA:RenderScreenspaceEffects()
	if LocalPlayer():isClass(CLASS_SCP_682)  then
		DrawColorModify({
			[ "$pp_colour_addr" ] = 0,
			[ "$pp_colour_addg" ] = 0,
			[ "$pp_colour_addb" ] = 0,
			[ "$pp_colour_brightness" ] = -0.7 or -0.3,
			[ "$pp_colour_contrast" ] = 1,
			[ "$pp_colour_colour" ] = 1,
			[ "$pp_colour_mulr" ] = 5,
			[ "$pp_colour_mulg" ] = 0,
			[ "$pp_colour_mulb" ] = 0
		})
	end
end