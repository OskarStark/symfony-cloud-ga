#!/bin/sh -l

[ -z "$SYMFONY_PROJECT_ID" ] && echo "Need to set SYMFONY_PROJECT_ID" && exit 1
[ -z "$SYMFONY_TOKEN" ] && echo "Need to set SYMFONY_TOKEN" && exit 1

sh -c "printenv"

sh -c "/usr/local/bin/symfony link $SYMFONY_PROJECT_ID"
sh -c "/usr/local/bin/symfony $*"
