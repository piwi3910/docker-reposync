#!/bin/bash

REPOSYNC_OPTIONS="-c /repo/conf/yum.conf -p /repo/repo --downloadcomps --download-metadata --cachedir=cachedir --newest-only --plugins --delete"
CREATEREPO_OPTIONS="--cachedir cachedir --update"

function init() {
    if [ ! -d /repo/conf ]; then
        echo "### (init) Creating default configuration ###"
        mkdir /repo/conf
        cp /etc/yum.conf /repo/conf/
        cp -a /etc/yum.repos.d /repo/conf/

        echo "reposdir=/repo/conf/yum.repos.d" >> /repo/conf/yum.conf
        if [ "$PROXY" != "" ]; then
            echo "proxy=$PROXY" >> /repo/conf/yum.conf
        fi
    fi

    if [ ! -d /repo/repo ]; then
        echo "### (init) Creating download directory ###"
        mkdir /repo/repo
    fi
}

if [ "$1" = "init" ]; then
    init
    exit 0
fi

if [ "${1:0:1}" != '-' ]; then
    exec $1
fi

init

echo "### Downloading repositories ###"
if [ "$1" != "" ]; then
    REPOSYNC_OPTIONS="$REPOSYNC_OPTIONS $@"
    echo "reposync options = $REPOSYNC_OPTIONS"
fi
reposync $REPOSYNC_OPTIONS
if [ $? -ne 0 ]; then
    echo "ERROR: reposync"
    exit 1
fi

echo "### Creating repositories ###"

for i in `ls /repo/repo`; do
  if [ $REPO = 'base' ]
  then
    createrepo $CREATEREPO_OPTIONS -g comps.xml /repo/repo/$i
  else
    createrepo $CREATEREPO_OPTIONS /repo/repo/$i
  fi
done

if [ $? -ne 0 ]; then
    echo "ERROR: createrepo"
    exit 1
fi

exit 0
