#!/bin/bash

help='usage: license.sh <license-name> [-o]

Echo the given license. You can compare licenses at
    http://choosealicense.com/licenses/

If "-o" is provided, output to LICENSE.txt instead.

Available licenses:
  apache              ! http://choosealicense.com/licenses/apache-2.0/
  gpl, gpl2           ! http://choosealicense.com/licenses/gpl-2.0/
  gpl3                ! http://choosealicense.com/licenses/gpl-3.0/
  agpl, affero-gpl    ! http://choosealicense.com/licenses/agpl-3.0/
  mit                   http://choosealicense.com/licenses/mit/

  artistic            ! http://choosealicense.com/licenses/artistic-2.0/
  eclipse             ! http://choosealicense.com/licenses/epl-1.0/
  bsd                 ! http://choosealicense.com/licenses/bsd-2-clause/
  bsd3                ! http://choosealicense.com/licenses/bsd-3-clause/
  isc                   http://choosealicense.com/licenses/isc/
  lgpl, lgpl2         ! http://choosealicense.com/licenses/lgpl-2.1/
  lgpl3               ! http://choosealicense.com/licenses/lgpl-3.0/
  mozilla             ! http://choosealicense.com/licenses/mpl-2.0/
  cc0                 ! http://choosealicense.com/licenses/cc0/
  unlicense           ! http://choosealicense.com/licenses/unlicense/
'

apache=""

gpl2=""

glp3=""

agpl=""

mit='The MIT License (MIT)

Copyright (c) [year] [fullname]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.'

artistic=""

eclipse=""

bsd=""

bsd3=""

isc='Copyright (c) [year], [fullname] <[email]>

Permission to use, copy, modify, and/or distribute this software for any
purpose with or without fee is hereby granted, provided that the above
copyright notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.'

lgpl2=""

lgpl3=""

mozilla=""

cc0=""

unlicense=""


function output () {
    if [ "$2" == '-o' ]; then
        echo "$1" > 'LICENSE.txt'
    else
        echo "$1"
    fi
}

case "$1" in
    help)
        echo "$help"
        ;;
    mit)
        output "$mit" "$2"
        ;;
    isc)
        output "$isc" "$2"
        ;;
esac

