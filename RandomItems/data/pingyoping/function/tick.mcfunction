# Increment Timer by 1 for tracking the game timer on the TimeKeeper armor stand
execute as @e[type=armor_stand, name="TimeKeeper"] run scoreboard players add @s Timer 1

# Increment TeleportTimer by 1 to control teleport-related events on the TimeKeeper armor stand
execute as @e[type=armor_stand, name="TimeKeeper"] run scoreboard players add @s TeleportTimer 1

# Start the game function when Timer reaches exactly 60 (1-minute mark)
execute if score @e[type=armor_stand, name="TimeKeeper", limit=1] Timer matches 6000 run function pingyoping:game_start

# Continuously check if players have collected the required item once Timer is above 61
execute as @e[type=armor_stand, name="TimeKeeper", limit=1] if score @s Timer matches 61.. run function pingyoping:check_item

# Run the spread function to teleport players randomly when TeleportTimer reaches 12000
execute if score @e[type=armor_stand, name="TimeKeeper", limit=1] TeleportTimer matches 12000 run function pingyoping:spread

# Trigger a negative event for non-safe players when Timer reaches exactly 72000
execute if score @e[type=armor_stand, name="TimeKeeper", limit=1] Timer matches 72000 run function pingyoping:trigger_negative_event

# Announce safe status to all players when a player reaches SafeStatus=1, reward successful players.
execute as @a[scores={SafeStatus=1}] run tellraw @a {"text":"", "extra":[{"selector":"@s"}, {"text":" is safe!", "color":"green"}]}
execute as @a[scores={SafeStatus=1}] run title @a title {"text":" You are safe!", "color":"green"}
execute as @a[scores={SafeStatus=1}] run loot give @s loot pingyoping:challenge_reward

# Update SafeStatus to 2 for players who have been marked as safe
scoreboard players set @a[scores={SafeStatus=1}] SafeStatus 2

# Remove players with SafeStatus of 1 or higher from the RedNames team
execute as @a[scores={SafeStatus=1..}, team=RedNames] run team leave @s

# Add players with SafeStatus of 1 or higher to the GreenNames team to mark them as safe
execute as @a[scores={SafeStatus=1..}] run team join GreenNames @s
