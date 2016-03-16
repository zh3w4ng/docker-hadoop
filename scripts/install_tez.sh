#!/bin/bash
set -e

cd /opt/apache-tez-0.8.2-src/tez-ui \
 && mvn clean package -DskipTests=true -Dmaven.javadoc.skip=true # you may need to add '<argument>--allow-root</argument>' to tez-ui/pom.xml