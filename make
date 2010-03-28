#!/bin/sh

FORMAT='iso'

if [ "${2}" = "i686" -o "${2}" = "x86_64" ]; then
	ARCH=$2
else
	ARCH=i686
fi

WORKDIR=".working-${ARCH}"

CDNAME="$(basename $PWD)"
DATE="$(date +%F)"
PACKAGES="$(cat packages.list)"
OUTPUT="./$CDNAME-${DATE}-${ARCH}.$FORMAT"

case $FORMAT in
	iso)
		mkarchiso -p "$PACKAGES" create "$WORKDIR"

		cp -r root-overlay/* "$WORKDIR"/root-image
		cp -r overlay "$WORKDIR"

		mkdir -p $WORKDIR/iso/boot
		cp $WORKDIR/root-image/boot/System.map26 $WORKDIR/iso/boot/
		cp $WORKDIR/root-image/boot/vmlinuz26 $WORKDIR/iso/boot/
		cp -r boot-files/* $WORKDIR/iso/boot/
		cp $WORKDIR/root-image/usr/lib/syslinux/*.c32 $WORKDIR/iso/boot/isolinux/
		cp $WORKDIR/root-image/usr/lib/syslinux/isolinux.bin $WORKDIR/iso/boot/isolinux/
		cp $WORKDIR/root-image/usr/lib/syslinux/memdisk $WORKDIR/iso/boot/isolinux/

		mkinitcpio -c ./mkinitcpio.conf -b "$WORKDIR"/root-image -g "$WORKDIR"/iso/boot/kernel26.img

		mkarchiso -f -L "$CDNAME" -P "$PUBLISHER" -A "$CDNAME" "$FORMAT" "$WORKDIR" "$OUTPUT"

		ln -f "$OUTPUT" ./image.iso
	;;
	img)
	;;
	*);;
esac
