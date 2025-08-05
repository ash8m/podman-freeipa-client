# Build on top of base AlmaLinux 9 image
FROM docker.io/almalinux/9-init

RUN dnf -y update && \
    dnf -y install freeipa-client && \
    dnf clean all

# Add custom systemd service
COPY ipa-enroll.service /etc/systemd/system/ipa-enroll.service
COPY ipa-enroll.sh /usr/local/bin/ipa-enroll.sh
RUN chmod +x /usr/local/bin/ipa-enroll.sh && \
    systemctl enable ipa-enroll.service

ENTRYPOINT ["/usr/sbin/init"]
