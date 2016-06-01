#!/bin/sh

/usr/bin/rsync --no-detach --daemon --config /etc/rsyncd.conf &

inotifywait -mr -e close_write --fromfile /app/wait-list.txt | while read DEST EVENT FILE
do
    UUID=`echo $(basename "$DEST")`
    mkdir -p /tmp/$UUID
    unzip $DEST$FILE -d /tmp/$UUID
    rsync -avP /tmp/$UUID rsync://fileman:873/unzip
    rm -rf /tmp/$UUID
    rm -f $DEST$FILE
done
