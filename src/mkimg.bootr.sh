profile_bootr() {
        profile_virt # temporary enabled for fast builds
        # profile_standard
        kernel_cmdline="unionfs_size=128M console=tty0 console=ttyS0,115200"
        syslinux_serial="0 115200"
        kernel_addons="zfs spl"
        apkovl="genapkovl-bootr.sh"
        #apks="$apks iscsi-scst zfs-scripts zfs zfs-utils-py
        #        cciss_vol_status lvm2 mdadm mkinitfs mtools nfs-utils
        #        parted rsync sfdisk syslinux unrar util-linux xfsprogs
        #        dosfstools ntfs-3g
	#	nano openvpn"
        # for test builds
        kernel_addons=""
        apks="$apks openvpn nano"
        return
        local _k _a
        for _k in $kernel_flavors; do
                apks="$apks linux-$_k"
                for _a in $kernel_addons; do
                        apks="$apks $_a-$_k"
                done
        done
        # apks="$apks linux-firmware"
}
