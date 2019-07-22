FROM alpine:3.8

RUN apk update && apk add --no-cache nmap nmap-scripts python3 fontconfig curl curl-dev xvfb git ttf-dejavu

RUN mkdir -p /tmp/phantom \
    && cd /tmp/phantom \
    && curl -Ls https://github.com/dustinblackman/phantomized/releases/download/2.1.1/dockerized-phantomjs.tar.gz | tar xz \
    && cp -R lib lib64 / \
    && cp -R usr/lib/x86_64-linux-gnu /usr/lib \
    && curl -k -Ls https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 | tar -jxf - \
    && cp phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin/phantomjs \
    && cd .. \ 
    && rm -r phantom
	
RUN cd /tmp/ \
    && git clone https://github.com/maaaaz/webscreenshot \
    && pip3 install --upgrade pip \
    && pip3 install --no-cache-dir -r webscreenshot/requirements.txt \
    && pip3 install webscreenshot \
    && rm -r webscreenshot

COPY ./xvfb-run /usr/bin/
RUN chmod +x /usr/bin/xvfb-run
