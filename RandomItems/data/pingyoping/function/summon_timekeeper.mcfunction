# summon_timekeeper.mcfunction
# Kill any existing TimeKeeper armor stands
kill @e[type=armor_stand, name="TimeKeeper"]
# Summon the TimeKeeper armor stand with the PrimaryTimeKeeper tag
summon armor_stand ~ 200 ~ {Invisible:1b,CustomName:'{"text":"TimeKeeper"}',CustomNameVisible:0b,NoGravity:1b,Invulnerable:1b}
