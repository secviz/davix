#!/bin/sh

ISO_INPUT=""
ISO_OUTPUT=""

DPMI=""
TMP_DIR=""

while [[ ! -z "$1" ]]; do
	case "$1" in
		"-i")
			ISO_INPUT="$2"
			shift
			;;

		"-o")
			ISO_OUTPUT="$2"
			shift
			;;

		"-t")
			TMP_DIR="$2"
			shift
			;;

		"-d")
			DPMI="$2"
			shift
			;;

		*)
			;;
	esac

	shift
done

# at the moment all four options need to be specified, but I should make them
# have certain default values at some point
if \
	[[ -z "$ISO_INPUT" ]] || \
	[[ -z "$ISO_OUTPUT" ]] || \
	[[ -z "$TMP_DIR" ]] || \
	[[ -z "$DPMI" ]];
then
	echo "Not enough options specified."
	exit
fi

# make temp structure
mkdir -p $TMP_DIR/chroot
mkdir -p $TMP_DIR/loop
mkdir -p $TMP_DIR/new
mkdir -p $TMP_DIR/build

# mount ISO to extract
mount -t iso9660 -o ro "$ISO_INPUT" "$TMP_DIR/loop"

# extract the squashfs from the ISO
cd "$TMP_DIR/chroot"
unsquashfs "$TMP_DIR/loop/install/filesystem.squashfs"
mv "$TMP_DIR/chroot/squashfs-root/"* "$TMP_DIR/chroot"
rmdir "$TMP_DIR/chroot/squashfs-root"

# prepare the chroot for script execution
mkdir "$TMP_DIR/chroot/dpmi"
mount --bind "$DPMI" "$TMP_DIR/chroot/dpmi"
mount --bind /dev "$TMP_DIR/chroot/dev"
mount --bind /proc "$TMP_DIR/chroot/proc"
mount --bind /sys "$TMP_DIR/chroot/sys"
mount --bind /tmp "$TMP_DIR/chroot/tmp"

# copy networking config in temporarily for downloads
cp /etc/hosts "$TMP_DIR/chroot/etc/hosts"
cp /etc/resolv.conf "$TMP_DIR/chroot/etc/resolv.conf"

# execute davix installer
chroot "$TMP_DIR/chroot" /bin/bash /dpmi/install/davix-install-all.sh

# unmount chroot binds
umount "$TMP_DIR/chroot/dev"
umount "$TMP_DIR/chroot/proc"
umount "$TMP_DIR/chroot/sys"
umount "$TMP_DIR/chroot/tmp"
umount "$TMP_DIR/chroot/dpmi"
rm "$TMP_DIR/chroot/etc/hosts"
rm "$TMP_DIR/chroot/etc/resolv.conf"
cp -a "$TMP_DIR/chroot/"* "$TMP_DIR/build"
cp -a "$TMP_DIR/new/"* "$TMP_DIR/build/install"

# create squashfs from build directory
cd "$TMP_DIR/build"
mksquashfs "$TMP_DIR/chroot" "$TMP_DIR/new/filesystem.squashfs"
du -sx --block-size=1 "$TMP_DIR/chroot" > "$TMP_DIR/new/filesystem.size"

# copy the rest of the ISO to the build directory
cp -a "$TMP_DIR/loop/"* "$TMP_DIR/build"
cp -a "$TMP_DIR/new/"* "$TMP_DIR/build/install"

# make ISO
cd "$TMP_DIR/build"
mkisofs -r -V DAVIX -cache-inodes -J -l -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -o "$ISO_OUTPUT" .

# unmount everything
umount "$TMP_DIR/loop"
rmdir "$TMP_DIR/loop"

# clean up temporary directory
rm -rf "$TMP_DIR"
