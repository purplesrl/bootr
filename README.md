# bootr
A rescue OS based on Alpine Linux

Configurations

Authorized keys:

When the ISO a generated, an RSA keypair will also be generated, the private key can be found in the iso directory. You can use this private key to login into the system as root.

If you want to replace the existing authorized_keys file, you can place your custom file in:

configs/authorized_keys

Startup scripts:

configs/startup/*

Networking configuration:

configs/network/*

Openvpn servers:

configs/openvpn/*

Alternative configs on the CD-DROM, which normally should be mounted as /media/cdrom:

If these configs exists, they will be copied in place of the ones that were initially included:

/media/cdrom/configs/authorized_keys
/media/cdrom/configs/network/
/media/cdrom/configs/openvpn/
/media/cdrom/configs/startup/

These are useful in case you are using an USB stick and do not want to rebuild your ISO.

