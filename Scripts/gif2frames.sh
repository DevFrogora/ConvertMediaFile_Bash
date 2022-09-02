#/!bin/bash

FrameDirectory="Frames"
NullFile="NUL"

function MakeGifToFrames() {
    echo -e "Pass the File Name and Output_Directory: \c"
    read filename outputDir
    #filename=$1

    if [[ ("$filename" == *.gif) && (-f $filename) ]]; then
        # if [ -d "$FrameDirectory" ]; then
        #     echo "Clear Frame Dir"
        #     rm Frames/* # remove all files from Frames and WebMs to prevent errors
        # else
        #     mkdir $FrameDirectory
        # fi

        rm -rf $outputDir
        CreateDirectory $outputDir
        CreateDirectory $outputDir/$FrameDirectory

        # if [ ! -d "$outputDir" ]; then
        #     mkdir $outputDir
        # fi

        ffmpeg -i $filename $outputDir/Frames/output_%04d.png 2>NUL # convert video into frames at 30fps, save output files to Frames
        if [ -e "$NullFile" ]; then
            rm $outputDir/NUL
        fi
    else
        echo "its not a gif file"
    fi
}
