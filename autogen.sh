#!/bin/sh

set -ex

test -z "$srcdir" && srcdir=$(dirname "$0")
test -z "$srcdir" && srcdir=.

cwd=$(pwd)
cd "$srcdir"

./update.sh || exit $?

mkdir -p m4
autoreconf --verbose --force --install || exit $?

cd "$cwd"
test -z "$NOCONFIGURE" && "$srcdir/configure" $@
