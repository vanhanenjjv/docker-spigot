#!/bin/sh

echo "eula=${EULA}" > eula.txt

java -Xms${JAVA_XMS} -Xmx${JAVA_XMX} -XX:+UseConcMarkSweepGC -jar /usr/local/bin/spigot nogui
