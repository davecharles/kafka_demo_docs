FROM alpine
RUN apk add \
    inotify-tools \
    make \
    py3-pip
COPY requirements.txt requirements.txt
RUN pip3 install -U pip && pip3 install -r requirements.txt
WORKDIR /mnt/app
CMD make watch
