# Copying and distribution of this file, with or without modification,
# are permitted in any medium without royalty provided the copyright
# notice and this notice are preserved.  This file is offered as-is,
# without any warranty.

PREFIX = /usr
DATA = /share
PKGNAME = initram-erasure
LICENSES = $(PREFIX)$(DATA)


.PHONY: all
all: doc

.PHONY: doc
doc: info

.PHONY: info
info: initram-erasure.info.gz

%.info.gz: info/%.texinfo
	makeinfo "$<"
	gzip -9 -f "$*.info"

# TODO the hook is not installed

.PHONY: install
install: initram-erasure initram-erasure.info.gz
	install -dm755 "$(DESTDIR)$(LICENSES)/$(PKGNAME)"
	install -m644 COPYING LICENSE "$(DESTDIR)$(LICENSES)/$(PKGNAME)"
	install -dm755 "$(DESTDIR)$(PREFIX)$(DATA)/info"
	install -m644 initram-erasure.info.gz "$(DESTDIR)$(PREFIX)$(DATA)/info/$(PKGNAME).info.gz"

.PHONY: uninstall
uninstall:
	rm -- "$(DESTDIR)$(LICENSES)/$(PKGNAME)/COPYING"
	rm -- "$(DESTDIR)$(LICENSES)/$(PKGNAME)/LICENSE"
	rmdir -- "$(DESTDIR)$(LICENSES)/$(PKGNAME)"
	rm -- "$(DESTDIR)$(PREFIX)$(DATA)/info/$(PKGNAME).info.gz"

.PHONY: clean
clean:
	-rm initram-erasure.info.gz

