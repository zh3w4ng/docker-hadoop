#
# Dockerfile - Apache Hadoop
#
FROM     ubuntu:14.04
MAINTAINER Zhe Wang <zh3w4ng@gmail.com>

# Last Package Update & Install
RUN apt-get update && apt-get install -y curl supervisor openssh-server net-tools iputils-ping

ENV SRC_DIR /opt

# JDK
ENV JDK_URL http://download.oracle.com/otn-pub/java/jdk
ENV JDK_VER 7u80-b15
ENV JDK_VER2 jdk-7u80
ENV JAVA_HOME /usr/local/jdk
ENV PATH $PATH:$JAVA_HOME/bin
RUN cd $SRC_DIR && curl -LO "${JDK_URL}/${JDK_VER}/${JDK_VER2}-linux-x64.tar.gz" -H 'Cookie: oraclelicense=accept-securebackup-cookie' \
 && tar xzf ${JDK_VER2}-linux-x64.tar.gz && mv jdk1* $JAVA_HOME && rm -f $JDK_VER2-linux-x64.tar.gz

ENV HADOOP_VERSION hadoop-2.7.1
ENV HIVE_VERSION apache-hive-1.0.0
ENV TEZ_VERSION tez-0.8.2
ENV TEZ_UI_VERSION tez-ui-0.8.2
ENV TOMCAT_VERSION apache-tomcat-7.0.68

# Tomcat ENV
ENV CATALINA_HOME $SRC_DIR/$TOMCAT_VERSION
ENV CATALINA_BASE $CATALINA_HOME
ENV CATALINA_PID $CATALINA_BASE/tomcat.pid

# Apache Hadoop, Hive, Tez
COPY vendor $SRC_DIR/
RUN cd $SRC_DIR \
 && tar xzf ${HIVE_VERSION}-bin.tar.gz \
 && rm ${HIVE_VERSION}-bin.tar.gz  \
 && tar xzf ${TOMCAT_VERSION}.tar.gz \
 && rm ${TOMCAT_VERSION}.tar.gz \
 && tar xzf ${HADOOP_VERSION}.tar.gz \
 && rm ${HADOOP_VERSION}.tar.gz \
 && tar xzf ${TEZ_VERSION}-minimal.tar.gz \
 && rm ${TEZ_VERSION}-minimal.tar.gz \
 && cp ${TEZ_VERSION}-minimal/${TEZ_UI_VERSION}.war $CATALINA_HOME/webapps

# Hive Env
ENV HIVE_PREFIX $SRC_DIR/$HIVE_VERSION
ENV HIVE_HOME $HIVE_PREFIX
ENV PATH $PATH:$HIVE_PREFIX/bin:$HIVE_PREFIX/sbin

# Tez Env
ENV TEZ_JARS $SRC_DIR/$TEZ_VERSION-minimal

# Hadoop ENV
ENV HADOOP_PREFIX $SRC_DIR/$HADOOP_VERSION
ENV PATH $PATH:$HADOOP_PREFIX/bin:$HADOOP_PREFIX/sbin
ENV HADOOP_MAPRED_HOME $HADOOP_PREFIX
ENV HADOOP_HOME $HADOOP_PREFIX
ENV HADOOP_COMMON_HOME $HADOOP_PREFIX
ENV HADOOP_HDFS_HOME $HADOOP_PREFIX
ENV YARN_HOME $HADOOP_PREFIX
ENV HADOOP_CLASSPATH ${HADOOP_PREFIX}/etc/hadoop:${TEZ_JARS}/*:${TEZ_JARS}/lib/*

# Add in the etc/hadoop directory
ADD conf/hadoop $HADOOP_PREFIX/etc/hadoop/
ADD conf/tez $HADOOP_PREFIX/etc/hadoop/


RUN sed -i '/^export JAVA_HOME/ s:.*:export JAVA_HOME=/usr/local/jdk:' $HADOOP_PREFIX/etc/hadoop/hadoop-env.sh

# SSH keygen
RUN cd /root && ssh-keygen -t dsa -P '' -f "/root/.ssh/id_dsa" \
 && cat /root/.ssh/id_dsa.pub >> /root/.ssh/authorized_keys && chmod 644 /root/.ssh/authorized_keys

# Supervisor
RUN mkdir -p /var/log/supervisor
ADD conf/supervisord/* /etc/supervisor/conf.d/

# SSH
RUN mkdir /var/run/sshd \
 && sed -i 's/without-password/yes/g' /etc/ssh/sshd_config \
 && sed -i 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config \
 && echo 'SSHD: ALL' >> /etc/hosts.allow

# Root password
RUN echo 'root:hadoop' |chpasswd

# Port
# Node Manager: 8042, Resource Manager: 8088, NameNode: 50070, DataNode: 50075, SecondaryNode: 50090, Tez-UI: 8080, Timeline: 8188
EXPOSE 22 8042 8088 50070 50075 50090 8080 8188

# Daemon
CMD ["/usr/bin/supervisord"]
