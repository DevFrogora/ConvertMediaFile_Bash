. $URLConfigPath

function PreUpdate() {
    CreateDirectory $ScriptDir
    #SubDirectory of ScriptsDir
    CreateDirectory $addonsDir
    CreateDirectory $ConfigDir
    CreateDirectory $UpdateDir
    CreateDirectory $UtilsDir
}

function UpdateProgress() {
    for i in "${!Paths[@]}"; do
        # Url ${URLs[$i]} , Path ${Paths[$i]}
        DownloadFile "$BaseUrl/${Paths[$i]}" "${Paths[$i]}"
    done
}

function PostUpdate(){
    # remove the downloaded file needed for downloaded
}

function UpdateCycle(){
    PreUpdate
    UpdateProgress
    PostUpdate
}