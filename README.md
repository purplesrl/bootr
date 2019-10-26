# bootr
A rescue OS based on Alpine Linux

Configurations

Startup scripts:

/etc/bootr/configs/startup/*

Networking configuration:

/etc/bootr/configs/network/

Openvpn servers:

/etc/bootr/configs/openvpn/*

Alternative configs

If these configs exists, they will be copied in place of the ones that were initially included:

/media/cdrom/configs/network/
/media/cdrom/configs/openvpn/
/media/cdrom/configs/startup/

These are useful in case you are using an USB stick and do not want to rebuild your ISO.

