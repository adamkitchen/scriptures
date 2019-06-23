PREFIX = /usr/local

pgp: pgp.sh pgp.awk pgp.tsv
	cat pgp.sh > $@
	echo 'exit 0' >> $@
	echo '#EOF' >> $@
	tar cz pgp.awk pgp.tsv >> $@
	chmod +x $@

test: pgp.sh
	shellcheck -s sh pgp.sh

clean:
	rm -f pgp

install: pgp
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f pgp $(DESTDIR)$(PREFIX)/bin
	chmod 755 $(DESTDIR)$(PREFIX)/bin/pgp

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/pgp

.PHONY: test clean install uninstall
