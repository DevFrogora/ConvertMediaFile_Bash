#!/bin/bash

URLConfigUrl="https://raw.githubusercontent.com/DevFrogora/ConvertMediaFile_Bash/main/URLConfig.sh";
URLConfigPath="./URLConfig.sh"


function CreateDirectory() {
    # $1 directory path or name
    if [ ! -d "$1" ]; then
        mkdir $1
    fi
}

function DownloadScript() {
    #2 path ,1 url
    if [ ! -f $2 ]; then
        wget $1 -O $2
    fi
}


. $URLConfigPath
CurrentVersion=$(wget -qO - $FileVersionUrl)

if (( CurrentVersion !=  FileVersion   ))
then 
    echo "not matched"
else 
    echo "matched"
fi



CreateDirectory $ScriptDir
DownloadScript $HomeUrl $HomePath

# Lunch Home Script
$HomePath
