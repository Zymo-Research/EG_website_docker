FROM hunterchung/eg-website-docker

MAINTAINER Hunter Chung <hchung@zymoresearch.com>

RUN pip install \
    celery

VOLUME /scripts
ENV PYTHONPATH=${PYTHONPATH}:/scripts
ENV PATH=${PATH}:/usr/share/s3cmd

EXPOSE 8000
CMD  python /scripts/manage.py runserver 0.0.0.0:8000
