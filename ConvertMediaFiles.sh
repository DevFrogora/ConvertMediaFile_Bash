#!/bin/bash

URLConfigUrl="https://raw.githubusercontent.com/DevFrogora/ConvertMediaFile_Bash/main/Scripts/Config/URLConfig.sh"
checkForUpdateUrl="https://raw.githubusercontent.com/DevFrogora/ConvertMediaFile_Bash/main/Scripts/Update/checkForUpdate.sh"
UpdateDownloaderUrl="https://raw.githubusercontent.com/DevFrogora/ConvertMediaFile_Bash/main/Scripts/Update/UpdateDownloader.sh"
FileUtilsUrl="https://raw.githubusercontent.com/DevFrogora/ConvertMediaFile_Bash/main/Scripts/Utils/FileUtil.sh"
ColorUtilUrl=""

#check if we already have the configuration file or not
if [ ! -f "./Scripts/Config/URLConfig.sh" ]; then

    # check if we have download file
    if [ ! -f "./URLConfig.sh" ]; then
        echo "$(tput bold) Downloading Update Material :/"
        echo -e "$(tput setaf 2) $URLConfigUrl"
        wget -q $URLConfigUrl
        echo -e "$(tput setaf 2) $checkForUpdateUrl"
        wget -q $checkForUpdateUrl
        echo -e "$(tput setaf 2) $UpdateDownloaderUrl"
        wget -q $UpdateDownloaderUrl
        echo -e "$(tput setaf 2) $FileUtilsUrl"
        wget -q $FileUtilsUrl
        echo -e "$(tput setaf 2) $ColorUtilUrl"
        wget -q $ColorUtilUrl
    fi
    echo "Importing Downloaded Update Material."
    . ./URLConfig.sh
    . ./checkForUpdate.sh
    . ./UpdateDownloader.sh
    . ./FileUtil.sh
    . ./ColorUtil.sh
else
    echo "Importing existing Update Material."
    . ./Scripts/Config/URLConfig.sh
    . $ConfigDir/URLConfig.sh
    . $UpdateDir/checkForUpdate.sh
    . $UpdateDir/UpdateDownloader.sh
    . $UtilsDir/FileUtil.sh

fi

echo "$(tput setaf 3) Checking For Update ."
if [ "$(IsUpdateNeeded)" == "true" ]; then
    echo "Updating Wait :/ ."
    RemovePreviousFiles
    BeforeUpdate
    UpdateCycle
fi

# download config + utils + Update

# import it

# then run the update

# then clear the update files

# Lunch Home Script
$ScriptDir/Home.sh
