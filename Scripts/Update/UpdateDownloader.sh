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
    local carriageReturn="\r"
    local number=$1
    local num=$((number))

    for ((i = 1; i <= $num; i++)); do
        message=$message"#"
    done

    echo -ne $message"($1/$2 %)\r"

}

function UpdateProgress() {
    local fileCount=0
    for i in "${!Paths[@]}"; do
        fileCount=$((fileCount + 1))
        # Url ${URLs[$i]} , Path ${Paths[$i]}
        local lengthOfPath="${#Paths[@]}"
        Progress $((fileCount)) $lengthOfPath
        sleep 3s
        DownloadFile "$BaseUrl/${Paths[$i]}" "${Paths[$i]}"
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

    echo "done"
    # remove the downloaded file needed for downloaded
}

function UpdateCycle() {
    PreUpdate
    UpdateProgress
    PostUpdate
}
