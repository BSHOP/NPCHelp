include('shared.lua')

function NPCHelp()

	local mainHelp = vgui.Create('DFrame')
	mainHelp:SetSize(500, 500)
	mainHelp:Center()
	mainHelp:SetTitle("")
	mainHelp:SetSizable(false)
	mainHelp:SetDeleteOnClose(false)
	mainHelp:MakePopup()
	mainHelp.Paint = function( self, w, h )
		draw.RoundedBox( 3, 0, 0, w, h, Color( 10, 10, 10, 220 ) ) -- Draw a red box instead of the frame
	end

	local TopPanel = vgui.Create('DPanel', mainHelp)
	TopPanel:Dock(TOP)
	TopPanel:SetTall(50)
	TopPanel.Paint = function( self, w, h )
		draw.RoundedBox( 0, 0, 0, TopPanel:GetWide(), TopPanel:GetTall(), Color( 0, 0, 0, 200 ) )
		draw.DrawText( Title, "Trebuchet24", TopPanel:GetWide()/2+1, 10+1, Color( 0, 0, 0, 255 ), 1 )
		draw.DrawText( Title, "Trebuchet24", TopPanel:GetWide()/2+0, 10+0, Color( 255, 255, 255, 255 ), 1 )
	end

	local ButtonPanel = vgui.Create( "DPanel", mainHelp )
	ButtonPanel:Dock(FILL)
	ButtonPanel.Paint = function()
		draw.RoundedBox( 0, 0, 0, ButtonPanel:GetWide(), ButtonPanel:GetTall(), Color( 0, 0, 0, 200 ) )
	end

	local CreditPanel = vgui.Create( "DPanel", mainHelp )
	CreditPanel:Dock(BOTTOM)
	CreditPanel:SetTall(50)
	CreditPanel.Paint = function()
		draw.RoundedBox( 0, 0, 0, ButtonPanel:GetWide(), ButtonPanel:GetTall(), Color( 0, 0, 0, 200 ) )
		draw.DrawText( Contributor, "Trebuchet18", TopPanel:GetWide()/2+0, 20, Color( 255, 255, 255, 255 ), 1 )
	end

	local ButtonY = 62
	local ButtonI = 0

	for k,v in pairs( NPCHelpButtons ) do

		local Button = vgui.Create( "DButton", ButtonPanel )
			Button:Dock(TOP)
			Button:DockMargin(10,10,10,0)
			Button:SetTall( 60 )
			Button:SetText( "" )
			Button.Hover 	= false
			Button.OnCursorEntered 	= function() Button.Hover = true end
			Button.OnCursorExited	= function() Button.Hover = false end
			Button.Paint = function()
				draw.RoundedBox( 0, 0, 0, Button:GetWide()-4, Button:GetTall()-4, Color( 240, 240, 240, 255 ) )
				draw.RoundedBox( 0, 2, 2, Button:GetWide()-8, Button:GetTall()-8, Color( 0, 0, 0, 220 ) )

			if Button.Hover then
				draw.RoundedBox( 0, 0, 0, Button:GetWide()-4, Button:GetTall()-4, Color( 0, 0, 0, 230 ) )
			end

				draw.DrawText( v['txt'], "Trebuchet24", Button:GetWide()/2+1, 16+1, Color( 0, 0, 0, 255 ), 1 )
				draw.DrawText( v['txt'], "Trebuchet24", Button:GetWide()/2+0, 16+0, Color( 255, 255, 255, 255 ), 1 )

			end
			Button.DoClick = function() gui.OpenURL( v['url'] ) end
	end
end

usermessage.Hook("HelpNPCUsed", NPCHelp)







