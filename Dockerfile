FROM ubuntu:latest
MAINTAINER Kohei Yoshikawa <kohei.yoshikawa@marihome.tk>
#Updated on 2021.07.16
ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /opt
ADD http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz /opt/install-tl-unx.tar.gz
RUN apt update \
    && apt install perl wget libssl1.1 libkrb5-3 zlib1g libicu66 gnome-keyring libsecret-1-0 desktop-file-utils x11-utils -y \
    && apt clean \
    && tar xvf install-tl-unx.tar.gz \
    && rm -r install-tl-unx.tar.gz \
    && rm -rf /var/lib/apt/lists/*
COPY ./texlive.profile /opt/texlive.profile
RUN /opt/install-tl-*/install-tl -no-gui -profile /opt/texlive.profile
RUN /usr/local/texlive/????/bin/*/tlmgr path add
CMD sleep infinity
