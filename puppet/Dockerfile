# localdev puppet

FROM prolixalias/localdev:v0.0.3c

USER localdev
ARG PUPPET_MAJOR_VERSION="7"
RUN sudo wget https://apt.puppet.com/puppet-tools-release-focal.deb && \
    sudo dpkg -i puppet-tools-release-focal.deb && \
    sudo wget https://apt.puppet.com/puppet${PUPPET_MAJOR_VERSION}-release-focal.deb && \
    sudo dpkg -i puppet${PUPPET_MAJOR_VERSION}-release-focal.deb && \
    sudo apt update && \
    sudo apt install -qqy pdk && \
    sudo apt install -qqy puppet-agent && \
    sudo apt install -qqy puppet-bolt && \
    sudo rm -f puppet-tools-release-focal.deb && \
    sudo rm -f puppet${PUPPET_MAJOR_VERSION}-release-focal.deb && \
    sudo apt clean && \
    sudo rm -rf /var/lib/apt/lists/* && \
    sudo /opt/puppetlabs/puppet/bin/gem install puppet-debugger hub -N && \
    sudo /opt/puppetlabs/puppet/bin/gem install r10k && \
    sudo ln -s /opt/puppetlabs/puppet/bin/puppet /usr/local/bin/puppet && \
    sudo ln -s /opt/puppetlabs/puppet/bin/r10k /usr/local/bin/r10k
ENTRYPOINT /usr/bin/zsh
