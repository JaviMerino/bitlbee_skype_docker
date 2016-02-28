FROM debian:jessie

## Expose ports.
EXPOSE 6667
VOLUME /srv/bitlbee

MAINTAINER Javi Merino <merino.jav@gmail.com>

COPY bitlbee.key /tmp/bitlbee.key
RUN echo "deb http://code.bitlbee.org/debian/master/jessie/amd64/ ./" > /etc/apt/sources.list.d/bitlbee.list
RUN apt-key add /tmp/bitlbee.key

# Reasons for each package:
#  - bitlbee-libpurple: bitlbee itself, with libpurple support
#  - build-essential: to build skype4pidgin
#  - curl: to download skype4pidgin
#  - libjson-glib-dev: to build skype4pidgin
#  - libpurple-dev: to build skype4pidgin
RUN apt-get update && apt-get install -y \
    bitlbee-libpurple \
    build-essential \
    curl \
    libjson-glib-dev \
    libpurple-dev

WORKDIR /tmp
# Install skypeweb
RUN curl -o skype4pidgin.tar.gz https://codeload.github.com/EionRobb/skype4pidgin/tar.gz/1.1
RUN tar xf skype4pidgin.tar.gz
WORKDIR /tmp/skype4pidgin-1.1/skypeweb
RUN make
RUN make install

## Setup service
RUN sed -i -e 's/# RunMode = Inetd/RunMode = ForkDaemon/' /etc/bitlbee/bitlbee.conf

# Cleanup
#RUN rm -rf /tmp/skype4pidgin.tar.gz /tmp/skype4pidgin-1.1

WORKDIR /srv/bitlbee
# CMD /usr/bin/bitlbee -nv
