#!/bin/sh
cd java-9
sh build.sh
cd ..
docker build -t tarohi24/genepam:1 .
