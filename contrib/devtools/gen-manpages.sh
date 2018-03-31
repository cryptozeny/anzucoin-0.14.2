#!/bin/sh

TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
SRCDIR=${SRCDIR:-$TOPDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

ANZUCOIND=${ANZUCOIND:-$SRCDIR/anzucoind}
ANZUCOINCLI=${ANZUCOINCLI:-$SRCDIR/anzucoin-cli}
ANZUCOINTX=${ANZUCOINTX:-$SRCDIR/anzucoin-tx}
ANZUCOINQT=${ANZUCOINQT:-$SRCDIR/qt/anzucoin-qt}

[ ! -x $ANZUCOIND ] && echo "$ANZUCOIND not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
ANZUVER=($($ANZUCOINCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for anzucoind if --version-string is not set,
# but has different outcomes for anzucoin-qt and anzucoin-cli.
echo "[COPYRIGHT]" > footer.h2m
$ANZUCOIND --version | sed -n '1!p' >> footer.h2m

for cmd in $ANZUCOIND $ANZUCOINCLI $ANZUCOINTX $ANZUCOINQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${ANZUVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${ANZUVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
