FROM alpine:3.10 as base
LABEL maintainer="Fanakis Apostolos <apotwohd@gmail.com>"

RUN apk add --update --no-cache openrc lighttpd \
	&& rm -rf /var/cache/apk/*
RUN rc-update add lighttpd default

FROM base as final

COPY lighttpd.conf /etc/lighttpd/lighttpd.conf
EXPOSE 8000

STOPSIGNAL SIGTERM

CMD ["lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]
