#!/bin/bash

maestro list-devices

# Run emulator instance [should be preinstalled]
maestro start-device --platform="ios" --os-version="26-5" --device-model="iPhone-17" --device-locale="en_US" --force-create \
  && echo "Wait until device loaded (30 sec)..." \
  && sleep 30 \
  && echo "Build App..." \
  && flutter install -d "Maestro_IOS_iPhone-17_26" \
  && echo "Run tests..." \
  && maestro --platform=ios test -e LANG=en -e DEVICE=ios maestro/screenshots.yaml \
  && echo "Emulator shutdown..." \
  && xcrun simctl shutdown booted

# RU locale
maestro start-device --platform="ios" --os-version="26-5" --device-model="iPhone-17" --device-locale="ru_RU" --force-create \
  && echo "Wait until device loaded (30 sec)..." \
  && sleep 30 \
  && echo "Build App..." \
  && flutter install -d "Maestro_IOS_iPhone-17_26" \
  && echo "Run tests..." \
  && maestro --platform=ios test -e LANG=ru -e DEVICE=ios maestro/screenshots.yaml \
  && echo "Emulator shutdown..." \
  && xcrun simctl shutdown booted

# UK locale
maestro start-device --platform="ios" --os-version="26-5" --device-model="iPhone-17" --device-locale="uk_UA" --force-create \
  && echo "Wait until device loaded (30 sec)..." \
  && sleep 30 \
  && echo "Build App..." \
  && flutter install -d "Maestro_IOS_iPhone-17_26" \
  && echo "Run tests..." \
  && maestro --platform=ios test -e LANG=uk -e DEVICE=ios maestro/screenshots.yaml \
  && echo "Emulator shutdown..." \
  && xcrun simctl shutdown booted

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