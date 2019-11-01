#!/bin/sh -l

[ -z "$SYMFONY_PROJECT_ID" ] && echo "Need to set SYMFONY_PROJECT_ID" && exit 1
[ -z "$SYMFONY_TOKEN" ] && echo "Need to set SYMFONY_TOKEN" && exit 1
[ -z "$GITHUB_REF" ] && echo "Need to set GITHUB_REF" && exit 1
[ -z "$SYMFONY_FEATURE_PARENT_ENVIRONMENT" ] && SYMFONY_FEATURE_PARENT_ENVIRONMENT="master"

# get "foo" instead of "/refs/head/foo"
SYMFONY_ENVIRONMENT=${GITHUB_REF##*/}

sh -c "printenv"
sh -c "ssh -V"

sh -c "symfony version"
sh -c "symfony link $SYMFONY_PROJECT_ID"
sh -c "echo $SYMFONY_ENVIRONMENT"
sh -c "git status"
sh -c "git checkout -b $SYMFONY_ENVIRONMENT"
sh -c "symfony env:create $SYMFONY_ENVIRONMENT $SYMFONY_FEATURE_PARENT_ENVIRONMENT"
sh -c "symfony $*"
