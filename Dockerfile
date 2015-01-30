FROM debian:wheezy
ENV DEBIAN_FRONTEND noninteractive
MAINTAINER  Barry Flanagan <barry@flantel.com>
RUN apt-get update && apt-get -y dist-upgrade && \
	apt-get -y install automysqlbackup && \
	apt-get -y install ssmtp && \
	apt-get -y purge exim4*
	apt-get -y clean
ADD run.sh /run.sh
ADD automysqlbackup.default /etc/default/automysqlbackup
CMD ["/run.sh"]



