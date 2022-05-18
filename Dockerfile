# build pihole with DNS over HTTPS container. requires -v ./etc/dnsmasq.d and ./etc-pihole
FROM pihole/pihole:latest

RUN \
 apt-get update && \
 apt-get -y upgrade && \
 apt-get install -y wget && \
 apt-get install -y apt-utils && \
 apt-get install -y net-tools && \
 wget https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb && \
 apt-get install ./cloudflared-linux-amd64.deb

# COPY source dest

# EXPOSE port

ENV HOME /root

WORKDIR /root

#CMD ["echo","hello and done"]
CMD cloudflared proxy-dns --port 5335
