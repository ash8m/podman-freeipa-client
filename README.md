# podman-freeipa-client
## setup

build the image running
`podman image build -t alma-ipa-client .`

run the client running
`podman run --detach --name ipa-client2 --network ipa-network --hostname=client2.example.test alma-ipa-client`
