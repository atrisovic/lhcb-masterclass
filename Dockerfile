FROM lhcbdev/slc5-build 
MAINTAINER Ana Trisovic

USER root

RUN yum -y install wget

ENV ROOTSYS         "/opt/root"
ENV PATH            "$ROOTSYS/bin:$ROOTSYS/bin/bin:$PATH"
ENV LD_LIBRARY_PATH "$ROOTSYS/lib:$LD_LIBRARY_PATH"
ENV PYTHONPATH      "$ROOTSYS/lib:PYTHONPATH"

RUN /bin/bash -c "git clone --depth 1 http://root.cern.ch/git/root.git -b v5-32-02 --single-branch \
&& cd root \
&& ./configure --enable-table --enable-opengl --disable-castor \
&& make  \
&& make install \
&& cd .. \
&& rm -rf root"

RUN yum -y update

RUN yum -y install curl
RUN /bin/bash -c "wget --no-check-certificate https://cmake.org/files/v3.4/cmake-3.4.1.tar.gz \ 
&& tar -xvzf cmake-3.4.1.tar.gz \
&& cd cmake-3.4.1/ \
&& ./configure \
&& make \
&& make install"

#RUN update-alternatives --install /usr/bin/cmake cmake /usr/local/bin/cmake 1 --force

RUN git clone https://:@gitlab.cern.ch:8443/LHCbOutreach/LHCbMasterclass.git 
WORKDIR "/workspace/LHCbMasterclass"
RUN yum -y install root-graf3d-eve
RUN cmake .
RUN make

