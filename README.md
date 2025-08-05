# podman-freeipa-client
This is a work in progress..
## setup
FreeIPA assigns users UIDs and GIDs that are outside the normal range configured in /etc/subuid and /etc/subgid.
To switch to a FreeIPA-managed user inside a rootless Podman container, you need to extend this range on the host for the user running Podman.

You can learn more about subuids and subgids [here](https://www.funtoo.org/LXD/What_are_subuids_and_subgids%3F).

Update subuid and subgid ranges
Edit /etc/subuid and /etc/subgid to extend the range for the Podman user, for example:

```sh
username:100000:1200000000
```

build the image running

```sh
podman image build -t alma-ipa-client .
```
run the client running

```sh
podman run --detach --name ipa-client2 --network ipa-network --hostname=client2.example.test alma-ipa-client
```

This container runs systemd as PID 1 inside the container using /sbin/init.
Systemd is required as ipa-client-install expects a system environment with service management.

When the container starts: /sbin/init launches systemd.  The `ipa-enroll.service` run after the network is online to handle FreeIPA client enrollment.
