PREFIX = /usr/local

bom:
	cat bom/bom.sh > $@
	echo 'exit 0' >> $@
	echo '#EOF' >> $@
	tar cz bom/bom.awk bom/bom.tsv >> $@
	chmod +x $@
kjv: kjv.sh kjv.awk kjv.tsv
	cat kjv.sh > $@
	echo 'exit 0' >> $@
	echo '#EOF' >> $@
	tar cz kjv.awk kjv.tsv >> $@
	chmod +x $@
dnc: dnc.sh dnc.awk dnc.tsv
	cat dnc.sh > $@
	echo 'exit 0' >> $@
	echo '#EOF' >> $@
	tar cz dnc.awk dnc.tsv >> $@
	chmod +x $@
pgp: pgp.sh pgp.awk pgp.tsv
	cat pgp.sh > $@
	echo 'exit 0' >> $@
	echo '#EOF' >> $@
	tar cz pgp.awk pgp.tsv >> $@
	chmod +x $@

test: bom.sh
	shellcheck -s sh bom.sh

clean:
	rm -f bom

install: bom dnc pgp kjv
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f bom $(DESTDIR)$(PREFIX)/bin
	chmod 755 $(DESTDIR)$(PREFIX)/bin/bom

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/bom

.PHONY: test clean install uninstall
