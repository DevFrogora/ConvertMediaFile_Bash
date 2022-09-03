function RemovePreviousFiles() {
    #removes previous files
    rm -rf Scripts
}

function IsUpdateNeeded() {
    if [ -f "./Scripts/Config/URLConfig.sh" ]; then

        if [ $serverName == "FTP" ]; then
            # powershell.exe -ExecutionPolicy Bypass -Command "cmd /c curl -L -u FTPUser:FTPUser ftp://172.22.176.1/ConvertMediaFile_Bash_Repo/CurrentVersion.txt"
            CurrentVersion=$(powershell.exe -ExecutionPolicy Bypass -Command "cmd /c curl -L -u FTPUser:FTPUser $FileVersionUrl")
        else
            CurrentVersion=$(wget -qO - $FileVersionUrl)
        fi

        if ((CurrentVersion != FileVersion)); then

            # download the files
            #echo "not matched"
            echo "true"
        else
            echo "false"
        fi
    else
        echo "true"
    fi
}

function BeforeUpdate() {

    if [ ! -f "./URLConfig.sh" ]; then
        echo "$(tput bold) Downloading Update Material :/"
        if [ $serverName == "FTP" ]; then
            DownloadFTPFiles $URLConfigUrl
            DownloadFTPFiles $checkForUpdateUrl
            DownloadFTPFiles $UpdateDownloaderUrl
            DownloadFTPFiles $FileUtilsUrl
            DownloadFTPFiles $ColorUtilUrl
        else
            DownloadFile $URLConfigUrl
            DownloadFile $checkForUpdateUrl
            DownloadFile $UpdateDownloaderUrl
            DownloadFile $FileUtilsUrl
            DownloadFile $ColorUtilUrl
        fi
    fi
    echo "Importing Downloaded Update Material."
    . ./URLConfig.sh
    . ./checkForUpdate.sh
    . ./UpdateDownloader.sh
    . ./FileUtil.sh
    . ./ColorUtil.sh
}
