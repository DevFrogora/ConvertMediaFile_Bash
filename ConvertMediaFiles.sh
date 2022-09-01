#!/bin/bash

URLConfigUrl="https://raw.githubusercontent.com/DevFrogora/ConvertMediaFile_Bash/main/URLConfig.sh"
URLConfigPath="./URLConfig.sh"

function CreateDirectory() {
    # $1 directory path or name
    if [ ! -d "$1" ]; then
        mkdir $1
    fi
}

function DownloadFile() {
    #2 path ,1 url
    if [ ! -f $2 ]; then
        wget $1 -O $2
    fi
}

function UpdateOfVersion() {
    #removes previous files
    rm -rf Scripts
    rm URLConfig.sh

    DownloadFile $URLConfigUrl $URLConfigPath
    . $URLConfigPath
}

DownloadFile $URLConfigUrl $URLConfigPath
. $URLConfigPath
CurrentVersion=$(wget -qO - $FileVersionUrl)

if ((CurrentVersion != FileVersion)); then
    UpdateOfVersion
    #echo "not matched"
fi

CreateDirectory $ScriptDir
DownloadFile $HomeUrl $HomePath

# Lunch Home Script
$HomePath
