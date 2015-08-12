FROM perl:5.20
MAINTAINER Dan Burke <dburke@liquidweb.com>
RUN apt-get clean && apt-get update && apt-get upgrade -y && apt-get clean
RUN apt-get clean && apt-get update && apt-get install -y git vim telnet && apt-get clean

WORKDIR /root
#RUN cpan -i Bundle::CPAN && rm -rf .cpan/build .cpan/Metadata .cpan/sources

RUN cpanm -n Net::AMQP::RabbitMQ
RUN cpanm -n DBD::Mock
RUN cpanm -n Nagios::NRPE
ADD install_modules.sh /root/install_modules.sh
ADD modules.txt /root/modules.txt
RUN /root/install_modules.sh
RUN cd /tmp && git clone https://github.com/theory/router-resource.git && cd router-resource && perl Build.PL && ./Build && ./Build install && cd /tmp && rm -rf router-resource

RUN mkdir -p /usr/local/lp/libs /usr/local/lp/git /usr/local/lp/configs/LWConfig

WORKDIR /usr/local/lp/git/doppler-dev

CMD /bin/bash

