DIST_NAME=H-1957-sans

.PHONY: all clean dist distclean fonts webfonts

all: fonts

dist: fonts
	rm -rf -- dist/*
	mkdir -p -m 0755 dist/$(DIST_NAME)
	cp -a 1_original_type1 dist/$(DIST_NAME)
	cp -a 2_unicode_sfd dist/$(DIST_NAME)
	cp -a 3_revised_sfd dist/$(DIST_NAME)
	cp -a 4_revised_build dist/$(DIST_NAME)
	cp -a 5_revised_small dist/$(DIST_NAME)
	cp -a AGPLv3.txt dist/$(DIST_NAME)
	cp -a COPYING.md dist/$(DIST_NAME)
	cp -a HISTORY.md dist/$(DIST_NAME)
	cp -a Makefile dist/$(DIST_NAME)
	cp -a NOTES.md dist/$(DIST_NAME)
	cp -a README.md dist/$(DIST_NAME)
	cp -a scripts dist/$(DIST_NAME)
	cd dist && zip -9r $(DIST_NAME).zip $(DIST_NAME)
	rm -rf -- dist/$(DIST_NAME)

distclean:
	rm -rf -- dist/*

fonts:
	./4_revised_build/build.sh
	./5_revised_small/build.sh

clean:
	rm -rf -- dist/*
	./4_revised_build/clean.sh
	./5_revised_small/clean.sh
