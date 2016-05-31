#!/bin/sh
#
# REQUIRED TOOLS:
# - fontforge
# - ttfautohint
# - mkeot
# - woff2_compress

cd $(dirname "$0") || exit 1

SRC_DIR='../3_revised_sfd'

gen_font () {
	../scripts/generate-font-as.pe "$1" "$2" || exit 1
}

autohint () {
	tmpfile=$(mktemp /tmp/autohint.XXXXXXXXX.ttf) || exit 1
	ttfautohint -v "$1" "$tmpfile" || exit 1
	chmod -- 644 "$tmpfile"
	mv "$tmpfile" "$1" || exit 1
}

gen_all_sfd () {
	cp "${SRC_DIR}/H1957Sans-Regular.sfd" H1957Sans-Regular.sfd
	cp "${SRC_DIR}/H1957Sans-Italic.sfd" H1957Sans-Italic.sfd
	cp "${SRC_DIR}/H1957Sans-Bold.sfd" H1957Sans-Bold.sfd
	cp "${SRC_DIR}/H1957Sans-BoldItalic.sfd" H1957Sans-BoldItalic.sfd
}

minimize_all_sfd () {
	./minimize.pe H1957Sans-Regular.sfd
	./minimize.pe H1957Sans-Italic.sfd
	./minimize.pe H1957Sans-Bold.sfd
	./minimize.pe H1957Sans-BoldItalic.sfd
}

gen_all_ttf () {
	for face in Regular Italic Bold BoldItalic; do
		gen_font "H1957Sans-${face}.sfd" "H1957Sans-${face}.ttf"
		autohint "H1957Sans-${face}.ttf"
	done
}

gen_all_eot () {
	for face in Regular Italic Bold BoldItalic; do
		mkeot "H1957Sans-${face}.ttf" > "H1957Sans-${face}.eot"
	done
}

gen_all_woff () {
	for face in Regular Italic Bold BoldItalic; do
		gen_font "H1957Sans-${face}.ttf" \
			"H1957Sans-${face}.woff"
	done
}

gen_all_woff2 () {
	for face in Regular Italic Bold BoldItalic; do
		woff2_compress "H1957Sans-${face}.ttf"
	done
}

main () {
	gen_all_sfd
	minimize_all_sfd
	gen_all_ttf
	# gen_all_eot
	gen_all_woff
	gen_all_woff2
	rm -fv -- *.sfd
}

main "$@"
