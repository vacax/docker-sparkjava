# Imagen creada desde openjdk8, ver en
# https://hub.docker.com/_/openjdk/
# ejecute el comando sudo docker pull openjdk:8
FROM vacax/sdkman-java-gradle:latest

#Indicando quien mantiene la imagen
MAINTAINER Carlos Camacho <ca.camacho@ce.pucmm.edu.do>

#actualizando el sistema e instalando gradle
#el comando RUN ejecuta un comando.
#RUN apt-get update
#RUN apt-get install -y zip unzip
#RUN curl -s "https://get.sdkman.io" | bash
#RUN sdk install gradle

#Copiando la nueva estructura dentro de la imagen.
COPY ./src /opt/spark/src
COPY ./gradle /opt/spark/gradle
COPY ./build.gradle /opt/spark/build.gradle
COPY ./gradlew /opt/spark/gradlew

#Cambiando la ruta de trabajo.
WORKDIR /opt/spark

#indicando que voy a publicar el puerto
EXPOSE 4567

ENV JAVA_HOME /root/.sdkman/candidates/java/8u152-zulu/

#cuando se inicialice el contenedor se ejecuta el comando
#para crear la imagen es con el comando
#sudo docker build -t vacax/docker-sparkjava .
#donde vacax/docker-sparkjava es el nombre de la imagen
#para inicializar el contenedor:
#sudo docker run -d -p 4567:4567 vacax/docker-sparkjava
#Cada vez que creemos el contenedor estaremos descargando gradle
ENTRYPOINT ["/root/.sdkman/candidates/gradle/4.3.1/bin/gradle", "run"]

#para subir al repositorio realizo el push
# debo logearme primero
#docker login -u usuario
#sudo docker push vacax/docker-sparkjava