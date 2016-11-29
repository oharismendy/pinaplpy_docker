FROM ubuntu:16.04

### File author / maintainer
MAINTAINER Olivier Harismendy "oharismendy@ucsd.edu"

### change a working directory to /opt #######
WORKDIR /opt

### install
RUN apt-get update && apt-get install -y \
autoconf \
build-essential \
curl \
git \
g++ \
libncurses5-dev \
libssl-dev \
libboost-all-dev \
libbz2-dev \
make \
man \
pkg-config \
python \
python-tk \
python-pip \
python-dev \
python-numpy \
python-yaml \
software-properties-common \
screen \
vim \
wget \
zip \
zlibc \
zlib1g \
zlib1g-dev \
gedit \
gpicview \
r-base

RUN R -e "install.packages(c('heatmap.2','gplots'), repos = 'http://cran.rstudio.com/')" 

RUN pip install --upgrade pip &&\
    pip install scipy \
    statsmodels \
    pandas \
    matplotlib \
    cutadapt \
    joblib \
    multiprocessing 

RUN git clone https://github.com/BenLangmead/bowtie2.git &&\
 cd bowtie2 &&\
 make &&\
 cp bowtie2 /usr/bin &&\
 cp bowtie2-align-s /usr/bin &&\
 cp bowtie2-align-l /usr/bin &&\
 cp bowtie2-build /usr/bin &&\
 cp bowtie2-build-s /usr/bin &&\
 cp bowtie2-build-l /usr/bin &&\
 cp bowtie2-inspect /usr/bin &&\
 cp bowtie2-inspect-s /usr/bin &&\
 cp bowtie2-inspect-l /usr/bin

RUN git clone https://github.com/Yavin4/PinAPLPy.git &&\
	mkdir -p /scratch &&\
	cp -R /opt/PinAPLPy/Data /scratch &&\
	cp -R /opt/PinAPLPy/Library /scratch &&\
	cp /opt/PinAPLPy/configuration.yaml /scratch  
	
WORKDIR /scratch
