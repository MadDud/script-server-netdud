FROM ubuntu:20.04

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get --yes install keyboard-configuration
#RUN apt-get --yes upgrade
# install things required to run script-servver
RUN apt-get install --yes wget unzip python3-pip

# install tools that you want to use with script-server
# modify this line by adding your tools
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get -y install tzdata
RUN apt-get install --yes nmap 
RUN apt-get install --yes whatweb
RUN apt-get install --yes net-tools
RUN apt-get install --yes nikto
RUN apt-get install --yes dnsutils
RUN apt-get install --yes knockpy
RUN apt-get install --yes wkhtmltopdf
RUN apt-get install --yes tesseract-ocr
RUN apt-get install --yes whois

# install sslyze
RUN pip3 install sslyze

# install wtfis
#RUN pip3 install wtfis


# download the most recent version of script-server
WORKDIR /app
RUN wget https://github.com/bugy/script-server/releases/latest/download/script-server.zip

# install script-server
RUN unzip script-server.zip
RUN pip install -r requirements.txt

#HEALTHCHECK  --timeout=3s CMD curl --fail http://localhost:5000 || exit 1

HEALTHCHECK --interval=5m --timeout=3s CMD wget --no-verbose --tries=1 --spider http://localhost:5000/ || exit 1

EXPOSE 5000
CMD [ "python3", "launcher.py" ]
