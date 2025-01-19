
# tmodloader calamity lag fix

A big problem that my friends and I have ran into is calamity bosses are very laggy in multipler, teleporting around and desyncing heavily.
I came across [this fix](##acknowledgements)

However, the config file was being overwritten every time the world saved or the game was exited even when set to read-only and turning off steam cloud. The purpose of this script is to automatically set the MultiplayerNPCSmoothingRange to 0 on tmodloader startup and then set the file to read-only.
## Installation

#### 1. Install the release download [here](https://github.com/grecob/tmodloader-calamity-lag-fix/releases/latest)
#### 2. Navigate to your tmodloader folder, you can do this by going to your steam library, right clicking on tmodloader -> Properties -> Installed Files -> Browse
#### 3. Drag in start-tModLoader.bat and update-config.bat into your directory, overwritting  the old start-tModLoader.bat
#### 4. Simply run tmodloader through steam or start-tModLoader.bat and play as you normally would with no calamity boss lag!


## Known issues:
Currently, terraria remakes the config file overwritting the new file when the world is saved & exited. Therefore, when you save & exit you will need to restart your game for the config to refresh. 
## Acknowledgements

 - [Steam Guide to original fix](https://steamcommunity.com/sharedfiles/filedetails/?id=2923672646)

## Warning
This overwrites your config files, make a backup in both your terraria folder and tmodloader folder. If something breaks and you didn't back-up your configs, delete the config.json from both folders, delete the downloaded update-config.bat, edit the start-tmodloader bat file and remove the line "call update-config" and it will generate a new config when you start up your game. You can then re-install the bat files and put them back in the folder
