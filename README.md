# script-server netdud edition

script-server (https://github.com/bugy/script-server) is an excelent tool, which allows you to easily execute command line scripts from web interface.

The purpose of this version is to enable user to install additional tools, so that they can be executed via script-server. 

## Installation

This is a docker image, which needs to be modified by adding desired software to the following line of `Dockerfile`:

```bash
# install tools that you want to use with script-server
# modify this line by adding your tools

RUN apt-get install --yes nmap whatweb net-tools nikto
```



Build your docker image:

```
$ docker build -t test/script-server-netdud:latest .
```
### Deploy docker container

Create required folders and a config file:

```
mkdir config
mkdir scripts
mkdir runners

touch config/conf.json
```
Create container:

```
docker run -d -p 5000:5000 \
           -v /host/path/to/config/conf.json:/app/conf/conf.json \
           -v /host/path/to/runners/:/app/conf/runners \
           -v /host/path/to/scripts/:/app/scripts/ \
           --name script-server \
           test/script-server-netdud:latest
```

## Credit

This script is built based on https://github.com/bugy/script-server,

## License
[MIT](https://choosealicense.com/licenses/mit/)
