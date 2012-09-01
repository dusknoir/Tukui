local LibSharedMedia = LibStub("LibSharedMedia-3.0")
if not LibSharedMedia then return end

local T, C, L = unpack(select(2, ...))

LibSharedMedia:Register("background", "Tukui: Blank", C.media.blank)
LibSharedMedia:Register("statusbar", "Tukui: Normal Bar", C.media.normTex)
LibSharedMedia:Register("font", "Tukui: Damage", C.media.dmgfont)
LibSharedMedia:Register("font", "Tukui: General", C.media.font)
LibSharedMedia:Register("font", "Tukui: Unit Frames", C.media.uffont)
