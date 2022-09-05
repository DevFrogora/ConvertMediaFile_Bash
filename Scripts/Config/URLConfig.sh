declare -A Paths
declare -A URLs

RepoRawUrl="https://raw.githubusercontent.com/DevFrogora/ConvertMediaFile_Bash/main" # name should be RepoRawUrl

FTP_IP="172.26.112.1"
FTPBaseUrl="ftp://$FTP_IP/ConvertMediaFile_Bash_Repo"

serverName="NP"

if [ $serverName == "FTP" ]; then
    RepoRawUrl=$FTPBaseUrl
fi

#for update
FileVersion=1662052212
FileVersionUrl=$RepoRawUrl"/CurrentVersion.txt";
RepoUrl="https://github.com/DevFrogora/ConvertMediaFile_Bash";


#for creating Directory
ScriptDir="Scripts"
addonsDir=$ScriptDir"/addons"
ConfigDir=$ScriptDir"/Config"
UpdateDir=$ScriptDir"/Update"
UtilsDir=$ScriptDir"/Utils"




Paths[Home]=$ScriptDir"/Home.sh"
Paths[Gif2Frame]=$addonsDir"/gif2frames.sh"
Paths[URLConfig]=$ConfigDir"/URLConfig.sh"
Paths[checkForUpdate]=$UpdateDir"/checkForUpdate.sh"
Paths[UpdateDownloader]=$UpdateDir"/UpdateDownloader.sh"
Paths[FileUtils]=$UtilsDir"/FileUtil.sh"
Paths[ColorUtil]=$UtilsDir"/ColorUtil.sh"
