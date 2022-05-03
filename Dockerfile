FROM openjdk:17-alpine

RUN apk add --no-cache git
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]