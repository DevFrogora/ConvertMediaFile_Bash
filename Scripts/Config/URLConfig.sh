declare -A Paths
declare -A URLs

#for update
FileVersion=1662052212
FileVersionUrl="https://raw.githubusercontent.com/DevFrogora/ConvertMediaFile_Bash/main/CurrentVersion.txt"

#for creating Directory
ScriptDir="Scripts"
addonsDir=$ScriptDir"/addons"
ConfigDir=$ScriptDir"/Config"
UpdateDir=$ScriptDir"/Update"
UtilsDir=$ScriptDir"/Utils"

BaseUrl="https://raw.githubusercontent.com/DevFrogora/ConvertMediaFile_Bash/main"
Paths[Home]=$ScriptDir"/Home.sh"
Paths[Gif2Frame]=$addonsDir"/gif2frames.sh"
Paths[URLConfig]=$ConfigDir"/URLConfig.sh"
Paths[checkForUpdate]=$UpdateDir"/checkForUpdate.sh"
Paths[UpdateDownloader]=$UpdateDir"/UpdateDownloader.sh"
Paths[FileUtils]=$UtilsDir"/FileUtil.sh"
