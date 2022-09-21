FROM ubuntu

RUN apt-get update
RUN apt-get --yes upgrade
# install things required to run script-servver
RUN apt-get install --yes wget unzip python3-pip

# install tools that you want to use with script-server
# modify this line by adding your tools
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get -y install tzdata
RUN apt-get install --yes nmap whatweb net-tools nikto dnsutils knockpy sslscan wkhtmltopdf

RUN apt-get install --yes whois

# install wtfis
RUN pip3 install wtfis


# download the most recent version of script-server
WORKDIR /app
RUN wget https://github.com/bugy/script-server/releases/latest/download/script-server.zip

# install script-server
RUN unzip script-server.zip
RUN pip install -r requirements.txt

HEALTHCHECK  --timeout=3s CMD curl --fail http://localhost:5000 || exit 1  
EXPOSE 5000
CMD [ "python3", "launcher.py" ]
