---
layout: post
title: Generating Coverage Information
---

Just a dump for now with commands that were used to generate a coverage report
using gcov/lcov.

```bash
CFLAGS="-g -O0 --coverage" ./autogen.sh
make
lcov --base-directory . --directory . --zerocounters -q
make check
lcov --directory . -c -o dcs.info
lcov --remove dcs.info "/usr*" -o dcs.info
if [[ -d coverage ]]; then rm -rf coverage; fi
genhtml -o coverage -t "dcs test coverage" --num-spaces 4 dcs.info
```
