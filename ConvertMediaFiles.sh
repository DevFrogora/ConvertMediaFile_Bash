#!/bin/bash
RepoRawUrl="https://raw.githubusercontent.com/DevFrogora/ConvertMediaFile_Bash/main"
FTP_IP="172.19.224.1"
FTPBaseUrl="ftp://$FTP_IP/ConvertMediaFile_Bash_Repo"

serverName="FTP"

if [ $serverName == "FTP" ]; then
    RepoRawUrl=$FTPBaseUrl
fi

URLConfigUrl=$RepoRawUrl"/Scripts/Config/URLConfig.sh"
checkForUpdateUrl=$RepoRawUrl"/Scripts/Update/checkForUpdate.sh"
UpdateDownloaderUrl=$RepoRawUrl"/Scripts/Update/UpdateDownloader.sh"
FileUtilsUrl=$RepoRawUrl"/Scripts/Utils/FileUtil.sh"
ColorUtilUrl=$RepoRawUrl"/Scripts/Utils/ColorUtil.sh"

function DownloadFileInCurrent() {
    echo -e "$(tput setaf 2) $1"
    wget -q $1
}

function DownloadFTPFilesInCurrent() {
    #FTPBaseUrl=ftp://172.22.176.1/Repo  <-$1
    #powershell.exe -ExecutionPolicy Bypass -Command "cmd /c curl -u FTPUser:FTPUser ftp://172.22.176.1/Hello/image0.jpg -o ./image.jpg"
    #powershell.exe -ExecutionPolicy Bypass -Command "cmd /c curl -u FTPUser:FTPUser --remote-name ftp://172.22.176.1/Hello/image0.jpg"
    #curl -s $1 > $2
    echo -e "$(tput setaf 2) $1"
    powershell.exe -ExecutionPolicy Bypass -Command "cmd /c curl -s -u FTPUser:FTPUser --remote-name $1" #-u user , -s silent
}

#check if we already have the configuration file or not
if [ ! -f "./Scripts/Config/URLConfig.sh" ]; then

    # check if we have download file
    if [ ! -f "./URLConfig.sh" ]; then
        echo "$(tput bold) Downloading Update Material :/"
        if [ $serverName == "FTP" ]; then
            DownloadFTPFilesInCurrent $URLConfigUrl
            DownloadFTPFilesInCurrent $checkForUpdateUrl
            DownloadFTPFilesInCurrent $UpdateDownloaderUrl
            DownloadFTPFilesInCurrent $FileUtilsUrl
            DownloadFTPFilesInCurrent $ColorUtilUrl
        else
            DownloadFileInCurrent $URLConfigUrl
            DownloadFileInCurrent $checkForUpdateUrl
            DownloadFileInCurrent $UpdateDownloaderUrl
            DownloadFileInCurrent $FileUtilsUrl
            DownloadFileInCurrent $ColorUtilUrl
        fi
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

echo "$GI_FG_YELLOW Checking For Update $GI_NORMAL."
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
