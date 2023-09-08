FROM i386/debian:10

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8
ENV LC_LANG=.UTF-8
ENV ARCH=ia32
ENV CPU=i386

ARG CC=gcc
ARG CXX=g++

RUN apt-get update  &&                                                                     \
    apt-get -y install git sudo wget bash software-properties-common                       \
           build-essential gettext libbz2-dev libncurses5-dev libssl-dev                   \
           python3 python3-venv zlib1g-dev autoconf automake libtool

COPY tools /opt/tools

RUN /opt/tools/tools.sh install_cmake                   &&  \
    /opt/tools/tools.sh build_and_install_automake      &&  \
    /opt/tools/tools.sh build_and_install_python        &&  \
    /opt/tools/tools.sh build_and_install_jsonc         &&  \
    /opt/tools/tools.sh build_and_install_gpg           &&  \
    /opt/tools/tools.sh build_and_install_botan


#RUN useradd rnpuser
#RUN echo -e "rnpuser\tALL=(ALL)\tNOPASSWD:\tALL" > /etc/sudoers.d/rnpuser
#RUN echo -e "rnpuser\tsoft\tnproc\tunlimited\n" > /etc/security/limits.d/30-rnpuser.conf
