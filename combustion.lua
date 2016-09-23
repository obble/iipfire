

    local _, ns = ...

    local BACKDROP = {
        bgFile     = [[Interface\ChatFrame\ChatFrameBackground]],
        tiled      = false,
        insets     = {left = -3, right = -3, top = -3, bottom = -3}
    }

    local cd = {
        --  id   --  stacks stored
        [108853] = 2, -- fire blast
        [194466] = 2, -- phoenix's flames
        [205029] = 1  -- flame on
    }

    local C = CreateFrame('Button', nil, UIParent)
    C:SetSize(20, 14)
    C:SetBackdrop(BACKDROP)
    C:SetBackdropColor(0, 0, 0)
    C.id = 190319
    C.callback = function(v)
        print'true'
        if  v.CD then return true end
        for id, stacks in pairs(cd) do
            if IsPlayerSpell(id) then
                print(GetSpellName(id))
                local start, duration, enable = GetSpellCooldown(id)
                local charges = GetSpellCharges(id)
                if duration > 1.5 and charges and charges < stacks then return false end
            end
        end
        return true
    end

    C.t = C:CreateTexture(nil, 'ARTWORK')
    C.t:SetAllPoints()
    C.t:SetTexture[[Interface\Icons\spell_fire_sealoffire]]
    C.t:SetTexCoord(.1, .9, .25, .75)

    ns.C = C

    --
