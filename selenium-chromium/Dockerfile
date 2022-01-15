# localdev selenium chromium

FROM prolixalias/localdev:v0.0.1c

USER localdev
RUN sudo apt update -qqy && \
    sudo apt upgrade -qqy && \
    sudo apt install -qqy chromium-browser python3 python3-pip libnss3-tools libnss3-dev && \
    pip install selenium bs4 html5lib datetime && \
    sudo apt clean && \
    sudo rm -rf /var/lib/apt/lists/* /var/cache/apt/*
ENTRYPOINT /usr/bin/zsh