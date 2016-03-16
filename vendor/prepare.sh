#!/bin/bash
set -e

# Hadoop
curl -LO http://www.eu.apache.org/dist/hadoop/common/hadoop-2.7.1/hadoop-2.7.1.tar.gz

# Hive
curl -LO http://archive.apache.org/dist/hive/hive-1.0.0/apache-hive-1.0.0-bin.tar.gz

# Tomcat
curl -LO http://mirror.nus.edu.sg/apache/tomcat/tomcat-7/v7.0.68/bin/apache-tomcat-7.0.68.tar.gz