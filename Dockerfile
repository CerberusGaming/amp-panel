FROM debian:jessie

ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8

RUN useradd -d /home/amp -m amp -s /bin/bash


RUN apt-get update \
    && apt-get -y install software-properties-common dirmngr apt-transport-https iptables-persistent

RUN apt-key adv --fetch-keys http://repo.cubecoders.com/archive.key \
    && apt-add-repository "deb http://repo.cubecoders.com/ debian/" \
    && apt-get update

RUN apt install ampinstmgr

USER amp
