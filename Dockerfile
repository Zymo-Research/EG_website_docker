FROM ubuntu:latest
MAINTAINER Hunter Chung <hchung@zymoresearch.com>
 
RUN sed -i.dist 's,universe$,universe multiverse,' /etc/apt/sources.list
RUN apt-get update -qq
RUN apt-get dist-upgrade -y
 
RUN apt-get install -qqy git vim wget pigz
# Python related
RUN apt-get install -qqy python-dev python-pip
# AWS related
RUN apt-get install -qqy s3cmd ec2-api-tools ec2-ami-tools
# database related
RUN apt-get install -qqy mysql-client sqlite3
# web server related
RUN apt-get install -qqy apache2 libapache2-mod-wsgi
# Others
RUN apt-get install -qqy libfreetype6-dev libpng-dev
# Install Python packages
RUN apt-get install -qqy python-numpy python-scipy python-matplotlib ipython ipython-notebook python-pandas python-sympy python-nose
 
# pip install
RUN pip install biopython xlwt xlrd django django-taggit django-social-auth natsort
 
# Set up apache2
ADD https://s3.amazonaws.com/epiquest/website_templates/000-default /etc/apache2/sites-enabled/
 
 
expose 80
 
# Run apache.
CMD /usr/sbin/apache2ctl -D FOREGROUND
