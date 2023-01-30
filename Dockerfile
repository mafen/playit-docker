FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y curl gnupg

RUN curl -SsL https://playit-cloud.github.io/ppa/key.gpg | apt-key add - && curl -SsL -o /etc/apt/sources.list.d/playit-cloud.list https://playit-cloud.github.io/ppa/playit-cloud.list

RUN apt-get update

RUN apt-get install playit -y

CMD playit
