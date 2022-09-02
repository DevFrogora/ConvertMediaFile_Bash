declare -A Paths
declare -A URLs

#for update
FileVersion=1662052212;
FileVersionUrl="https://raw.githubusercontent.com/DevFrogora/ConvertMediaFile_Bash/main/CurrentVersion.txt";

#for creating Directory
ScriptDir="Scripts"
addonsDir=$ScriptDir"/addons"
ConfigDir=$ScriptDir"/Config"
UpdateDir=$ScriptDir"/Update"
UtilsDir=$ScriptDir"/Utils"

Paths[Home]="./"$ScriptDir"/Home.sh"
Paths[Gif2Frame]="./"$addonsDir"/gif2frames.sh"
Paths[FileUtils]="./"$UtilsDir"/FileUtil.sh"


URLs[Home]="https://raw.githubusercontent.com/DevFrogora/ConvertMediaFile_Bash/main/Scripts/Home.sh";
URLs[Gif2Frame]="https://raw.githubusercontent.com/DevFrogora/ConvertMediaFile_Bash/main/Scripts/gif2frames.sh";
Urls[FileUtils]="";


# for i in "${!URLs[@]}"
# do

#   # Url ${URLs[$i]} , Path ${Paths[$i]}
#   echo -e "Urls : ${URLs[$i]} \c"
#   echo "Path : ${Paths[$i]}"
# done