#!/bin/bash
time gradle dependencies
cp -R ~/.gradle/caches/modules-2/ .gradle-readonly-cache/

pushd .gradle-readonly-cache
find . -name '*lock' -delete
find . -name 'gs.properties' -delete
popd
