#!/bin/bash


docker build -t quay.io/ohrimenko1988/base-calculator-image:latest .


docker build -t quay.io/ohrimenko1988/calc-front:latest -f my-app/Dockerfile my-app


docker build -t quay.io/ohrimenko1988/calculator-server-div:latest -f server/div/Dockerfile server/div
docker build -t quay.io/ohrimenko1988/calculator-server-mul:latest -f server/mul/Dockerfile server/mul
docker build -t quay.io/ohrimenko1988/calculator-server-sub:latest -f server/sub/Dockerfile server/sub
docker build -t quay.io/ohrimenko1988/calculator-server-sum:latest -f server/sum/Dockerfile server/sum


docker login -u ohrimenko1988 -p $1 https://quay.io

docker push quay.io/ohrimenko1988/calc-front:latest

docker push quay.io/ohrimenko1988/calculator-server-div:latest
docker push quay.io/ohrimenko1988/calculator-server-mul:latest
docker push quay.io/ohrimenko1988/calculator-server-sub:latest
docker push quay.io/ohrimenko1988/calculator-server-sum:latest



