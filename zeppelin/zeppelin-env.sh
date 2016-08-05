#!/bin/bash

# Copyright 2015 The Kubernetes Authors All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

export ZEPPELIN_CONF_DIR="/tmp/zeppelin/conf"
export ZEPPELIN_LOG_DIR="/tmp/zeppelin/log"        		# Where log files are stored.  PWD by default.
export ZEPPELIN_PID_DIR="/tmp/zeppelin/run"        		# The pid files are stored. ${ZEPPELIN_HOME}/run by default.
export ZEPPELIN_WAR_TEMPDIR="/tmp/zeppelin/webapps"    		# The location of jetty temporary directory.
export ZEPPELIN_NOTEBOOK_DIR="/tmp/zeppelin/notebook"   		# Where notebook saved

export ZEPPELIN_MEM=-Xmx1024m
export MASTER="spark://spark-master:7077"
export ZEPPELIN_PORT=8080
export ZEPPELIN_JAVA_OPTS="-Dspark.jars=/opt/zeppelin/lib/gcs-connector-latest-hadoop2.jar"

# see zeppelin spark integration - https://zeppelin.apache.org/docs/0.6.0/interpreter/spark.html
export SPARK_HOME=/opt/spark
export PYTHONPATH="${SPARK_HOME}/python:${SPARK_HOME}/python/lib/py4j-0.10.1-src.zip"
export SPARK_USER=nobody
