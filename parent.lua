

    local _, ns = ...

    local parent = function(self)
        local f = C_NamePlate.GetNamePlateForUnit'player'
        if f then
            for i, v in pairs({ns.RoP, ns.C}) do
                v:SetParent(f)
                v:SetPoint('TOP', f, 'BOTTOM', v == ns.RoP and -16 or 16, 0)
            end
        end
    end

    local SPELL_UPDATE_COOLDOWN = function()
        for _, v in pairs({ns.RoP, ns.C}) do
            local start, duration, enable = GetSpellCooldown(v.id)
            if enable == 1 and duration > 1.5 then
                UIFrameFadeOut(v, .2, v:GetAlpha() > .2 and 1 or 0, 0)
                v.CD = true
            else
                UIFrameFadeIn(v, .2, v:GetAlpha() < .2 and 0 or 1, 1)
                v.CD = false
            end
        end
    end

    hooksecurefunc(NamePlateDriverFrame, 'SetupClassNameplateBar', parent)

    local e = CreateFrame'Frame'
    e:RegisterEvent'SPELL_UPDATE_COOLDOWN'
    e:SetScript('OnEvent', SPELL_UPDATE_COOLDOWN)


    --
