FROM archlinux:latest

# Install python packages.
ENV PIPX_HOME=/opt/pipx
ENV PIPX_BIN_DIR=/usr/local/bin
RUN pacman -Syu python python-pip python-pipx --noconfirm && \
    pipx install yq && \
    pipx install sslyze && \
    pacman -Scc --noconfirm && \
    rm -rf /var/lib/pacman/sync/* && \
    rm -rf /var/cache/pacman/pkg/* && \
    rm -rf /var/log/* && \
    rm -rf /var/tmp/* && \
    rm -rf /tmp/*

# Install archlinux packages.
RUN pacman -Syu jc jq --noconfirm && \
    pacman -Scc --noconfirm && \
    rm -rf /var/lib/pacman/sync/* && \
    rm -rf /var/cache/pacman/pkg/* && \
    rm -rf /var/log/* && \
    rm -rf /var/tmp/* && \
    rm -rf /tmp/*