#!/bin/bash

URLConfigUrl="https://raw.githubusercontent.com/DevFrogora/ConvertMediaFile_Bash/main/Scripts/Config/URLConfig.sh"
checkForUpdateUrl="https://raw.githubusercontent.com/DevFrogora/ConvertMediaFile_Bash/main/Scripts/Update/checkForUpdate.sh"
UpdateDownloaderUrl="https://raw.githubusercontent.com/DevFrogora/ConvertMediaFile_Bash/main/Scripts/Update/UpdateDownloader.sh"
FileUtilsUrl="https://raw.githubusercontent.com/DevFrogora/ConvertMediaFile_Bash/main/Scripts/Utils/FileUtil.sh"

if [ ! -f "./Scripts/Config/URLConfig.sh" ]; then

    if [ ! -f "./URLConfig.sh" ]; then
        wget $URLConfigUrl
        wget $checkForUpdateUrl
        wget $UpdateDownloaderUrl
        wget $FileUtilsUrl
    fi
    . ./URLConfig.sh
    . ./checkForUpdate.sh
    . ./UpdateDownloader.sh
    . ./FileUtil.sh
else
    . ./Scripts/Config/URLConfig.sh
    . $ConfigDir/URLConfig.sh
    . $UpdateDir/checkForUpdate.sh
    . $UpdateDir/UpdateDownloader.sh
    . $UtilsDir/FileUtil.sh

fi

if [ $(IsUpdateNeeded) == "true" ]; then
    RemovePreviousFiles
    UpdateCycle
fi

# download config + utils + Update

# import it

# then run the update

# then clear the update files

# Lunch Home Script
$ScriptDir/Home.sh
