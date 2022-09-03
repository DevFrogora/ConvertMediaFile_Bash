declare -A Paths
declare -A URLs

#for update
FileVersion=1662052212
FileVersionUrl="https://raw.githubusercontent.com/DevFrogora/ConvertMediaFile_Bash/main/CurrentVersion.txt";
RepoUrl="https://github.com/DevFrogora/ConvertMediaFile_Bash";


#for creating Directory
ScriptDir="Scripts"
addonsDir=$ScriptDir"/addons"
ConfigDir=$ScriptDir"/Config"
UpdateDir=$ScriptDir"/Update"
UtilsDir=$ScriptDir"/Utils"

RepoRawUrl="https://raw.githubusercontent.com/DevFrogora/ConvertMediaFile_Bash/main" # name should be RepoRawUrl
FTPBaseUrl="ftp://172.22.176.1/ConvertMediaFile_Bash_Repo"


Paths[Home]=$ScriptDir"/Home.sh"
Paths[Gif2Frame]=$addonsDir"/gif2frames.sh"
Paths[URLConfig]=$ConfigDir"/URLConfig.sh"
Paths[checkForUpdate]=$UpdateDir"/checkForUpdate.sh"
Paths[UpdateDownloader]=$UpdateDir"/UpdateDownloader.sh"
Paths[FileUtils]=$UtilsDir"/FileUtil.sh"
Paths[ColorUtil]=$UtilsDir"/ColorUtil.sh"
