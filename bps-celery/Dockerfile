FROM hunterchung/eg-website-docker
MAINTAINER Hunter Chung <hchung@zymoresearch.com>

ADD install_primer3.sh /tmp/install_primer3.sh
RUN chmod +x /tmp/install_primer3.sh
RUN /tmp/install_primer3.sh

ENV C_FORCE_ROOT=true
ENV PATH=${PATH}:/usr/share/s3cmd:/usr/share/primer3/src
ENV DJANGO_SETTINGS_MODULE=Bisulfite_Primer_Seeker.settings
ENV PYTHONPATH=${PYTHONPATH}:/scripts

CMD celery --app=tools.bpd_tasks -b amqp://epidata.zymoresearch.com:5672 worker
