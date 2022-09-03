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
    URLConfigUrl="https://raw.githubusercontent.com/DevFrogora/ConvertMediaFile_Bash/main/Scripts/Config/URLConfig.sh"
    checkForUpdateUrl="https://raw.githubusercontent.com/DevFrogora/ConvertMediaFile_Bash/main/Scripts/Update/checkForUpdate.sh"
    UpdateDownloaderUrl="https://raw.githubusercontent.com/DevFrogora/ConvertMediaFile_Bash/main/Scripts/Update/UpdateDownloader.sh"
    FileUtilsUrl="https://raw.githubusercontent.com/DevFrogora/ConvertMediaFile_Bash/main/Scripts/Utils/FileUtil.sh"

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
}
