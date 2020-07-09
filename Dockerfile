FROM postgres:12.2-alpine

RUN apk update && apk upgrade && \
	apk add --no-cache bash git openssh make perl-utils

# Install pg_prove.
RUN cpan TAP::Parser::SourceHandler::pgTAP

# Install pg_tap.
RUN git clone https://github.com/theory/pgtap \
	&& cd pgtap \
	&& make && make install
