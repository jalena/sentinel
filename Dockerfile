FROM amd64/buildpack-deps:buster-curl as installer

ARG SENTINEL_VERSION=1.8.9

RUN set -x \
    && curl -SL --output /home/sentinel-dashboard.jar https://github.com/alibaba/Sentinel/releases/download/${SENTINEL_VERSION}/sentinel-dashboard-${SENTINEL_VERSION}.jar

FROM openjdk:8-jre-slim

LABEL com.bcsytv.image.authors="jalena"
LABEL com.bcsytv.image.description="Sentinel Dashboard"

WORKDIR /sentinel

# copy sentinel jar
COPY --from=installer /home/sentinel-dashboard.jar /sentinel/sentinel-dashboard.jar
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 8080

ENTRYPOINT ["/entrypoint.sh"]
