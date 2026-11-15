-- hooks.lua: small bits of code for things faction.toml can't say.
-- PLACEHOLDER: on_enable and on_soldier_created are empty. Fill in or delete them.
local H = {}

-- Primary AT rifles: a soldier's main weapon, using its own ammo and reloading like any gun.
-- The code patches in qm.toml look for weapon.primaryAT. To make another weapon a primary
-- AT rifle, give it class = "atRifle" in faction.toml and add its tag here.
local PRIMARY_AT = { ptrd = true, ptrs = true, boysAT = true }

-- Suppressed weapons: firing does not always break the stealth or camo buff (the Sten MkVI
-- rule). The code patch in qm.toml looks for weapon.suppressed. Add a weapon's tag here.
local SUPPRESSED = { mosinBramit = true, ppdBramit = true, ppdBramitDrum = true }

-- Runs once, after the faction is applied.
function H.on_enable(faction)
end

-- Runs for every soldier of our side. unit is "base", "sarge", "para" or "french".
function H.on_soldier_created(dude, unit, side)
  -- Example: if unit == "french" then dude.speed = dude.speed + 5 end
end

-- Runs after every weapon is built. tag is the weapon's tag, e.g. "mosin".
function H.on_weapon_created(weapon, tag)
  -- A weapon table is reused when a soldier changes guns, so the flag is set or cleared every time.
  weapon.primaryAT = PRIMARY_AT[weapon.tag] or nil
  weapon.suppressed = SUPPRESSED[weapon.tag] or nil
end

return H
