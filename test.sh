#!/bin/bash

fake-pkg() {
  cat << EOF > $1-control
Section: misc
Priority: optional
Standards-Version: 3.9.2
Package: $1
Provides: $1
Version: 2:${ERLANGVERSION}
Description: Fake $1 package to appease package builder
EOF
  equivs-build $1-control
}

for pkg in \
      erlang-dev; do
    ERLANGVERSION=99.99.99 fake-pkg $pkg
done
