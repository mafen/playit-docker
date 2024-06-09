FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y curl gnupg

RUN curl -SsL https://playit-cloud.github.io/ppa/key.gpg | apt-key add - && curl -SsL -o /etc/apt/sources.list.d/playit-cloud.list https://playit-cloud.github.io/ppa/playit-cloud.list

RUN apt-get update

RUN apt-get install playit -y

RUN useradd -m -s /bin/bash playit

USER playit

WORKDIR /home/playit

COPY --chown=playit:playit setup.sh /home/playit/setup.sh 

ENTRYPOINT [ "/bin/bash", "-c", "./setup.sh" ]