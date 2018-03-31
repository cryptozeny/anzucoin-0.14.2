
Debian
====================
This directory contains files used to package anzucoind/anzucoin-qt
for Debian-based Linux systems. If you compile anzucoind/anzucoin-qt yourself, there are some useful files here.

## anzucoin: URI support ##


anzucoin-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install anzucoin-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your anzucoin-qt binary to `/usr/bin`
and the `../../share/pixmaps/anzucoin128.png` to `/usr/share/pixmaps`

anzucoin-qt.protocol (KDE)

