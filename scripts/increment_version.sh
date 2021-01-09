#!/bin/bash
set -x

while getopts ":Mmp" opt; do
  case $opt in
    M )
      relType=major
      ;;
    m )
      relType=minor
      ;;
    p )
      relType=patch
      ;;
  esac
done
# relType=patch


if [ -z $relType ]; then
  echo "usage: $(basename $0) [-Mmp] major.minor.patch"
  exit 1
fi

if [ -z $2 ]; then
  echo "usage: $(basename $0) [-Mmp] major.minor.patch"
  exit 1
fi

version=$2
# version=0.5.3

parts=( ${version//./ } )
# echo ${parts[0]}  # 0
# echo ${parts[1]}  # 5
# echo ${parts[2]}  # 3

if [ $relType == "major" ]; then
  ((parts[0]++))
  parts[1]=0
  parts[2]=0
fi

if [ $relType == "minor" ]; then
  ((parts[1]++))
  parts[2]=0
fi

if [ $relType == "patch" ]; then
  ((parts[2]++))
fi

echo "${parts[0]}.${parts[1]}.${parts[2]}"
# 0.5.4