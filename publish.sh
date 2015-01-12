#!/bin/bash


MASTER_DIR=~/dev/hkfeed-dev/master_lists
DATE=$(./date.py)
WORKDIR=~/dev/hkfeed-dev/daily_reports/$DATE
mkdir $WORKDIR

# pull latest data from threat.morris.guru
~/scripts/pull_data.sh

# execute the daily report and output to file
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

# update master lists
~/dev/code/update_master.sh

git add $MASTER_DIR

git commit -m "Updating master lists for $DATE"

# add files to git repo
git add $WORKDIR

# commit changes
git commit -m "Pushing threat report for $DATE"

# push files to github
git push

# send confirmation email
# ~/dev/code/email.py

