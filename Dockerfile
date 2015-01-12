FROM ipython/scipystack
MAINTAINER Hunter Chung <hchung@zymoresearch.com>

RUN sed -i.dist 's,universe$,universe multiverse,' /etc/apt/sources.list
RUN apt-get update && apt-get dist-upgrade -y -q \
vim \
wget \
pigz \
# Python related.
python-dev \
python-pip \
ipython \
ipython-notebook \
python-nose \
# AWS related
s3cmd \
ec2-api-tools \
ec2-ami-tools \
# database related
mysql-client \
sqlite3 \
# web server related
apache2 \
libapache2-mod-wsgi \
# Others
libmysqlclient-dev \
libfreetype6-dev \
libpng-dev

# pip install
RUN pip2 install \
MySQL-python \
biopython \
xlwt \
xlrd \
django \
django-taggit \
django-social-auth \
natsort


# Set up apache2
ADD https://s3.amazonaws.com/epiquest/website_templates/000-default.conf /etc/apache2/sites-enabled/


expose 80

# Run apache.
CMD /usr/sbin/apache2ctl -D FOREGROUND
