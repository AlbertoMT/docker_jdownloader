FROM openjdk:8-jre
MAINTAINER Alberto
# Based on dbarton/jdownloader

RUN groupadd -r -g 1234 jdownloader \
    && useradd -r -u 1234 -g 1234 -d /jdownloader -m jdownloader

RUN mkdir -p /jdownloader/cfg

ADD jdownloader.sh /jdownloader.sh
ADD myjdownloader.json /myjdownloader.json

RUN chmod 755 /jdownloader.sh

RUN wget -O /jdownloader/JDownloader.jar http://installer.jdownloader.org/JDownloader.jar

VOLUME "/jdownloader/cfg"

WORKDIR /jdownloader

CMD ["/jdownloader.sh"]