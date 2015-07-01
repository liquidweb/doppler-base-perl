FROM perl:5.20
MAINTAINER Dan Burke <dburke@liquidweb.com>
RUN apt-get clean && apt-get update && apt-get upgrade -y && apt-get clean
RUN apt-get clean && apt-get update && apt-get install -y git vim telnet && apt-get clean

RUN cpan -i Bundle::CPAN && rm -rf .cpan/build .cpan/Metadata .cpan/sources

ADD Snapshot.pm /root/.cpan/Bundle/Snapshot.pm
RUN cpan -i -T Bundle::Snapshot && rm -rf /root/.cpan/build /root/.cpan/Metadata /root/.cpan/sources
RUN cpanm -n Net::AMQP::RabbitMQ
RUN cpanm -n DBD::Mock
RUN cd /tmp && git clone https://github.com/theory/router-resource.git && cd router-resource && perl Build.PL && ./Build && ./Build install && cd /tmp && rm -rf router-resource


RUN mkdir -p /usr/local/lp/libs /usr/local/lp/git /usr/local/lp/configs/LWConfig

WORKDIR /usr/local/lp/git/doppler-dev

CMD /bin/bash

