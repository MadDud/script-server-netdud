# script-server netdud edition

script-server (https://github.com/bugy/script-server) is an excelent tool, which allows you to easily execute command line scripts from web interface.

The purpose of this version is to enable user to install additional tools, so that they can be executed via script-server. 

## Tools

* nmap
* dig
* whatweb
* sslscan
* Knockpy
* whois

## Installation

Download repository
```
$ git clone https://github.com/MadDud/script-server-netdud.git
$ cd script-server-netdud
```

Build your docker image:

```
$ docker build -t test/script-server-netdud:latest .
```
Details about the config can be found at https://github.com/bugy/script-server/wiki/Server-configuration

Create and start the container:
Replace ` /host/path/to` with your path to this folder.

```
docker run -d -p 5000:5000 \
           -v /host/path/to/config/conf.json:/app/conf/conf.json \
           -v /host/path/to/runners/:/app/conf/runners \
           -v /host/path/to/scripts/:/app/scripts/ \
           -v /host/path/to/conf/theme/:/app/conf/theme/ \
           --name script-server \
           test/script-server-netdud:latest
```

The application is available at http://127.0.0.1:5000

The admin interface is available at http://127.0.0.1:5000/admin.html

## Adding custom software

You can add your custom software to the container by modifying the following line of `Dockerfile`:

```bash
# install tools that you want to use with script-server
# modify this line by adding your tools

RUN apt-get install --yes nmap whatweb net-tools nikto
```

Then just build the docker image again.

## Credit

This script is built based on https://github.com/bugy/script-server,

## License
[MIT](https://choosealicense.com/licenses/mit/)
