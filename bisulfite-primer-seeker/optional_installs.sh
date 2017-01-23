curl http://hgdownload.cse.ucsc.edu/goldenPath/hg19/bigZips/hg19.2bit > ~/opt/hg19.2bit
curl http://hgdownload.cse.ucsc.edu/admin/exe/linux.x86_64/twoBitToFa > ~/opt/twoBitToFa
chmod +x ~/opt/twoBitToFa ~/opt/twoBitToFa ~/opt/hg19.2bit ~/opt/hg19.fa

wget -O ~/opt/geolite.gz http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz
gunzip ~/opt/geolite.gz

ln -s /lib/x86_64-linux-gnu/libssl.so.1.0.0 /usr/lib/libssl.so.10
ln -s /lib/x86_64-linux-gnu/libcrypto.so.1.0.0 /usr/lib/libcrypto.so.10
