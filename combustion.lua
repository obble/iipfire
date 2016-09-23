

    local _, ns = ...

    local BACKDROP = {
        bgFile     = [[Interface\ChatFrame\ChatFrameBackground]],
        tiled      = false,
        insets     = {left = -3, right = -3, top = -3, bottom = -3}
    }

    local C = CreateFrame('Button', nil, UIParent)
    C:SetSize(20, 14)
    C:SetBackdrop(BACKDROP)
    C:SetBackdropColor(0, 0, 0)
    C.id = 190319
    ns.C = C

    C.t = C:CreateTexture(nil, 'ARTWORK')
    C.t:SetAllPoints()
    C.t:SetTexture[[Interface\Icons\spell_fire_sealoffire]]
    C.t:SetTexCoord(.1, .9, .25, .75)


    --
