function RemovePreviousFiles() {
    #removes previous files
    rm -rf Scripts
}

CurrentVersion=$(wget -qO - $FileVersionUrl)

if ((CurrentVersion != FileVersion)); then
    RemovePreviousFiles
    # download the files
    #echo "not matched"
fi
