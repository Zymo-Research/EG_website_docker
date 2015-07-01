FROM celery

MAINTAINER Hunter Chung <hchung@zymoresearch.com>

USER root

RUN apt-get update && \
apt-get install -yq \
    build-essential \
    libxml2-dev \
    libxslt-dev && \
rm -rf /var/lib/apt/lists/* && \
apt-get clean autoclean && \
apt-get autoremove -y

RUN pip install \
    django \
    biopython \
    xlwt \
    six \
    distribute \
    pysam==0.7.8 \
    inlinestyler \
    lxml \
    beautifulsoup4 \
    requests
RUN install_primer3.sh

VOLUME /scripts
ENV PYTHONPATH=${PYTHONPATH}:/scripts
ENV PATH=${PATH}:/usr/share/s3cmd:/usr/share/primer3/src
ENV DJANGO_SETTINGS_MODULE=Bisulfite_Primer_Seeker.settings


CMD ["celery", "worker"]
