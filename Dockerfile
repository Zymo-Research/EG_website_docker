FROM debian:wheezy
# FROM python:2-wheezy
MAINTAINER Hunter Chung <hchung@zymoresearch.com>

RUN sed -i.dist 's,universe$,universe multiverse,' /etc/apt/sources.list
RUN apt-get update && \
# apt-get dist-upgrade -y -q && \
apt-get install -yq \
    vim \
    wget \
    pigz \
    gcc \
    # Python related.
    python-dev \
    python-pip \
    # database related
    mysql-client \
    libmysqlclient-dev \
    sqlite3 \
    ca-certificates \
    --no-install-recommends && \
rm -rf /var/lib/apt/lists/* && \
apt-get clean autoclean && \
apt-get autoremove -y

# Install s3cmd.
RUN wget http://github.com/s3tools/s3cmd/releases/download/v1.5.2/s3cmd-1.5.2.tar.gz && \
tar zxvf s3cmd-1.5.2.tar.gz && \
mv s3cmd-1.5.2 /usr/share/ && \
ln -s /usr/share/s3cmd-1.5.2 /usr/share/s3cmd

# pip install
RUN pip install \
    python-dateutil \
    setuptools \
    mysqlclient \
    django \
    django-taggit \
    django-social-auth \
    natsort \
    python-memcached \
    boto \
    numpy

VOLUME /usr/share/EpiQuest_py
ENV PYTHONPATH=${PYTHONPATH}:/usr/share/EpiQuest_py
ENV PATH=${PATH}:/usr/share/s3cmd

# # Set up apache2
# ADD https://s3.amazonaws.com/epiquest/website_templates/000-default.conf /etc/apache2/sites-enabled/
#
# expose 80

# # Run apache.
# CMD /usr/sbin/apache2ctl -D FOREGROUND

EXPOSE 8000
CMD  python /usr/share/EpiQuest_py/manage.py runserver 0.0.0.0:8000
