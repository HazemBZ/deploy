FROM debian:jessie
ARG ENVIRONMENT
# defaults environment to dev
env ENVIRONMENT=dev

# copy deploy folder contents intro container /data folder
WORKDIR /data
COPY . .


# Update package and install required packages
RUN apt update
RUN apt install ansible wget curl -y

# Install jdk8 required by tomcat9 manually (debian:jessi package mirrors very old)
WORKDIR /opt
RUN wget -O openjdk-8.tar.gz https://download.java.net/openjdk/jdk8u41/ri/openjdk-8u41-b04-linux-x64-14_jan_2020.tar.gz; tar xf openjdk-8.tar.gz


WORKDIR /data

EXPOSE 8080

CMD ["/bin/sh"]
