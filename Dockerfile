FROM ubuntu

RUN apt-get update
# install things required to run script-servver
RUN apt-get install --yes wget unzip python3-pip

# install tools that you want to use with script-server
# modify this line by adding your tools

RUN apt-get install --yes nmap whatweb net-tools nikto


# download the most recent version of script-server
WORKDIR /app
RUN wget https://github.com/bugy/script-server/releases/download/1.16.0/script-server.zip

# install script-server
RUN unzip script-server.zip
RUN pip install -r requirements.txt

EXPOSE 5000
CMD [ "python3", "launcher.py" ]
