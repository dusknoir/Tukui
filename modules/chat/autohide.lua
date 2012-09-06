local T, C, L = unpack(select(2, ...))
if not C.chat.autohide then return end

local timer = 0
local manager = CreateFrame('frame')

ChatFrame1:SetAlpha(0)

local function show()
  timer = 4

  ChatFrame1:SetAlpha(1)
  manager:Show()
end

local function hide()
  ChatFrame1:SetAlpha(0)
  manager:Hide()
end

manager:SetScript('OnUpdate', function(self, delay)
  timer = timer - delay

  if timer < 1 then
    ChatFrame1:SetAlpha(timer)
  elseif timer < 0 then
    hide()
  end
end)

ChatFrame1:SetScript('OnEnter', function()
  show()
  manager:Hide() -- don't fade out while mouse is over
end)

ChatFrame1:SetScript('OnLeave', function()
  manager:Show()
end)

ChatFrame1Tab:HookScript('OnMouseDown', show)
hooksecurefunc(ChatFrame1, 'AddMessage', show)
