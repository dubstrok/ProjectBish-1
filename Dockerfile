# We're using Alpine Edge
FROM python:3.8.2-buster
#
# Installing Packages
#
RUN apt update && apt upgrade -y
RUN apt install -y \
coreutils \
bash \
build-essential \
bzip2 \
libbz2-dev \
curl \
figlet \
gcc \
g++ \
git \
sudo \
aria2 \
util-linux \
dlang-libevent \
libffi-dev \
libpq-dev \
libwebp-dev \
libxml2 \
libxml2-dev \
libxslt1-dev \
linux-headers-amd64 \
musl \
neofetch \
libssl-dev \
postgresql \
openssl \
pv \
jq \
libreadline-dev \
sqlite3 \
libsqlite3-0 \
ffmpeg \
chromium \
chromium-driver \
zlib1g \
zlib1g-dev \
libjpeg-turbo-progs \
libjpeg62-turbo \
libjpeg62-turbo-dev \
libjpeg-dev \
zip \
freetype2-demos
#
# Clone repo and prepare working directory
#
RUN git clone -b master https://github.com/adekmaulana/ProjectBish /home/projectbish/
RUN mkdir /home/projectbish/bin/
WORKDIR /home/projectbish/
#
# Install requirements
#
RUN pip install -r requirements.txt
#Init system
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
CMD ["python","-m","userbot"]
