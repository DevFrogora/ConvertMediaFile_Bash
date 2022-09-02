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
    for i in "${!URLs[@]}"; do
        # Url ${URLs[$i]} , Path ${Paths[$i]}
        DownloadFile "${URLs[$i]}" "${Paths[$i]}"
    done
}

function PostUpdate(){
    # remove the downloaded file needed for downloaded
}