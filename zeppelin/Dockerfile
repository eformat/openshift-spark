FROM centos:latest

MAINTAINER Mike Hepburn <eformat@gmail.com>

RUN yum install -y epel-release
RUN yum install -y gcc gcc-c++ tar java python python-setuptools python-devel numpy python-pip scipy fontconfig nss_wrapper && yum clean all
RUN pip install pandas py4j

ENV ZEPPELIN_VER 0.6.0

RUN cd /opt && \
    curl https://dist.apache.org/repos/dist/release/zeppelin/zeppelin-${ZEPPELIN_VER}/zeppelin-${ZEPPELIN_VER}-bin-all.tgz | \
        tar -zx && \
    ln -s  zeppelin-${ZEPPELIN_VER}-bin-all zeppelin

#RUN cd /opt && \
#    curl https://dist.apache.org/repos/dist/release/spark/spark-2.0.0/spark-2.0.0-bin-hadoop2.7.tgz | \
#        tar -zx && \
#    ln -s spark-2.0.0-bin-hadoop2.7 spark

RUN cd /opt && \
    curl https://dist.apache.org/repos/dist/release/spark/spark-1.6.2/spark-1.6.2-bin-hadoop2.6.tgz | \
        tar -zx && \
    ln -s spark-1.6.2-bin-hadoop2.6 spark

ADD zeppelin-log4j.properties /opt/zeppelin/conf/log4j.properties
ADD zeppelin-env.sh /opt/zeppelin/conf/zeppelin-env.sh
ADD docker-zeppelin.sh /opt/zeppelin/bin/docker-zeppelin.sh
ADD gcs-connector-latest-hadoop2.jar /opt/zeppelin/lib/gcs-connector-latest-hadoop2.jar

RUN mkdir -p /tmp/zeppelin/log -p /tmp/zeppelin/run -p /tmp/zeppelin/webapps -p /tmp/zeppelin/notebook -p /tmp/zeppelin/conf

RUN cp -R /opt/zeppelin/notebook /tmp/zeppelin && cp -R /opt/zeppelin/conf /tmp/zeppelin
RUN chmod -R 777 /tmp/zeppelin
	
EXPOSE 8080

ENV ZEPPELIN_HOME /opt/zeppelin

WORKDIR "/opt/zeppelin/bin/"

ENTRYPOINT ["./docker-zeppelin.sh"]
