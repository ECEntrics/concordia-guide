FROM alpine:3.10 as base
LABEL maintainers.1="Fanakis Apostolos <apotwohd@gmail.com>"
LABEL maintainers.2="Panagiotis Nikolaidis <ezerous@gmail.com>"

RUN apk add --update --no-cache openrc lighttpd \
	&& rm -rf /var/cache/apk/*
RUN rc-update add lighttpd default

FROM base as final

COPY lighttpd.conf /etc/lighttpd/lighttpd.conf
EXPOSE 8010

STOPSIGNAL SIGTERM

CMD ["lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]
