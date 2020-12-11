#!/bin/bash


docker build -t bujhtr5555/base-calculator-image:latest .


docker build -t bujhtr5555/calculator-server-div:latest -f server/div/Dockerfile server/div
docker build -t bujhtr5555/calculator-server-mul:latest -f server/mul/Dockerfile server/mul
docker build -t bujhtr5555/calculator-server-sub:latest -f server/sub/Dockerfile server/sub
docker build -t bujhtr5555/calculator-server-sum:latest -f server/sum/Dockerfile server/sum


docker login -u $1 -p $2
docker push bujhtr5555/calculator-server-div:latest
docker push bujhtr5555/calculator-server-mul:latest
docker push bujhtr5555/calculator-server-sub:latest
docker push bujhtr5555/calculator-server-sum:latest



