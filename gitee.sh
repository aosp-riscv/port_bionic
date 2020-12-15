#!/bin/bash
sed -i "s/github/gitee/g" ./.gitmodules
git submodule init
git submodule update --progress


