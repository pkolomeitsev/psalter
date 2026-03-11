#!/bin/bash

# Translation generator
echo "Start..."
dart run arb_merge --sources translations/langs/ru --destination assets/generated/translations --pattern '{lang}.json'
echo ""
dart run arb_merge --sources translations/langs/en --destination assets/generated/translations --pattern '{lang}.json'
echo ""
dart run arb_merge --sources translations/langs/cu --destination assets/generated/translations --pattern '{lang}.json'
echo ""
dart run arb_merge --sources translations/langs/uk --destination assets/generated/translations --pattern '{lang}.json'
echo ""

echo "Done!"