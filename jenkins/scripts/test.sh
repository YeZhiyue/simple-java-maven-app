#!/usr/bin/env bash

echo 'The following Maven command installs your Maven-built Java application'

NAME='h'${JAVA_HOME}'h'

echo $NAME

set -x

echo x

VERSION='m'${MAVEN_HOME}'m'

echo $VERSION

APP=''${NAME}'-'${VERSION}'.jar'

echo $APP

mv $APP h1

DIR=pwd

echo $DIR

echo 'success'