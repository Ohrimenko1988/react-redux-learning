FROM quay.io/ohrimenko1988/base-calculator-image:latest


COPY . /temp/app

EXPOSE 3000

WORKDIR /temp/app

RUN npm install -g serve


USER root

ENTRYPOINT [ "./entrypoint.sh" ]
