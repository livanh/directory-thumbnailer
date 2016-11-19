PREFIX=/usr/local

PACKAGE_NAME=directory-thumbnailer
PACKAGE_VERSION=0.1

install:
	install -m 755 src/bin/directory-thumbnailer $(PREFIX)/bin
	install -m 644 src/share/thumbnailers/directory-thumbnailer.thumbnailer $(PREFIX)/share/thumbnailers

deb:
	mkdir -p $(PACKAGE_NAME)_$(PACKAGE_VERSION)/DEBIAN
	cp debian/control $(PACKAGE_NAME)_$(PACKAGE_VERSION)/DEBIAN
	touch $(PACKAGE_NAME)_$(PACKAGE_VERSION)/DEBIAN/conffiles
	mkdir -p $(PACKAGE_NAME)_$(PACKAGE_VERSION)/usr
	cp -r src/* $(PACKAGE_NAME)_$(PACKAGE_VERSION)/usr
	fakeroot dpkg-deb --build $(PACKAGE_NAME)_$(PACKAGE_VERSION)
	rm -r $(PACKAGE_NAME)_$(PACKAGE_VERSION)

.PHONY: install
