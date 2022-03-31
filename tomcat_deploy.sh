## 1. Build docker image
docker build --no-cache -t tomcat_env:v0 .

## 2. Launch container
docker run --rm -dit --privileged=true -p8080:8080 --name tomcat_container  tomcat_env:v0  

## 3. Execute tomcat_test.sh default to dev
docker exec -it --privileged=true tomcat_container bash /data/tomcat_test.sh dev