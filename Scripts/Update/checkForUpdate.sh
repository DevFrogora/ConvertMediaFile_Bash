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


