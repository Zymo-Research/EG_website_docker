wget "http://downloads.sourceforge.net/project/primer3/primer3/2.3.6/primer3-src-2.3.6.tar.gz?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fprimer3%2Ffiles%2Fprimer3%2F2.3.6%2F&ts=1389397923&use_mirror=hivelocity" \
    -O /usr/share/primer3.tar.gz
cd /usr/share/
tar zxvf primer3.tar.gz
cd primer3-2.3.6/src
make all
ln -s /usr/share/primer3-2.3.6 /usr/share/primer3

# celery --app=tools.bpd_tasks --loglevel=debug worker
