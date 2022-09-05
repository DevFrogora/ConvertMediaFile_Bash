#/!bin/bash

. ./Scripts/Config/URLConfig.sh
. $UtilsDir/FileUtil.sh

FrameDirectory="Frames"
NullFile="NUL"

#OutputFolder="./CompletedVideo"
OutputVideo="OutputVideo"

#filename=getGif.gif;

function AllGif2DifferentMp4() {
    echo -e "Pass the Output_Directory: \c"
    read OutputFolder
    if [[ $OutputFolder == "" ]]; then

        echo "Error in input enter: OutputFolderName"
        AllGif2DifferentMp4

    else

        if [ -d $OutputFolder ]; then
            echo "Clear $OutputFolder Dir"
            rm $OutputFolder/* # remove all files from Frames and WebMs to prevent errors
        else
            # echo "2"
            mkdir $OutputFolder
        fi

        if [ -d $OutputFolder"/"$FrameDirectory ]; then
            echo "Clear $OutputFolder"/"$FrameDirectory Dir"
            rm $OutputFolder"/"$FrameDirectory/* # remove all files from Frames and WebMs to prevent errors
        else
            # echo "1"
            mkdir $OutputFolder"/"$FrameDirectory
        fi

        count=0
        for FILE in *.gif; do

            sleep 2
            if [ -d $OutputFolder"/"$FrameDirectory ]; then
                echo "Clear $OutputFolder"/"$FrameDirectory Dir"
                rm $OutputFolder"/"$FrameDirectory/* # remove all files from Frames and WebMs to prevent errors
            else
                mkdir $OutputFolder"/"$FrameDirectory
            fi
            sleep 2

            echo $FILE" is under Process ..."
            ffmpeg -i "$FILE" $OutputFolder"/"$FrameDirectory/output_%05d.png 2>NUL # convert video into frames at 30fps, save output files to Frames
            if [ -e "$NullFile" ]; then
                rm ./NUL
            fi

            ffmpeg -i $OutputFolder"/"$FrameDirectory/output_%05d.png -vcodec libx264 \
                -vf "pad=ceil(iw/2)*2:ceil(ih/2)*2" -r 24 \
                -y -an $OutputVideo".mp4" 2>NUL

            count=$(ls "$OutputFolder" | wc -l)
            # echo "$(($count + 1))"

            RenameFile=$OutputVideo"_$(($count + 1)).mp4"
            mv $OutputVideo".mp4" $RenameFile

            mv $RenameFile $OutputFolder
            #echo "$RenameFile , $OutputFolder"
        done
        # echo "$RenameFile , $OutputFolder"
        # pwd
        echo "Done"
    fi
}
