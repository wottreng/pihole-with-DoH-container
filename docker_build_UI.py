#!/usr/bin/python3
import os

# guided docker user interface
print('[1] build image')
print('[2] list images')
print('[3] list containers')
print('[4] run image as container')
print('[5] remove all stopped containers and images')
print('[6] open bash terminal in container')
print('[7] * run DoH Pihole container *')
print('[8] stop dohpihole container')
print('[9] list docker processes')
print('[10] remove all stopped containers')

a = input('user selection ')

if a == '1':
    # dockerfile needs to be in current directory
    os.system('sudo docker build -t piholedohv2:1 .')
elif a == '2':
    os.system('sudo docker image ls')
elif a == '3':
    os.system('sudo docker container ls')
elif a == '4':
    os.system('sudo docker run --name dohpihole piholedohv2:1') 
    # -d  to detach container from console
elif a == '5':
    os.system('sudo docker system prune -a')
    # sudo docker container prune
    # sudo docker image prune
elif a == '6':
    os.system('sudo docker exec -it dohpihole bash')
elif a == '7':
    os.system('./DoHpiholeV2')
    # -p hostPort:containerPort
elif a == '8':
    os.system('sudo docker stop dohpihole')
elif a == '9':
    os.system('sudo docker ps')
elif a =='10':
    os.system('sudo docker container prune')


# sudo docker rmi *******  

