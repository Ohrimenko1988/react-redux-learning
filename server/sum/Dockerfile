FROM quay.io/ohrimenko1988/base-calculator-image:latest


COPY . /usr/local/app

RUN cd /usr/local/app

EXPOSE 3834

WORKDIR /usr/local/app

CMD [ "npm" , "run" , "start" ]

