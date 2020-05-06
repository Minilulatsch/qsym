FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y git build-essential sudo
RUN apt install git make

RUN mkdir -p /workdir/qsym

WORKDIR /workdir
RUN git clone https://github.com/mirrorer/afl
WORKDIR /workdir/afl
RUN make
RUN make install

WORKDIR /workdir/qsym
COPY . /workdir/qsym

RUN ./setup.sh
RUN pip install more-itertools==8.0.2
RUN pip install . --no-cache-dir
