# Set a random Event value from 1 to 5
execute store result score @e[type=armor_stand, name="TimeKeeper"] Event run random value 1..5

#Reset RandomItem to prevent further collection
scoreboard players set @e[type=armor_stand, name="TimeKeeper"] RandomItem 100

# Display the selected Event to all players
tellraw @a ["",{"text":"Event selected: ","color":"yellow"},{"score":{"name":"@e[type=armor_stand, name=\"TimeKeeper\", limit=1]","objective":"Event"},"color":"gold"}]

# Reset Punished status
execute as @a[scores={Punished=1}] run scoreboard players set @s Punished 0
execute as @a[scores={SafeStatus=0}] run scoreboard players set @s Punished 1

# Announce to punished players
execute as @a[scores={Punished=1}] at @s run playsound entity.ender_dragon.growl master @s ~ ~ ~ 100 1
execute as @a[scores={Punished=1}] run title @s title {"text":"You have failed...", "color":"red"}

# Apply effects based on the selected Event value
execute as @a[scores={SafeStatus=0, Punished=1}] at @s if score @e[type=armor_stand, name="TimeKeeper", limit=1] Event matches 1 run attribute @s minecraft:max_health base set 2
execute as @a[scores={SafeStatus=0, Punished=1}] at @s if score @e[type=armor_stand, name="TimeKeeper", limit=1] Event matches 2 run attribute @s minecraft:attack_damage base set 0
execute as @a[scores={SafeStatus=0, Punished=1}] at @s if score @e[type=armor_stand, name="TimeKeeper", limit=1] Event matches 3 run function pingyoping:remove_random_items
execute as @a[scores={SafeStatus=0, Punished=1}] at @s if score @e[type=armor_stand, name="TimeKeeper", limit=1] Event matches 3 run function pingyoping:remove_random_items
execute as @a[scores={SafeStatus=0, Punished=1}] at @s if score @e[type=armor_stand, name="TimeKeeper", limit=1] Event matches 3 run function pingyoping:remove_random_items
execute as @a[scores={SafeStatus=0, Punished=1}] at @s if score @e[type=armor_stand, name="TimeKeeper", limit=1] Event matches 4 run attribute @s minecraft:scale base set 2

# Reset Timer
scoreboard players set @e[type=armor_stand, name="TimeKeeper"] Timer 0
