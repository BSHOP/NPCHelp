AddCSLuaFile( "cl_init.lua" ) -- This means the client will download these files
AddCSLuaFile( "shared.lua" )

include('shared.lua') -- At this point the contents of shared.lua are ran on the server only.


function ENT:Initialize( ) --This function is run when the entity is created so it's a good place to setup our entity.

	self:SetModel( NPCModel ) -- Sets the model of the NPC.
	self:SetHullType( HULL_HUMAN ) -- Sets the hull type, used for movement calculations amongst other things.
	self:SetHullSizeNormal( )
	self:SetNPCState( NPC_STATE_SCRIPT )
	self:SetSolid(  SOLID_BBOX ) -- This entity uses a solid bounding box for collisions.
	self:CapabilitiesAdd( CAP_ANIMATEDFACE, CAP_TURN_HEAD, CAP_WEAPON_MELEE_ATTACK1  ) -- Adds what the NPC is allowed to do ( It cannot move in this case ).
	self:SetUseType( SIMPLE_USE ) -- Makes the ENT.Use hook only get called once at every use.
	self:DropToFloor() 
	self:SetMovementActivity( ACT_WALK )
	self:SetMaxYawSpeed( 90 ) --Sets the angle by which an NPC can rotate at once.

	local Indicator = ents.Create("npc_indicator")
		Indicator:SetPos( self:GetPos() + (self:GetUp() * 90) )
		Indicator:SetParent( self )
		Indicator:SetAngles( self:GetAngles() )
		Indicator:Spawn()
		Indicator:SetCollisionGroup(COLLISION_GROUP_WORLD)
	
end

function ENT:OnTakeDamage()
	return false -- This NPC won't take damage from anything.
end 

function ENT:AcceptInput( Name, Activator, Caller )	

	if Name == "Use" and Caller:IsPlayer() then
		
		umsg.Start("HelpNPCUsed", Caller) -- Prepare the usermessage to that same player to open the menu on his side.
		umsg.End() -- We don't need any content in the usermessage so we're sending it empty now.
		
	end
	
end


