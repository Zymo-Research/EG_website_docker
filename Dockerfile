FROM ubuntu:latest
MAINTAINER Hunter Chung <hchung@zymoresearch.com>

# Install Scipy stack

# From https://github.com/ogrisel/docker-openblas
ADD openblas.conf /etc/ld.so.conf.d/openblas.conf

# From https://github.com/ogrisel/docker-sklearn-openblas
ADD numpy-site.cfg /tmp/numpy-site.cfg
ADD scipy-site.cfg /tmp/scipy-site.cfg

ADD build_scipy_stack.sh /tmp/build_scipy_stack.sh
RUN bash /tmp/build_scipy_stack.sh

# Clean up from build
RUN rm -f /tmp/build_scipy_stack.sh /tmp/numpy-site.cfg /tmp/scipy-site.cfg

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
    libfreetype6-dev \
    libpng-dev

# pip install
RUN pip install \
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
