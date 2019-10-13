profile_bootr() {
        profile_standard
        kernel_cmdline="console=tty0 console=ttyS0,115200"
        syslinux_serial="0 115200"
        kernel_addons="zfs spl"
        apks="$apks iscsi-scst zfs-scripts zfs zfs-utils-py 
                cciss_vol_status lvm2 mdadm mkinitfs mtools nfs-utils
                parted rsync sfdisk syslinux unrar util-linux xfsprogs
                dosfstools ntfs-3g
		nano openvpn
                "
        local _k _a
        for _k in $kernel_flavors; do
                apks="$apks linux-$_k"
                for _a in $kernel_addons; do
                        apks="$apks $_a-$_k"
                done
        done
        apks="$apks linux-firmware"
        apkovl="genapkovl-bootr.sh"
}
