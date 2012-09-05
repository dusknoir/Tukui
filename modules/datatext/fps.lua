local T, C, L, G = unpack(select(2, ...)) 

--------------------------------------------------------------------
-- FPS
--------------------------------------------------------------------

if C["datatext"].fps and C["datatext"].fps > 0 then
	local Stat = CreateFrame("Frame", "TukuiStatFPS")
	Stat:SetFrameStrata("BACKGROUND")	
	Stat:SetFrameLevel(3)
	Stat:EnableMouse(true)
	Stat.Option = C.datatext.fps
	Stat.Color1 = T.RGBToHex(unpack(C.media.datatextcolor1))
	Stat.Color2 = T.RGBToHex(unpack(C.media.datatextcolor2))
	G.DataText.FPS = Stat

	local Text  = Stat:CreateFontString("TukuiStatFPSText", "OVERLAY")
	Text:SetFont(C.media.font, C["datatext"].fontsize)
	T.DataTextPosition(C["datatext"].fps, Text)
	G.DataText.FPS.Text = Text

	local function Update(self, t)
		Text:SetText(Stat.Color1..L.datatext_fps..Stat.Color2..floor(GetFramerate()).."|r ")
		self:SetAllPoints(Text)
	end
	
	Stat:SetScript("OnUpdate", Update) 
	Stat:SetScript("OnEnter", function(self)
		if not InCombatLockdown() then
			local anchor, panel, xoff, yoff = T.DataTextTooltipAnchor(Text)
			local _, _, latencyHome, latencyWorld = GetNetStats()
			local latency = format(MAINMENUBAR_LATENCY_LABEL, latencyHome, latencyWorld)
			GameTooltip:SetOwner(panel, anchor, xoff, yoff)
			GameTooltip:ClearLines()
			GameTooltip:AddLine(latency)
			GameTooltip:Show()
		end
	end)	
	Stat:SetScript("OnLeave", function() GameTooltip:Hide() end)	
	Update(Stat, 10)
end
