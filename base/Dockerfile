# localdev base

FROM ubuntu:jammy AS base

ARG DEBIAN_FRONTEND=noninteractive
ENV LANG=en_US.UTF-8
RUN apt update && \
    apt upgrade -qqy && \
    apt install -qqy build-essential curl fish git htop jq less locales lsof man-db multitail nano ninja-build software-properties-common ssl-cert sudo time tmux tree unzip vim wget zip zsh zsh-autosuggestions && \
    locale-gen en_US.UTF-8 && \
    apt clean && \
    rm -rf /var/lib/apt/lists/* && \
    # '-l': see https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#user
    useradd -l -u 33333 -G sudo -md /home/localdev -s /bin/bash -p localdev localdev && \
    # passwordless 'sudo' group
    # sed -i.bkp -e 's/%sudo\s\+ALL=(ALL\(:ALL\)\?)\s\+ALL/%sudo ALL=NOPASSWD:ALL/g' /etc/sudoers && \
    echo "localdev ALL=NOPASSWD:ALL" > /etc/sudoers.d/localdev && \
    chmod 0440 /etc/sudoers.d/localdev && \
    usermod -s $(which zsh) localdev

FROM base AS user

USER localdev
ENV HOME=/home/localdev
WORKDIR $HOME
RUN sudo echo 'source .zshrc' >> ~/.profile
COPY .zshrc /home/localdev/.zshrc
