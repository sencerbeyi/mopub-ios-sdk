#!/bin/bash

# Any subsequent(*) commands which fail will cause the shell script to exit immediately
set -e


# Color Table
# -----------------------------------------
# Black        0;30     Dark Gray     1;30
# Blue         0;34     Light Blue    1;34
# Green        0;32     Light Green   1;32
# Cyan         0;36     Light Cyan    1;36
# Red          0;31     Light Red     1;31
# Purple       0;35     Light Purple  1;35
# Brown/Orange 0;33     Yellow        1;33
# Light Gray   0;37     White         1;37

red='\033[1;31m'
grn='\033[1;32m'
wht='\033[1;37m'
prp='\033[0;35m'
ylw='\033[0;33m'
nc='\033[0m' # No Color

# Put empty line as a separator
echo

# ===================================================================
#  Change to script directory
# ===================================================================

cd "`dirname $0`"

# ===================================================================
#  Commit & Push podspec to working repo
# ===================================================================

echo -e "${prp}# commit & push podspec to working repo \n" "${nc}"

# add
echo -e "${wht}git add -A " "${nc}"
echo

git add -A
echo

# commit
echo -e "${wht}git commit -m 'updated podspec' " "${nc}"
echo

git commit -m 'updated podspec to publish'
echo

# push
echo -e "${wht}git push " "${nc}"
echo

git push
echo

# print status
echo -e "${wht}git status" "${nc}"
echo

git status
echo

# ===================================================================
#  Git tag with new version
# ===================================================================

# extract pod version
pod_ver=$(sed -n 's/s.version.*"\(.*\)"/\1/p' *.podspec | xargs)

#
echo -e "${prp}# git tag with new version: ${ylw} ${pod_ver} \n" "${nc}"
echo

# git tag
git tag "$pod_ver"
git push --tags
echo

# ===================================================================
#  Push podspec to specs repo
# ===================================================================

#
echo -e "${prp}# push podspec to pod repo \n" "${nc}"

#
pod repo push lg-podspecs *.podspec --allow-warnings --verbose
echo

# ===================================================================
#  Done!
# ===================================================================
echo -e "${prp}# Script done!..\n" "${nc}"














