FROM ubuntu:18.04

LABEL maintainer="tomer.klein@gmail.com"
RUN apt update
RUN apt install python-pip curl --yes
RUN pip install docker --no-cache-dir
RUN pip install telepot

RUN apt install -yqq speedtest-cli wget

RUN wget https://raw.githubusercontent.com/sivel/speedtest-cli/v2.1.3/speedtest.py -O /usr/lib/python3/dist-packages/speedtest.py

RUN mkdir /opt/dockerbot

COPY dockerbot.py /opt/dockerbot

ENV API_KEY ""

ENTRYPOINT ["/usr/bin/python", "/opt/dockerbot/dockerbot.py"]
