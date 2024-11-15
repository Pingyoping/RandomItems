# load.mcfunction

# Display a message to all players to indicate the datapack has loaded
tellraw @a {"text":"RandomItems has begun", "color":"blue"}

# Initialize scoreboards for tracking items, collection status, and timing
scoreboard objectives add RandomItem dummy
scoreboard objectives add Timer dummy
scoreboard objectives add SafeStatus dummy
scoreboard objectives add Event dummy
scoreboard objectives add Punished dummy
scoreboard objectives add TeleportTimer dummy

# Set default values for SafeStatus and Punished
scoreboard players set @a SafeStatus 0
scoreboard players set @a Punished 0

# Schedule the summoning of the new TimeKeeper armor stand after a short delay
schedule function pingyoping:summon_timekeeper 10t

# Create and configure teams for RedNames and GreenNames
team add RedNames
team modify RedNames color red

team add GreenNames
team modify GreenNames color green
