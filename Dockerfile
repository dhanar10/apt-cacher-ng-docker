FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \  
	&& apt-get install --no-install-recommends -y \
        apt-cacher-ng \
	&& rm -rf /var/lib/apt/lists/*
	
RUN sed 's/# PassThroughPattern:.*this would allow.*/PassThroughPattern: .* #/' -i /etc/apt-cacher-ng/acng.conf
	
VOLUME /var/cache/apt-cacher-ng

EXPOSE 3142

CMD chmod 777 /var/cache/apt-cacher-ng \
	&& /etc/init.d/apt-cacher-ng start \
	&& tail -f /var/log/apt-cacher-ng/*
