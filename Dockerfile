# base localdev

FROM ubuntu:focal AS base

ARG DEBIAN_FRONTEND=noninteractive
ENV LANG=en_US.UTF-8
RUN apt update && \
    apt upgrade -y && \
    apt install -y build-essential curl fish git htop jq less locales lsof man-db multitail nano ninja-build software-properties-common ssl-cert sudo time tmux unzip vim wget zip zsh zsh-autosuggestions && \
    locale-gen en_US.UTF-8 && \
    wget https://apt.puppet.com/puppet-tools-release-focal.deb && \
    wget https://apt.puppetlabs.com/puppet6-release-focal.deb && \
    dpkg -i puppet6-release-focal.deb && \
    dpkg -i puppet-tools-release-focal.deb && \
    apt update && \
    apt install -y pdk puppet-agent puppet-bolt && \
    rm -f puppet6-release-bionic.deb puppet-tools-release-bionic.deb && \
    apt clean && \
    rm -rf /var/lib/apt/lists/* && \
    # '-l': see https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#user
    useradd -l -u 33333 -G sudo -md /home/localdev -s /bin/bash -p localdev localdev && \
    # passwordless 'sudo' group
    sed -i.bkp -e 's/%sudo\s\+ALL=(ALL\(:ALL\)\?)\s\+ALL/%sudo ALL=NOPASSWD:ALL/g' /etc/sudoers && \
    usermod -s $(which zsh) localdev && \
    /opt/puppetlabs/puppet/bin/gem install homesick puppet-debugger hub -N && \
    ln -s /opt/puppetlabs/puppet/bin/homesick /usr/local/bin/homesick

FROM base AS user

USER localdev
ENV HOME=/home/localdev
WORKDIR $HOME
RUN sudo echo 'source .zshrc' >> ~/.profile
COPY .zshrc /home/localdev/.zshrc
