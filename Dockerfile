FROM ubuntu:focal-20220105
MAINTAINER Kohei Yoshikawa <admin@marihome.tk>
#Updated on 2022.01.27
ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /opt
ADD http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz /opt/install-tl-unx.tar.gz
RUN apt update \
    && apt upgrade -y \
    && apt install perl wget -y \
    && apt clean \
    && tar xvf install-tl-unx.tar.gz \
    && rm -r install-tl-unx.tar.gz \
    && rm -rf /var/lib/apt/lists/*
COPY ./texlive.profile /opt/texlive.profile
RUN /opt/install-tl-*/install-tl -no-gui -profile /opt/texlive.profile
RUN /usr/local/texlive/????/bin/*/tlmgr path add
CMD sleep infinity
