FROM ubuntu:18.04
RUN apt-get update; 
RUN apt-get install curl -y; 
CMD echo "Input website:"; read website; echo "Searching.."; sleep 1; curl http://$website;
