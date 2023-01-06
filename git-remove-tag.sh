#!/usr/bin/env bash

TAG=$1 

git push --delete origin $TAG && git tag -d $TAG


