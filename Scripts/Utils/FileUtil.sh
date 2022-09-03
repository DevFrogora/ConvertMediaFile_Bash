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
        echo "Path $2 , URL $1"
    fi
    echo "~Path $2 , URL $1"
}

function RemoveNULFile() {
    if [ -e "$NullFile" ]; then
        rm ./NUL
    fi
}

function DownloadFTPFiles() {
    #FTPBaseUrl=ftp://172.22.176.1/Repo  <-$1
    #powershell.exe -ExecutionPolicy Bypass -Command "cmd /c curl -u FTPUser:FTPUser ftp://172.22.176.1/Hello/image0.jpg -o ./image.jpg"
    #curl -s $1 > $2
    
    if [ ! -f $2 ]; then
        powershell.exe -ExecutionPolicy Bypass -Command "cmd /c curl -s -u FTPUser:FTPUser $1 -o $2" #-u user , -s silent
        wget -q $1 -O $2
        echo "Path $2 , URL $1"
    fi
    echo "~Path $2 , URL $1"
}
