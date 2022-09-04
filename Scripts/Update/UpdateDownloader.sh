function PreUpdate() {
    CreateDirectory $ScriptDir
    #SubDirectory of ScriptsDir
    CreateDirectory $addonsDir
    CreateDirectory $ConfigDir
    CreateDirectory $UpdateDir
    CreateDirectory $UtilsDir
}

function Progress() {
    local message="Downloading Progress "

    local number=$1
    local num=$((number))

    for ((i = 1; i <= $num; i++)); do
        message=$message"#"
    done

    echo -ne $message"($1/$2 %)\r"

}

function UpdateProgress() {
    local fileCount=0
    echo "$serverName"
    for key in "${!Paths[@]}"; do
        fileCount=$((fileCount + 1))
        # Url ${URLs[$i]} , Path ${Paths[$i]}
        local lengthOfPath="${#Paths[@]}"
        Progress $((fileCount)) $lengthOfPath

        if [ $serverName == "FTP" ]; then
            DownloadFTPFiles "$RepoRawUrl/${Paths[$key]}" "${Paths[$key]}"
        else
            DownloadFile "$RepoRawUrl/${Paths[$key]}" "${Paths[$key]}"
        fi

        sleep 3s
    done

    echo -ne '\n'
    echo "Downloaded Files:"

    for i in "${!Paths[@]}"; do
        # Url ${URLs[$i]} , Path ${Paths[$i]}
        echo "${Paths[$i]}"
    done
}

function PostUpdate() {
    rm ./URLConfig.sh
    rm ./checkForUpdate.sh
    rm ./UpdateDownloader.sh
    rm ./FileUtil.sh
    rm ./ColorUtil.sh

    echo "done"
    # remove the downloaded file needed for downloaded
}

function UpdateCycle() {
    PreUpdate
    UpdateProgress
    PostUpdate
}

function BeforeUpdate() {

    if [ ! -f "./URLConfig.sh" ]; then
        echo "$GI_BOLD Downloading Update Material from $serverName $GI_NORMAL:/"
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
}