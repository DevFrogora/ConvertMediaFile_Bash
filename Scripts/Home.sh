#!/bin/bash

. ./Scripts/Config/URLConfig.sh
. $addonsDir/gif2frames.sh
. $addonsDir/mp42frames.sh
. $addonsDir/allGif2DifferentMp4.sh 

echo "-----Convert Media Home------"
while true; do
    echo "Choose the Option (Select the number)"
    echo "1) Convert gif to frames"
    echo "2) Convert mp4 to frames"
    echo "3) Convert all Gif in this directory to different mp4"
    echo "4) Report"
    read option

    case "$option" in
    1) MakeGifToFrames ;;
    2) MakeMp4ToFrames ;;
    3) AllGif2DifferentMp4 ;;
    4) $(powershell.exe Start chrome.exe "$RepoUrl/issues") ;;
    *) exit ;;
    esac
done
