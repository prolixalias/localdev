# localdev terraform

FROM prolixalias/localdev-puppet:v0.0.1f

USER localdev
ARG TERRAFORM_VERSION="1.1.3"
RUN curl -O https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_$(dpkg --print-architecture).zip && \
    sudo unzip terraform_${TERRAFORM_VERSION}_linux_$(dpkg --print-architecture).zip && \
    sudo mv ~/terraform /usr/local/bin && \
    rm -f ~/terraform_${TERRAFORM_VERSION}_linux_$(dpkg --print-architecture).zip && \
    sudo apt clean && \
    sudo rm -rf /var/lib/apt/lists/* /var/cache/apt/*
ENTRYPOINT /usr/bin/zsh
