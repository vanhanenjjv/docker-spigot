# Spigot for Docker

## Building 

The available build arguments and their defaults:

| Build Argument    | Default                                                                                            |
|:------------------|:---------------------------------------------------------------------------------------------------| 
| BUILD_TOOLS_SRC   | https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar |
| MINECRAFT_VERSION | latest                                                                                             |
| JAVA_XMX          | 1G                                                                                                 |


## Running

The available environment variables and their defaults:

| Environment Variable | Default |
|:--------------------|:---------|
| JAVA_XMS            | 256M     |
| JAVA_XMX            | 1G       |
| EULA                | false    |


The available volumes and their descriptions:

| Volume     | Description                                                        |
|:-----------|:-------------------------------------------------------------------|
| /minecraft | The root folder where the Minecraft server initializes itself into |


Running the image:
    
    docker run -it -p 25565:25565 -e EULA=true {spigot-image-name-goes-here}

To exit the container without killing the Minecraft server press _CTRL + P, CTRL + Q_ to deattach from the container.
