#! /bin/sh


docker build -t my_trojan .
sudo docker run -it --rm -v /home/yuwen/trojan:/trojan -p 2080:1080 -p 2087:1087 my_trojan
