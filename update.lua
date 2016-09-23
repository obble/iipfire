

    local _, ns = ...

    local container = CreateFrame('Frame', nil, UIParent)

    local CombustionCD   = {
        --  id   --  stacks stored
        [108853] = 2, -- fire blast
        [194466] = 2, -- phoenix's flames
        [205029] = 1  -- flame on  todo: check if talented
    }

    local PositionGrid = function(f)
        local index = 1
        for _, v in pairs({ns.RoP, ns.C}) do
            if  IsPlayerSpell(v.id) and not v.CD then
                v:SetParent(container)
                v:ClearAllPoints()
                v:SetPoint('LEFT', (20 + 12)*(index - 1), 0)
                container:SetParent(f)
                container:ClearAllPoints()
                container:SetSize(20*index + 12*(index - 1), 20)
                container:SetPoint('TOP', f, 'BOTTOM')
                index = index + 1
            end
        end
    end

    local parent = function()
        local f = C_NamePlate.GetNamePlateForUnit'player'
        if f then
            PositionGrid(f)
        end
    end

    local CombustionLogic = function(v)
        for id, stacks in pairs(CombustionCD) do
            local charges = GetSpellCharges(id)
            if charges and charges < stacks then return true end
        end
        return false
    end

    local UpdateStacks = function(v)
        local charges = GetSpellCharges(v.id)
        v.stacks:SetText((charges and charges > 1) and charges or '')
    end

    local SPELL_UPDATE_COOLDOWN = function()
        for _, v in pairs({ns.RoP, ns.C}) do
            local start, duration, enable = GetSpellCooldown(v.id)
            if (enable == 1 and duration > 1.5) or (v.id == 190319 and CombustionLogic(v)) then
                    UIFrameFadeOut(v, .2, v:GetAlpha() > .2 and 1 or 0, 0)
                    C_Timer.After(.3, parent)   -- lol, dont ruin our nice flash
                    v.CD = true
            else
                UIFrameFadeIn(v, .2, v:GetAlpha() < .2 and 0 or 1, 1)
                if v.stacks then UpdateStacks(v) end
                C_Timer.After(.3, parent)
                v.CD = false
            end
        end
    end

    for _, v in pairs({ns.RoP, ns.C}) do
        v:SetScript('OnShow', parent)
        v:SetScript('OnHide', parent)
    end

    hooksecurefunc(NamePlateDriverFrame, 'SetupClassNameplateBar', parent)

    local e = CreateFrame'Frame'
    e:RegisterEvent'SPELL_UPDATE_COOLDOWN'
    e:SetScript('OnEvent', SPELL_UPDATE_COOLDOWN)


    --
