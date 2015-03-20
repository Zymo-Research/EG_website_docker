FROM debian:wheezy
MAINTAINER Hunter Chung <hchung@zymoresearch.com>

RUN sed -i.dist 's,universe$,universe multiverse,' /etc/apt/sources.list
RUN apt-get update && apt-get dist-upgrade -y -q \
    vim \
    wget \
    pigz \
    # Python related.
    python-dev \
    python-pip \
    # database related
    mysql-client \
    sqlite3 \
    # web server related
    apache2 \
    libapache2-mod-wsgi \
    libevent-dev \
    # Others
    libmysqlclient-dev \
    libfreetype6-dev \
    libpng-dev && \
apt-get clean autoclean && \
apt-get autoremove -y

# Install s3cmd.
RUN wget https://github.com/s3tools/s3cmd/releases/download/v1.5.2/s3cmd-1.5.2.tar.gz && \
tar zxvf s3cmd-1.5.2.tar.gz && \
mv s3cmd-1.5.2 /usr/share/ && \
ln -s s3cmd-1.5.2 s3cmd

# pip install
RUN pip install \
MySQL-python \
# biopython \
xlwt \
xlrd \
django \
django-taggit \
django-social-auth \
natsort \
python-memcached \
boto \
numpy

ENV PYTHONPATH=${PYTHONPATH}:/var/www/EpiQuest_py

# Set up apache2
ADD https://s3.amazonaws.com/epiquest/website_templates/000-default.conf /etc/apache2/sites-enabled/

expose 80

# Run apache.
CMD /usr/sbin/apache2ctl -D FOREGROUND
