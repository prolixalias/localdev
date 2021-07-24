# localdev terraform

FROM prolixalias/localdev:latest

USER localdev
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add - && \
    sudo apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main" && \
    sudo apt update -qqy && \
    sudo apt upgrade -qqy && \
    sudo apt install -qqy terraform && \
    sudo apt clean && \
    sudo apt -qqy install  && \
    sudo rm -rf /var/lib/apt/lists/* /var/cache/apt/*
ENTRYPOINT /usr/bin/zsh
