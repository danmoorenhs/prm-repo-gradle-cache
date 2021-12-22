#!/bin/bash
TARGET_CACHE_DIR=.gradle-readonly-cache/

echo removing existing cache dir
rm -rf $TARGET_CACHE_DIR

echo rebuilding cache dir
mkdir $TARGET_CACHE_DIR
time gradle dependencies
cp -R ~/.gradle/caches/modules-2/ $TARGET_CACHE_DIR

pushd $TARGET_CACHE_DIR
echo cleaning lockfiles and gc.properties
find . -name '*lock' -delete
find . -name 'gc.properties' -delete
popd

du -h $TARGET_CACHE_DIR
