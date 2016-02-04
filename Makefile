.SHELL: /bin/sh

name     = git-lighttp
version  = 0.3.0
specfile = $(name).gemspec
package  = $(name)-$(version).gem

ctags   = '/.*alias(_method)?[[:space:]]+:([[:alnum:]_=!?]+),?[[:space:]]+:([[:alnum:]_=!]+)/\\2/f/'

all:: check

ctags:
	ctags --recurse=yes --tag-relative=yes --totals=yes --extra=+f --fields=+iaS --regex-ruby=$(ctags)

clean:
	rm -rf $(name)-*.gem
	rm -rf *.lock
	rm -rf doc/api

check:
	ruby test/all.rb

docs:
	rdoc --output doc/api --title Git-Lighttp --main README.md --show-hash

build:
	gem $@ $(specfile)

dist: build

push: build
	gem $@ $(package)

release: push

install: build
	gem $@ --local $(package)

uninstall: build
	gem $@ $(package) -v$(version)

