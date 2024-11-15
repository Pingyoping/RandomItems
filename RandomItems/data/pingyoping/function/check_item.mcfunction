# Check all players to see if they have collected the required item
# Loop through potential item values and check if each player has that item.

# Ensure the check only applies to players who do not already have SafeStatus set to 1
execute as @a[scores={SafeStatus=0}] at @s run function pingyoping:check_for_item
