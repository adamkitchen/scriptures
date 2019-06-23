PREFIX = /usr/local

dnc: dnc.sh dnc.awk dnc.tsv
	cat dnc.sh > $@
	echo 'exit 0' >> $@
	echo '#EOF' >> $@
	tar cz dnc.awk dnc.tsv >> $@
	chmod +x $@

test: dnc.sh
	shellcheck -s sh dnc.sh

clean:
	rm -f dnc

install: dnc
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f dnc $(DESTDIR)$(PREFIX)/bin
	chmod 755 $(DESTDIR)$(PREFIX)/bin/dnc

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/dnc

.PHONY: test clean install uninstall
