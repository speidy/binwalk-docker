FROM buildpack-deps:xenial

LABEL maintainer "speidy@gmail.com"

RUN apt-get update && apt-get install -y \
	git wget python python-pip sudo

RUN pip install --upgrade pip

RUN git clone https://github.com/ReFirmLabs/binwalk.git /opt/binwalk

RUN (cd /opt/binwalk && ./deps.sh --yes && python setup.py install)

RUN rm -rf /var/lib/apt/lists/*

CMD /bin/bash
