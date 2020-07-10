FROM openjdk:8 AS build

ARG BUILD_TOOLS_SRC=https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
ARG MINECRAFT_VERSION=latest
ARG JAVA_XMX=1G
 
WORKDIR /src

RUN curl -o BuildTools.jar ${BUILD_TOOLS_SRC}    
RUN java -Xmx${JAVA_XMX} -jar BuildTools.jar --rev ${MINECRAFT_VERSION}


FROM openjdk:8

ENV JAVA_XMS=256M \
    JAVA_XMX=1G \
    EULA=false

VOLUME /minecraft
WORKDIR /minecraft

COPY --from=build /src/spigot-*.jar /usr/local/bin/spigot
RUN chmod 755 /usr/local/bin/spigot

COPY docker-entrypoint.sh /usr/local/bin/entrypoint
RUN chmod 755 /usr/local/bin/entrypoint

ENTRYPOINT exec /usr/local/bin/entrypoint
