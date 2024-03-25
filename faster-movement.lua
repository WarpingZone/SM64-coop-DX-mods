-- name: Faster Movement v2.
-- incompatible:
-- description: speed overhaul. compatible with moveset mods.  by WarpingZone.

-- My first mod, i'm still learning .lua

function mario_before_phys_step(m)
    local hScale = 1.0
    local vScale = 1.0

    -- airborne speed
    if (m.action & ACT_FLAG_AIR) ~= 0 then
        hScale = hScale * 1.9
    end

    -- faster Running
    if (m.action & ACT_FLAG_MOVING) ~= 0 then
        hScale = hScale * 1.7
    end
        -- faster swimming based on the original
        if (m.action & ACT_FLAG_SWIMMING) ~= 0 then
            hScale = hScale * 2
            if m.action ~= ACT_WATER_PLUNGE then
                vScale = vScale * 2
            end
        end

        m.vel.x = m.vel.x * hScale
        m.vel.y = m.vel.y * vScale
        m.vel.z = m.vel.z * hScale
end

-----------
-- hooks --
-----------

hook_event(HOOK_BEFORE_PHYS_STEP, mario_before_phys_step)