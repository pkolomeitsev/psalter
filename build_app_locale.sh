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