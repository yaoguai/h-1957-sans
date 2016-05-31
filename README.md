H-1957 Sans
===========

H-1957 Sans is a fork of the Nimbus Sans L fonts. The fonts have been converted
from Type 1 fonts to FontForge SFD, and expanded to include all necessary
glyphs added for romanized Chinese, Pali, and Sanskrit. No new glyphs have been
drawn, to ensure that the original quality of the font is preserved.

Build scripts are included for generating common font formats such as TTF,
WOFF, and WOFF2. The fonts are auto-hinted with ttfautohint. Scripts are also
included for generating subsets of the fonts for faster downloading when used
as web fonts.

Nimbus Sans L is a take on the classic 1957 san-serif typeface Helvetica, as
produced by German type foundry URW++. Several faces of Nimbus Sans L were
donated by URW++ to the GhostScript project, which aims at a free
implementation of the PostScript standard. Although Nimbus San L was issued by
URW++, the actual font sources were from Adobe. As a result, Adobe Helvetica,
Linotype Helvetica, URW Nimbus Sans L, and H-1957 Sans all basically look the
same.

## Provenance

The version of Nimbus Sans L used for these fonts has been imported from the
GhostScript GhostPDL project Type 1 fonts (May 2016).

## Licensing

Like the original GhostScript font, H-1957 Sans is released under the GNU
AGPLv3, with a special font exception. For more details, see COPYING.md and
AGPLv3.txt.

## Methodology

The methodology used to create a new form of these fonts is very conservative.
Each major stage of formatting and development is clearly separated into
separate directories.

- 1_original_type1: Original PostScript Type 1 fonts from URW++
- 2_unicode_sfd: FontForge sources for the original fonts (Unicode mapping)
- 3_revised_sfd: FontForge sources for the expanded fonts
- 4_revised_build: Fonts built from source
- 5_revised_small: Fonts with non-essential glyphs removed (Web)

## Building

The fonts included here have already been built. If you wish to build your own
copies of the fonts, then the following are assumed:

- Unix-like environment
- FontForge
- ttfautohint
- woff2_compress (for making WOFF2 webfonts)

You can run "make" to build all fonts.

You can run "make clean" to remove all generated fonts.
