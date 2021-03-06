

    local _, ns = ...

    local BACKDROP = {
        bgFile     = [[Interface\ChatFrame\ChatFrameBackground]],
        tiled      = false,
        insets     = {left = -3, right = -3, top = -3, bottom = -3}
    }

    local RoP = CreateFrame('Button', nil, UIParent)
    RoP:SetSize(20, 14)
    RoP:SetBackdrop(BACKDROP)
    RoP:SetBackdropColor(0, 0, 0)
    RoP.id = 116011
    ns.RoP = RoP

    RoP.t = RoP:CreateTexture(nil, 'ARTWORK')
    RoP.t:SetAllPoints()
    RoP.t:SetTexture[[Interface\Icons\spell_mage_runeofpower]]
    RoP.t:SetTexCoord(.1, .9, .25, .75)

    RoP.stacks = RoP:CreateFontString(nil, 'OVERLAY')
    RoP.stacks:SetPoint('BOTTOM', RoP, 0, -1)
    RoP.stacks:SetFont(STANDARD_TEXT_FONT, 14, 'OUTLINE')
    RoP.stacks:SetShadowOffset(0, 0)
    RoP.stacks:SetJustifyH'CENTER'


    --
