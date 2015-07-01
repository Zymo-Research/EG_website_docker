FROM hunterchung/eg-website-docker

MAINTAINER Hunter Chung <hchung@zymoresearch.com>

RUN apt-get update && \
apt-get install -yq \
    build-essential \
    rabbitmq-server \
    libxml2-dev \
    libxslt-dev && \
rm -rf /var/lib/apt/lists/* && \
apt-get clean autoclean && \
apt-get autoremove -y

RUN pip install \
    celery \
    biopython \
    xlwt \
    six \
    distribute \
    pysam==0.7.8 \
    inlinestyler \
    lxml \
    beautifulsoup4 \
    requests

# RUN optional_installs.sh
ADD install_primer3.sh /tmp/install_primer3.sh
RUN /tmp/install_primer3.sh

VOLUME /scripts
ENV PYTHONPATH=${PYTHONPATH}:/scripts
ENV PATH=${PATH}:/usr/share/s3cmd:/usr/share/primer3/src
ENV DJANGO_SETTINGS_MODULE=Bisulfite_Primer_Seeker.settings
ENV C_FORCE_ROOT=true

EXPOSE 8000
CMD  python /scripts/manage.py runserver 0.0.0.0:8000
