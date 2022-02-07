# setup cloudflared for DNS over HTTPS
sudo docker exec -it pihole wget -q https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-stable-linux-amd64.deb -O /home/cloudflared.deb
sudo docker exec -it pihole dpkg -i /home/cloudflared.deb
sudo docker exec -it pihole touch /home/startCloudflared.sh
sudo docker exec -it pihole chmod +x /home/startCloudflared.sh
sudo docker exec -it pihole sh -c 'echo "nohup cloudflared proxy-dns --port 5335 &" > /home/startCloudflared.sh'
# 127.0.0.1#5335

#sudo docker exec -it pihole bash #/home/startCloudflared.sh

echo "finished cloudflared install"
