#!/bin/bash

# Translation generator
echo "Start..."
LANGS=(ru en uk)

for lang in ${LANGS[*]}
do
    echo "Working on '$lang'..."
    dart run arb_merge --sources translations/langs/$lang --destination assets/generated/translations --pattern '{lang}.json'
    # merge with common translation
    TMPFILE=assets/generated/translations/$lang'_tmp'.json
    DESTFILE=assets/generated/translations/$lang.json
    jq -s '.[0] * .[1]' assets/generated/translations/$lang.json translations/langs/common/*.json > $TMPFILE
    # replace files after merge
    mv -ifv $TMPFILE $DESTFILE
    echo ""
done

echo "Done!"

# The MIT License (MIT)
#
# Copyright (c) 2026-present Pavlo Kolomiitsev
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#
# @author p.kolomeitsev@gmail.com
# @site https://pkolomeitsev.blogspot.com
# @github https://github.com/pkolomeitsev/psalter