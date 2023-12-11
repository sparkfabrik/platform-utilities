FROM archlinux:latest

# Install python packages.
ENV PIPX_HOME=/opt/pipx
ENV PIPX_BIN_DIR=/usr/local/bin
COPY ./src/python.pkgs /python.pkgs
RUN pacman -Syu python python-pip python-pipx --noconfirm && \
    for pkg in $(cat /python.pkgs); do pipx install $pkg; done && \
    pacman -Scc --noconfirm && \
    rm -rf /var/lib/pacman/sync/* && \
    rm -rf /var/cache/pacman/pkg/* && \
    rm -rf /var/log/* && \
    rm -rf /var/tmp/* && \
    rm -rf /tmp/*

# Install archlinux packages.
COPY ./src/arch.pkgs /arch.pkgs
RUN pacman -Syu $(cat /arch.pkgs) --noconfirm && \
    pacman -Scc --noconfirm && \
    rm -rf /var/lib/pacman/sync/* && \
    rm -rf /var/cache/pacman/pkg/* && \
    rm -rf /var/log/* && \
    rm -rf /var/tmp/* && \
    rm -rf /tmp/*