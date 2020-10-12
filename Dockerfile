# trojan in docker

FROM debian:buster

# netselect is not necessary in the current version, we'll get the fastest server on host
RUN apt-get update && apt-get install -y netselect libboost-system1.67.0 libboost-program-options1.67.0 libboost-locale1.67.0 libboost-thread1.67.0 libboost-filesystem1.67.0 libboost-atomic1.67.0 libboost-chrono1.67.0 libboost-date-time1.67.0 libboost-iostreams1.67.0 libssl1.1 libmariadb3  privoxy 


#ADD client.json /tmp/client.json
ADD entry.sh /entry.sh

RUN chmod +x /entry.sh

EXPOSE 1080/tcp
EXPOSE 1087/tcp

CMD [ "/entry.sh" ]
