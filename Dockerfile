FROM ubuntu:latest
MAINTAINER Kohei Yoshikawa <marimo3418@neko2.net>
WORKDIR /opt
ADD http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz /opt/install-tl-unx.tar.gz
RUN apt update \
    && apt install perl wget -y \
    && tar xvf install-tl-unx.tar.gz \
    && rm -r install-tl-unx.tar.gz
COPY ./texlive.profile /opt/texlive.profile
RUN /opt/install-tl-*/install-tl -no-gui -profile /opt/texlive.profile
RUN /usr/local/texlive/????/bin/*/tlmgr path add
CMD sleep infinity