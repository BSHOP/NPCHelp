ENT.Base = "base_ai"
ENT.Type = "ai"
ENT.AutomaticFrameAdvance = true
ENT.PrintName = "Help"
ENT.Author = "Bishop"
ENT.Category = "Bishop NPC"
ENT.Spawnable = true
 
function ENT:SetAutomaticFrameAdvance( bUsingAnim ) 
	self.AutomaticFrameAdvance = bUsingAnim
end

-----------------------------------------------------------------
--[CONFIG]

NPCModel = "models/alyx.mdl"

Title = "Need for help?"

Contributor = "Created by ..."

NPCHelpButtons = {}

NPCHelpButtons = {
	
	{
		txt	= "Your Website",
		url = "https://www.google.com/?gfe_rd=cr&ei=Y5yKV6WBL-7t8weJi56wCQ#q=Your+Website",
	},

	{
		txt	= "Forums",
		url = "https://www.google.com/?gfe_rd=cr&ei=Y5yKV6WBL-7t8weJi56wCQ#q=Forums",
	},

	{
		txt	= "How to become donator ?",
		url = "https://www.google.com/?gfe_rd=cr&ei=Y5yKV6WBL-7t8weJi56wCQ#q=How+to+become+donator+%3F",
	},

	{
		txt	= "Last patch",
		url = "https://www.google.com/?gfe_rd=cr&ei=Y5yKV6WBL-7t8weJi56wCQ#q=last+patch",
	},

}

