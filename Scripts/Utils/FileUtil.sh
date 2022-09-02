function CreateDirectory() {
    # $1 directory path or name
    if [ ! -d "$1" ]; then
        mkdir $1
    fi
}

function DownloadFile() {
    #2 path ,1 url
    if [ ! -f $2 ]; then
        wget -q $1 -O $2
    fi
}

function RemoveNULFile() {
    if [ -e "$NullFile" ]; then
        rm ./NUL
    fi
}
