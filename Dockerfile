FROM python:2.7-alpine

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN apk update && \
    apk upgrade && \
    apk add git exiftool

COPY requirements.txt /usr/src/app/
#ADD src/sortphotos.py /usr/local/bin/
#RUN chmod 700 /usr/local/bin/sortphotos.py
RUN pip install --no-cache-dir -r requirements.txt

VOLUME ["/orig", "/dest"]

CMD    [ "/usr/local/bin/sortphotos" ]
