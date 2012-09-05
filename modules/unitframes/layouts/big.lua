local ADDON_NAME, ns = ...
local oUF = oUFTukui or oUF
assert(oUF, "Tukui was unable to locate oUF install.")

ns._Objects = {}
ns._Headers = {}

local T, C, L = unpack(Tukui) -- Import: T - functions, constants, variables; C - config; L - locales
if not C["unitframes"].enable == true then return end

local font1 = C["media"].font
local font2 = C["media"].uffont

local function Shared(self, unit)
  self.colors = T.UnitColor
  self:RegisterForClicks("AnyUp")
  self:SetScript('OnEnter', UnitFrame_OnEnter)
  self:SetScript('OnLeave', UnitFrame_OnLeave)
  self:CreateShadow()

  self.menu = T.SpawnMenu

  self:SetBackdrop({
    bgFile = C["media"].blank,
    insets = {
      top = -T.mult,
      left = -T.mult,
      bottom = -T.mult,
      right = -T.mult
    },
  })

  self:SetBackdropColor(0.1, 0.1, 0.1)

  local health = CreateFrame('StatusBar', nil, self)
  -- health:SetAllPoints(self)
  health:SetPoint('TOPLEFT', self, 'TOPLEFT')
  health:SetPoint('TOPRIGHT', self, 'TOPRIGHT')
  health:SetHeight(T.Scale(13))
  health:SetStatusBarTexture(C["media"].normTex)
  self.Health = health

  health.bg = self.Health:CreateTexture(nil, 'BORDER')
  health.bg:SetAllPoints(self.Health)
  health.bg:SetTexture(C["media"].blank)
  health.bg:SetTexture(0.3, 0.3, 0.3)
  health.bg.multiplier = (0.3)
  self.Health.bg = health.bg

  health.PostUpdate = T.PostUpdatePetColor
  health.frequentUpdates = true

  if C.unitframes.unicolor == true then
    health.colorDisconnected = false
    health.colorClass = false
    health:SetStatusBarColor(.3, .3, .3, 1)
    health.bg:SetVertexColor(.1, .1, .1, 1)    
  else
    health.colorDisconnected = true
    health.colorClass = true
    health.colorReaction = true      
  end

  local name = health:CreateFontString(nil, 'OVERLAY')
  name:SetFont(font2, 16*T.raidscale, "THINOUTLINE")
  name:Point("LEFT", self, "RIGHT", 6, -1)
  self:Tag(name, '[Tukui:namemedium]')
  self.Name = name

  if C["unitframes"].showsymbols == true then
    RaidIcon = health:CreateTexture(nil, 'OVERLAY')
    RaidIcon:Height(14*T.raidscale)
    RaidIcon:Width(14*T.raidscale)
    -- RaidIcon:SetPoint("LEFT", self, "LEFT", 3, 0)
    RaidIcon:SetPoint('CENTER', self, 'TOP')
    RaidIcon:SetTexture("Interface\\AddOns\\Tukui\\medias\\textures\\raidicons.blp") -- thx hankthetank for texture
    self.RaidIcon = RaidIcon
  end

  local power = CreateFrame('StatusBar', nil, self)
  power:SetPoint('TOPLEFT', health, 'BOTTOMLEFT', 0, -T.Scale(1))
  power:SetPoint('BOTTOMRIGHT', self, 'BOTTOMRIGHT')
  power:SetStatusBarTexture(C.media.normTex)
  power:SetFrameLevel(7)
  self.Power = power
  
  power.frequentUpdates = true
  power.colorDisconnected = true

  power.bg = self.Power:CreateTexture(nil, "BORDER")
  power.bg:SetAllPoints(power)
  power.bg:SetTexture(C.media.normTex)
  power.bg:SetAlpha(1)
  power.bg.multiplier = 0.4
  -- self.Power.bg = power.bg
  
  if C.unitframes.unicolor == true then
    power.colorClass = true
    power.bg.multiplier = 0.1        
  else
    power.colorPower = true
  end

  --[[
  local castbar = CreateFrame('StatusBar', nil, self)
  castbar:SetStatusBarTexture(C.media.normTex)
  castbar:SetStatusBarColor(.8, .1, .1, 1)
  castbar:SetAllPoints(self.Power)
  castbar:SetFrameLevel(8)
  --]]

  --[[
  castbar.Text = health:CreateFontString(nil, 'OVERLAY')
  castbar.Text:SetFont(font2, 15*T.raidscale, "THINOUTLINE")
  castbar.Text:Point("LEFT", self, "RIGHT", 6, -1)
  castbar.Text:SetScript('OnShow', function() return name:Hide() end)
  castbar.Text:SetScript('OnHide', function() return name:Show() end)
  --]]

  if C["unitframes"].aggro == true then
    table.insert(self.__elements, T.UpdateThreat)
    self:RegisterEvent('PLAYER_TARGET_CHANGED', T.UpdateThreat)
    self:RegisterEvent('UNIT_THREAT_LIST_UPDATE', T.UpdateThreat)
    self:RegisterEvent('UNIT_THREAT_SITUATION_UPDATE', T.UpdateThreat)
  end

  local ReadyCheck = health:CreateTexture(nil, "OVERLAY")
  ReadyCheck:Height(12*T.raidscale)
  ReadyCheck:Width(12*T.raidscale)
  ReadyCheck:SetPoint('CENTER')
  self.ReadyCheck = ReadyCheck

  --[[
  self.DebuffHighlightAlpha = 1
  self.DebuffHighlightBackdrop = true
  self.DebuffHighlightFilter = true
  --]]

  if C["unitframes"].showsmooth == true then
    health.Smooth = true
    power.Smooth = true
  end
  
  if C["unitframes"].healcomm then
    local mhpb = CreateFrame('StatusBar', nil, self.Health)
    mhpb:SetPoint('TOPLEFT', self.Health:GetStatusBarTexture(), 'TOPRIGHT', 0, 0)
    mhpb:SetPoint('BOTTOMLEFT', self.Health:GetStatusBarTexture(), 'BOTTOMRIGHT', 0, 0)
    mhpb:SetWidth(150*T.raidscale)
    mhpb:SetStatusBarTexture(normTex)
    mhpb:SetStatusBarColor(0, 1, 0.5, 0.25)

    local ohpb = CreateFrame('StatusBar', nil, self.Health)
    ohpb:SetPoint('TOPLEFT', mhpb:GetStatusBarTexture(), 'TOPRIGHT', 0, 0)
    ohpb:SetPoint('BOTTOMLEFT', mhpb:GetStatusBarTexture(), 'BOTTOMRIGHT', 0, 0)
    ohpb:SetWidth(150*T.raidscale)
    ohpb:SetStatusBarTexture(normTex)
    ohpb:SetStatusBarColor(0, 1, 0, 0.25)

    self.HealPrediction = { myBar = mhpb, otherBar = ohpb, maxOverflow = 1 }
  end

  if C["unitframes"].showrange == true then
    self.Range = { insideAlpha = 1, outsideAlpha = C["unitframes"].raidalphaoor }
  end

  return self
end

oUF:RegisterStyle('TukuiDpsR40', Shared)
oUF:Factory(function(self)
  oUF:SetActiveStyle("TukuiDpsR40")

  local raid = self:SpawnHeader("TukuiRaid40", nil, "custom [@raid16,exists] show;hide", 
    'oUF-initialConfigFunction', [[
      local header = self:GetParent()
      self:SetWidth(header:GetAttribute('initial-width'))
      self:SetHeight(header:GetAttribute('initial-height'))
    ]],
    'initial-width', T.Scale(100*T.raidscale),
    'initial-height', T.Scale(17*T.raidscale),
    "showRaid", true,
    "groupFilter", "1,2,3,4,5,6,7,8",
    "groupingOrder", "1,2,3,4,5,6,7,8",
    "groupBy", "GROUP",
    "yOffset", T.Scale(-4)
  )

  raid:SetPoint('TOPLEFT', UIParent, 15, -18)
end)
