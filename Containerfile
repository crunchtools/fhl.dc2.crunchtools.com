FROM quay.io/hummingbird-community/bootc-os

# Developer tools and build dependencies for kernel exploit testing (Dirty Frag)
# Note: vim, cockpit, strace, perf, bpftool not in hummingbird repo
RUN dnf install -y --nodocs \
        gcc \
        glibc-devel \
        make \
        git \
        gdb \
        binutils \
        findutils \
        python3-pip \
        less \
        file \
        which \
        tar \
        curl && \
    dnf clean all && \
    rm -rf /var/cache/dnf

# Shell customizations
COPY etc/bashrc.customizations /etc/bashrc.customizations

# System configuration
RUN systemctl set-default multi-user.target && \
    systemctl enable fstrim.timer && \
    ln -s /usr/share/zoneinfo/America/New_York /etc/localtime && \
    cat /etc/bashrc.customizations >> /etc/bashrc

# Cleanup transient build artifacts and dnf cache residue
RUN rm -rf /var/log/*.log /var/log/dnf* /var/log/hawkey* /tmp/* /var/tmp/* /root/.cache \
        /run/dnf /var/cache/ldconfig /var/cache/libdnf5

# Final lint step
RUN bootc container lint
