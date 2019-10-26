# bootr
A rescue OS based on Alpine Linux

bootr is designed for rescue situations when you are not able to access a remote system normally, it can be used to boot, attempt an Internet connection and start an OpenVPN client to a remote server from which you can connect back using SSH.

## Configuration

### Authorized keys

When the ISO a generated, an RSA keypair will also be generated, the private key can be found in the iso directory. You can use this private key to login into the system as root.

If you want to replace the existing authorized_keys file, you can place your custom file in:

```
configs/authorized_keys
```

### Startup Scripts

```
configs/startup/*
```

### Network Configuration Files

```

configs/network/*

```

### Openvpn Configuration Files

```
configs/openvpn/*
```

## Alternative Configuration

Normally the ISO should be mounted as /media/cdrom, the bootstrap script will check for configuration files there.

If these configuration files exists, they will be copied in place of the ones that were initially included:

```
/media/cdrom/configs/authorized_keys
/media/cdrom/configs/network/
/media/cdrom/configs/openvpn/
/media/cdrom/configs/startup/
```

These are useful in case you are using an USB stick and do not want to rebuild your ISO.

