#!/bin/sh -e

HOSTNAME="bootr-$ALPINE_VERSION-$ARCH"
BOOTSTRAP="/build/aports/scripts/bootstrap.start"
BOOTR_CONFIGS="/build/configs"
SSH_KEYS_DIR="/build/.abuild"
ISO_DIR="/build/iso"

cleanup() {
	rm -rf "$tmp"
}

makefile() {
	OWNER="$1"
	PERMS="$2"
	FILENAME="$3"
	cat > "$FILENAME"
	chown "$OWNER" "$FILENAME"
	chmod "$PERMS" "$FILENAME"
}

rc_add() {
	mkdir -p "$tmp"/etc/runlevels/"$2"
	ln -sf /etc/init.d/"$1" "$tmp"/etc/runlevels/"$2"/"$1"
}

tmp="$(mktemp -d)"
trap cleanup EXIT

mkdir -p "$tmp"/etc
makefile root:root 0644 "$tmp"/etc/hostname <<EOF
$HOSTNAME
EOF

mkdir -p "$tmp"/etc/local.d
mkdir -p "$tmp"/etc/bootr

cp $BOOTSTRAP "$tmp"/etc/local.d
cp -r $BOOTR_CONFIGS "$tmp"/etc/bootr

mkdir -p "$tmp"/etc/network
mkdir -p "$tmp"/etc/openvpn

mkdir -p "$tmp"/etc/apk
makefile root:root 0644 "$tmp"/etc/apk/world <<EOF
alpine-base
nano
openvpn
openssh
EOF

echo $ALPINE_REPO >> "$tmp/etc/apk/repositories"

mkdir -p "$tmp"/root/.ssh
ssh-keygen -i -m PKCS8 -f $SSH_KEYS_DIR/*.pub > "$tmp"/root/.ssh/authorized_keys
cp $SSH_KEYS_DIR/*.rsa $ISO_DIR

rc_add devfs sysinit
rc_add dmesg sysinit
rc_add mdev sysinit
rc_add hwdrivers sysinit
rc_add modloop sysinit

rc_add hwclock boot
rc_add modules boot
rc_add sysctl boot
rc_add hostname boot
rc_add bootmisc boot
rc_add syslog boot
rc_add local boot
rc_add networking boot
rc_add openvpn boot
rc_add sshd boot

rc_add mount-ro shutdown
rc_add killprocs shutdown
rc_add savecache shutdown

tar -c -C "$tmp" etc root | gzip -9n > $HOSTNAME.apkovl.tar.gz
