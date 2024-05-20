ITEM.name = "Bone Saw"
ITEM.desc = "A small, rusty bone saw. It's covered in dried blood."
ITEM.model = "models/props_junk/junk_hacksaw.mdl"

ITEM.functions.use = {
	name = "Cut Corpse",
    sound = " items/suitcharge1.wav",
	onRun = function(item)
		local client = item.player
		local target = client:GetEyeTrace().Entity
		if not (target:IsRagdoll() or IsValid(target)) then
			client:notify("Target not valid! You must be looking at it!")
			client:getChar():getInv():add("scp_49_bone_saw")
			return
		end

		lia.chat.send(client, "me", "pulls out a rusty bone saw and begins cutting up the corpse that lies before them...")
		client:setAction("Cutting up the corpse with a bone saw...",
		10,
		function()
			target:Remove()
			client:notify("You have successfully cut up the corpse.")
			client:getChar():getInv():add("scp_49_bone_saw")
		end)
	end
}