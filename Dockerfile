# build pihole with DNS over HTTPS container. requires -v ./etc/dnsmasq.d and ./etc-pihole
FROM pihole/pihole:latest

RUN \
 apt-get update && \
 apt-get -y upgrade && \
 apt-get install net-tools && \
 wget https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-stable-linux-amd64.deb && \
 apt-get install ./cloudflared-stable-linux-amd64.deb

# COPY source dest

# EXPOSE port

ENV HOME /root

WORKDIR /root

#CMD ["echo","hello and done"]
CMD cloudflared proxy-dns --port 5335
