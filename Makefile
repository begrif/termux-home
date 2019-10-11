PROGS = bgupload cal3 lk minute mkjpg mkpng mkppm \
	mkthnail nums pbget pbset pfactor pizza \
	pnminfo termux-file-editor termux-url-opener \
	diptych tvoc-parse

TASKER = tvoc-parse
TASKERDIR = $(HOME)/.termux/tasker
DESTDIR = $(HOME)/bin

SUBFILE = basic-tools.subs
SUBTOOL = perl MKSUBS -c $(SUBFILE)

install: $(SUBFILE) installtasker
	for p in $(PROGS); do $(SUBTOOL) < $$p > $(DESTDIR)/$$p && chmod 755 $(DESTDIR)/$$p ; done

installtasker: $(TASKER)
	mkdir -p $(TASKERDIR)
	for p in $(TASKER); do ln -s $(DESTDIR)/$$p $(TASKERDIR)/$$p || : ; done
