FROM debian:jessie

# Install required packages
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update \
    && apt-get -y install software-properties-common dirmngr apt-transport-https locales
ENV LANG en_US.UTF-8  
ENV LC_ALL en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8
RUN apt-key adv --fetch-keys http://repo.cubecoders.com/archive.key \
    && apt-add-repository "deb http://repo.cubecoders.com/ debian/" \
    && apt-get update \
    && apt-get -y install ampinstmgr

# Add user
RUN useradd -d /opt/amp -ms /bin/bash -r amp 
USER amp
WORKDIR /opt/amp

# Import entrypoint
COPY docker-entrypoint.sh /usr/local/bin/
RUN ln -s /usr/local/bin/docker-entrypoint.sh /

# Set execution env and run
EXPOSE 8080
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["tail", "-f", "/dev/null"]
