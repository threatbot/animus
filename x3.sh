#!/bin/bash

DATE=$(./date.py)
WORKDIR=~/dev/hkfeed-dev/$DATE
mkdir $WORKDIR

# pull latest data from threat.morris.guru
~/scripts/pull_data.sh

# execute the report and output to file
./report2.sh > $WORKDIR/README.md

# cd to git directory
cd $WORKDIR

# create passwords file
~/dev/code/all_passwords_today.sh | sort -u > $WORKDIR/$DATE-passwords.txt

# create users file
~/dev/code/all_users_today.sh | sort -u > $WORKDIR/$DATE-users.txt

# create IPs file
~/dev/code/all_ips_today.sh | sort -u > $WORKDIR/$DATE-ips.txt

# create versions file
~/dev/code/all_versions_today.sh | sort -u > $WORKDIR/$DATE-versions.txt

# add files to git repo
git add $WORKDIR

# commit changes
git commit -m "Pushing threat report for $DATE"

# push files to github
git push
