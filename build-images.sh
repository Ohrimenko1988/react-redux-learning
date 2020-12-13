#!/bin/bash

echo "###"
echo "###"
echo "###"
echo "BUILD PROJECT"
echo "###"
echo "###"
echo "###"
. build.sh

echo "###"
echo "###"
echo "###"
echo "BUILD BASE IMAGE"
echo "###"
echo "###"
echo "###"
docker build -t quay.io/ohrimenko1988/base-calculator-image:latest .


echo "###"
echo "###"
echo "###"
echo "BUILD FRONT IMAGE"
echo "###"
echo "###"
echo "###"
docker build -t quay.io/ohrimenko1988/calc-front:latest -f my-app/Dockerfile my-app


echo "###"
echo "###"
echo "###"
echo "BUILD DIV IMAGE"
echo "###"
echo "###"
echo "###"
docker build -t quay.io/ohrimenko1988/calculator-server-div:latest -f server/div/Dockerfile server/div


echo "###"
echo "###"
echo "###"
echo "BUILD MUL IMAGE"
echo "###"
echo "###"
echo "###"
docker build -t quay.io/ohrimenko1988/calculator-server-mul:latest -f server/mul/Dockerfile server/mul


echo "###"
echo "###"
echo "###"
echo "BUILD SUB IMAGE"
echo "###"
echo "###"
echo "###"
docker build -t quay.io/ohrimenko1988/calculator-server-sub:latest -f server/sub/Dockerfile server/sub


echo "###"
echo "###"
echo "###"
echo "BUILD SUM IMAGE"
echo "###"
echo "###"
echo "###"
docker build -t quay.io/ohrimenko1988/calculator-server-sum:latest -f server/sum/Dockerfile server/sum


echo "###"
echo "###"
echo "###"
echo "LOGIN TO QUAY.IO AND PUSH IMAGES"
echo "###"
echo "###"
echo "###"
docker login -u ohrimenko1988 -p $1 https://quay.io

docker push quay.io/ohrimenko1988/calc-front:latest

docker push quay.io/ohrimenko1988/calculator-server-div:latest
docker push quay.io/ohrimenko1988/calculator-server-mul:latest
docker push quay.io/ohrimenko1988/calculator-server-sub:latest
docker push quay.io/ohrimenko1988/calculator-server-sum:latest



