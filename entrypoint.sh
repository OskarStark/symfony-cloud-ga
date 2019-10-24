#!/bin/sh -l

sh -c "/usr/local/bin/symfony link $SYMFONY_PROJECT_ID"
sh -c "/usr/local/bin/symfony $*"

