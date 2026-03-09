#!/bin/sh

set -e

BASEDIR=$(cd "$(dirname "$0")" && pwd -P)
WRAPPER_JAR="$BASEDIR/.mvn/wrapper/maven-wrapper.jar"
WRAPPER_PROPERTIES="$BASEDIR/.mvn/wrapper/maven-wrapper.properties"

if [ ! -f "$WRAPPER_PROPERTIES" ]; then
  echo "Missing $WRAPPER_PROPERTIES" 1>&2
  exit 1
fi

if [ ! -f "$WRAPPER_JAR" ]; then
  WRAPPER_URL=$(grep -E '^wrapperUrl=' "$WRAPPER_PROPERTIES" | cut -d'=' -f2-)
  if [ -z "$WRAPPER_URL" ]; then
    echo "Missing wrapperUrl in $WRAPPER_PROPERTIES" 1>&2
    exit 1
  fi

  mkdir -p "$BASEDIR/.mvn/wrapper"

  if command -v curl >/dev/null 2>&1; then
    curl -fsSL "$WRAPPER_URL" -o "$WRAPPER_JAR"
  elif command -v wget >/dev/null 2>&1; then
    wget -q "$WRAPPER_URL" -O "$WRAPPER_JAR"
  else
    echo "Neither curl nor wget is available to download Maven Wrapper" 1>&2
    exit 1
  fi
fi

exec java -classpath "$WRAPPER_JAR" -Dmaven.multiModuleProjectDirectory="$BASEDIR" org.apache.maven.wrapper.MavenWrapperMain "$@"
