#!/bin/sh
set -e

: "${SERVER_PORT:=8080}"
: "${DASHBOARD_SERVER_ADDR:=localhost}"
: "${PROJECT_NAME:=sentinel-dashboard}"
: "${AUTH_USERNAME:=sentinel}"
: "${AUTH_PASSWORD:=123456}"
: "${SESSION_TIMEOUT:=1800}"
: "${JVM_OPTS:=-Xms256m -Xmx512m}"

exec java \
  -Dserver.port=${SERVER_PORT} \
  -Dcsp.sentinel.dashboard.server=${DASHBOARD_SERVER_ADDR}:${SERVER_PORT} \
  -Dproject.name=${PROJECT_NAME} \
  -Dserver.servlet.session.timeout=${SESSION_TIMEOUT} \
  -Dsentinel.dashboard.auth.username=${AUTH_USERNAME} \
  -Dsentinel.dashboard.auth.password=${AUTH_PASSWORD} \
  ${JVM_OPTS} \
  -jar /sentinel/sentinel-dashboard.jar
