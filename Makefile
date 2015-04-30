

PWD = $(shell pwd)

PERL_IMAGE          ?= liquidweb/base-perl
PERL_VERSION        ?= latest

all: default

default:
	${MAKE} pull
	${MAKE} build

pull:
	@if [ ! -e out/perl-pull.x ]; then \
		docker pull perl:5.20; \
		touch out/perl-pull.x; \
	fi

delete:
	docker rmi ${PERL_IMAGE}:${PERL_VERSION}

out/perl-build.x: Dockerfile
	docker build --tag="${PERL_IMAGE}" .
	touch out/perl-build.x

build: out/perl-build.x

clean:
	@rm -f out/perl-*.x; \


