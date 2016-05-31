#!/usr/bin/env fontforge

import sys
import fontforge


def print_metadata(font_path):
    font = fontforge.open(font_path)
    print('Font name: {}'.format(font.fontname))
    print('Family name: {}'.format(font.familyname))
    print('Full name: {}'.format(font.fullname))
    print('Weight: {}'.format(font.weight))
    print('Version: {}'.format(font.version))
    print('Copyright: {}'.format(font.copyright))
    font.close()


def main(argv):
    print_metadata(sys.argv[1])


if __name__ == '__main__':
    sys.exit(main(sys.argv))
