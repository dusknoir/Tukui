local T, C, L = unpack(select(2, ...))
if not C.chat.autohide then return end

local timer = 0

local function FadeIn()
  ChatFrame1:SetAlpha(1)
  timer = 3
end

local function FadeOut()
  UIFrameFadeOut(ChatFrame1, 1, 1, 0)
  timer = nil
end

ChatFrame1:HookScript('OnUpdate', function(self, delay)
  if timer then
    timer = timer - delay
    if timer < 0 then
      FadeOut()
    end
  end
end)

ChatFrame1:HookScript('OnEnter', FadeIn)
ChatFrame1Tab:HookScript('OnMouseDown', FadeIn)
hooksecurefunc(ChatFrame1, 'AddMessage', FadeIn)
