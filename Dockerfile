FROM amazonlinux:latest
RUN yum update -y
RUN yum install -y httpd httpd-tools httpd-devel mod24_wsgi
RUN yum install -y python3 python3-devel python3-pip
RUN yum groupinstall "Development tools" -y
COPY ./app /app
COPY ./app/django.conf /etc/httpd/conf.d/
COPY ./run.sh /tmp
RUN yum install -y wget
RUN  python3 -m venv /app/venv
RUN /app/venv/bin/pip install -r /app/requirements.txt 
RUN yum install -y https://kojipkgs.fedoraproject.org//packages/sqlite/3.8.11/1.fc21/x86_64/sqlite-3.8.11-1.fc21.x86_64.rpm
RUN sh /tmp/run.sh
CMD ["-D", "FOREGROUND"]
ENTRYPOINT ["/usr/sbin/httpd"]
