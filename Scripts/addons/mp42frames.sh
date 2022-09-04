#/!bin/bash

. ./Scripts/Config/URLConfig.sh
. $UtilsDir/FileUtil.sh

FrameDirectory="Frames"
NullFile="NUL"

function MakeMp4ToFrames() {
    echo -e "Pass the Mp4 File Name and Output_Directory: \c"
    read filename outputDir
    if [[ ("$filename" == "") || ("$outputDir" == "") ]]; then

        echo "Error in input enter: filename.mp4 OutputDirectoryName"

    else
        if [[ ("$filename" == *.mp4) && (-f $filename) ]]; then

            rm -rf $outputDir
            CreateDirectory $outputDir
            CreateDirectory $outputDir/$FrameDirectory

            ffmpeg -i $filename $outputDir/Frames/output_%04d.png 2>NUL # convert video into frames at 30fps, save output files to Frames
            RemoveNULFile
            echo "Done"
        else
            echo "its not a mp4 file"
        fi

    fi
}
