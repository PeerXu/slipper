#!/bin/bash

SLIPPER_HOME=/home/$(whoami)/.slipper

cd $SLIPPER_HOME

address=$(curl ifconfig.me)

if [ -e $address ""]; then
    echo "null"
    exit 1
fi

cat << EOF > addr.js
window.slipper = {
    "addr": "$address"
}
EOF
echo $address > addr

git add .
git commit -m "commit by post.sh on $(date)" -a
git push origin gh-pages
