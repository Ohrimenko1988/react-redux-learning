#!/bin/bash


docker build -t bujhtr5555/base-calculator-image:latest .


docker build -t bujhtr5555/calc-front:latest -f my-app/Dockerfile my-app


docker build -t bujhtr5555/calculator-server-div:latest -f server/div/Dockerfile server/div
docker build -t bujhtr5555/calculator-server-mul:latest -f server/mul/Dockerfile server/mul
docker build -t bujhtr5555/calculator-server-sub:latest -f server/sub/Dockerfile server/sub
docker build -t bujhtr5555/calculator-server-sum:latest -f server/sum/Dockerfile server/sum


docker login -u bujhtr5555 -p $1

docker push bujhtr5555/calc-front:latest

docker push bujhtr5555/calculator-server-div:latest
docker push bujhtr5555/calculator-server-mul:latest
docker push bujhtr5555/calculator-server-sub:latest
docker push bujhtr5555/calculator-server-sum:latest



