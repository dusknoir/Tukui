local T, C, L, G = unpack(select(2, ...)) 

--------------------------------------------------------------------
-- MS / latency
--------------------------------------------------------------------

if C["datatext"].ms and C["datatext"].ms > 0 then
	local Stat = CreateFrame("Frame", "TukuiStatMS")
	Stat:SetFrameStrata("BACKGROUND")
    Stat:SetFrameLevel(3)
	Stat:EnableMouse(true)
	Stat.Option = C.datatext.ms
	Stat.Color1 = T.RGBToHex(unpack(C.media.datatextcolor1))
	Stat.Color2 = T.RGBToHex(unpack(C.media.datatextcolor2))
	G.DataText.MS = Stat

	local Text  = Stat:CreateFontString("TukuiStatMSText", "OVERLAY")
	Text:SetFont(C.media.font, C["datatext"].fontsize)
	T.DataTextPosition(C["datatext"].ms, Text)
	G.DataText.MS.Text = Text

	local int = 1
	local function Update(self, t)
		int = int - t
		if int < 0 then
			local _, _, ms1, ms2 = GetNetStats()

            if ms1 == 0 then ms1 = '??' end
            if ms2 == 0 then ms2 = '??' end

			Text:SetText(Stat.Color1..L.datatext_ms..Stat.Color2..ms1..Stat.Color1.." & "..Stat.Color2..ms2.."|r")
			self:SetAllPoints(Text)
			int = 1			
		end	
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
