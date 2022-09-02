function RemovePreviousFiles() {
    #removes previous files
    rm -rf Scripts
}

function IsUpdateNeeded() {
    if [ -f "./Scripts/Config/URLConfig.sh" ]; then
        CurrentVersion=$(wget -qO - $FileVersionUrl)

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
