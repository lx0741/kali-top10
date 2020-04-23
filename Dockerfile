FROM kalilinux/kali-rolling

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update && apt-get -y dist-upgrade && apt-get -y autoremove && apt-get clean
RUN apt-get -y install kali-tools-top10 exploitdb man-db dirb nikto wpscan uniscan python3-pip nano
RUN service postgresql start && msfdb init && service postgresql stop

VOLUME /root /var/lib/postgresql

# Reverse Shell 
EXPOSE 4444 

WORKDIR /root
CMD ["/bin/bash"]
