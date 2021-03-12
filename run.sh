#!/bin/bash
wget https://github.com/GrahamDumpleton/mod_wsgi/archive/4.7.1.tar.gz
tar -xzf 4.7.1.tar.gz
cd mod_wsgi-4.7.1
./configure --with-apxs=/usr/bin/apxs --with-python=/usr/bin/python3
make
make install
chmod 755 /usr/lib64/httpd/modules/mod_wsgi.so
python3 -m venv /app/venv
